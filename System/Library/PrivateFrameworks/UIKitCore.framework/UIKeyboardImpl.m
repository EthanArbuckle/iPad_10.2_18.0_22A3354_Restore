@implementation UIKeyboardImpl

- (void)layoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardImpl;
  -[UIView layoutSubviews](&v2, sel_layoutSubviews);
}

+ (id)activeInstance
{
  return (id)qword_1ECD783D8;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  BOOL v10;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v8 = CGRectGetWidth(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = CGRectGetWidth(v13);
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardImpl;
  -[UIView setBounds:](&v11, sel_setBounds_, x, y, width, height);
  v10 = self->m_updatingLayout || v8 == v9;
  if (!v10 && width != 0.0 && height != 0.0)
  {
    if (_UIApplicationIsFirstPartyStickers())
      -[UIKeyboardImpl updateLayoutIfNecessary](self, "updateLayoutIfNecessary");
  }
}

id __27__UIKeyboardImpl_setFrame___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UIKeyboardImpl;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)disableInputBars
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "disableInputBars"))
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v4, "isDevicePasscodeEntry") & 1) != 0 || -[UIKeyboardImpl isMinimized](self, "isMinimized");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)keyboardIsKeyPad
{
  void *v2;
  unsigned int v3;
  BOOL v5;

  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardType");
  v5 = v3 <= 0xB && ((1 << v3) & 0x930) != 0 || v3 == 127;

  return v5;
}

+ (BOOL)rivenPreference
{
  return byte_1ECD783C4;
}

- (BOOL)isMinimized
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;
  id WeakRetained;
  id v11;
  char v12;

  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rtiInputSourceState");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");

    if (!v6)
    {
      -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rtiInputSourceState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v8, "minimized");
LABEL_14:

      return v9;
    }
  }
  else
  {

  }
  v9 = -[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached");
  WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
    v12 = objc_msgSend(v11, "isMinimized");

    if ((v12 & 1) == 0)
      goto LABEL_10;
  }
  else if (!v9)
  {
    return v9;
  }
  if (-[UIKeyboardImpl floatingForced](self, "floatingForced"))
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9;
  }
  if (!-[UIKeyboardImpl _shouldSuppressSoftwareKeyboard](self, "_shouldSuppressSoftwareKeyboard"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentInputMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "showSWLayoutWithHWKeyboard") ^ 1;
    goto LABEL_14;
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)autocorrectionPreference
{
  return -[_UIKeyboardStateManager autocorrectionPreference](self->_keyboardStateManager, "autocorrectionPreference");
}

- (BOOL)showingEmojiSearch
{
  return -[_UIKeyboardStateManager showingEmojiSearch](self->_keyboardStateManager, "showingEmojiSearch");
}

- (BOOL)isInHardwareKeyboardMode
{
  return -[_UIKeyboardStateManager isInHardwareKeyboardMode](self->_keyboardStateManager, "isInHardwareKeyboardMode");
}

+ (BOOL)isFloating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  int v10;

  objc_msgSend(a1, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteTextInputPartner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtiInputSourceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTextInputPartner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rtiInputSourceState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "floating");

    LOBYTE(v10) = v9;
  }
  else if (byte_1ECD783D0)
  {
    v10 = objc_msgSend(a1, "supportsFloating");
    if (v10)
    {
      if (objc_msgSend((id)qword_1ECD783D8, "isMinimized")
        && (objc_msgSend((id)qword_1ECD783D8, "isFloatingLocked") & 1) == 0)
      {
        LOBYTE(v10) = objc_msgSend((id)qword_1ECD783D8, "maximizing");
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (UIKBRTIPartner)remoteTextInputPartner
{
  return -[_UIKeyboardStateManager remoteTextInputPartner](self->_keyboardStateManager, "remoteTextInputPartner");
}

+ (void)performWithoutFloatingLock:(id)a3
{
  void *v3;
  void (**v4)(_QWORD);
  uint64_t v5;

  v3 = (void *)qword_1ECD783D8;
  v4 = (void (**)(_QWORD))a3;
  v5 = objc_msgSend(v3, "isFloatingLocked");
  objc_msgSend((id)qword_1ECD783D8, "setLockFloating:", 0);
  v4[2](v4);

  objc_msgSend((id)qword_1ECD783D8, "setLockFloating:", v5);
}

- (void)setLockFloating:(BOOL)a3
{
  self->_lockFloating = a3;
}

- (BOOL)isFloatingLocked
{
  return self->_lockFloating;
}

+ (BOOL)isSplit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v11;

  objc_msgSend(a1, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteTextInputPartner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rtiInputSourceState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTextInputPartner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rtiInputSourceState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "split");

    return v9;
  }
  else
  {
    if (byte_1ECD783C4)
      v11 = byte_1ECD783B0 == 0;
    else
      v11 = 1;
    return !v11 && byte_1ECD783D0 == 0;
  }
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (self->m_showsCandidateBar != a3)
  {
    v3 = a3;
    self->m_showsCandidateBar = a3;
    -[UIKeyboardImpl _postInputResponderChangedNotification](self, "_postInputResponderChangedNotification");
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateInputAssistantViewForInputViewSet:", 0);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "existingContainerRootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateInputAssistantViewForInputViewSet:", 0);

    if (v3)
    {
      -[UIKeyboardImpl candidateController](self, "candidateController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setActiveCandidateViewType:", 2);

      -[UIKeyboardImpl candidateController](self, "candidateController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setRenderConfig:", v10);

    }
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v14 = v11;
        objc_msgSend(v11, "textOperations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setCustomInfoType:", 0x1E17503A0);
        -[UIKeyboardImpl buildInputSourceState](self, "buildInputSourceState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setInputSourceState:", v13);

        objc_msgSend(v14, "flushOperations");
        v11 = v14;
      }

    }
  }
}

+ (id)sharedInstanceForCustomInputView:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[5];

  v3 = a3;
  if (qword_1ECD783D8)
  {
    if (!a3 && objc_msgSend((id)qword_1ECD783D8, "forCustomInputView"))
    {
      objc_msgSend((id)qword_1ECD783D8, "setForCustomInputView:", 0);
      objc_msgSend((id)qword_1ECD783D8, "setInputModeFromPreferences");
    }
  }
  else
  {
    v5 = objc_alloc((Class)a1);
    v6 = objc_msgSend(v5, "initWithFrame:forCustomInputView:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = (void *)qword_1ECD783D8;
    qword_1ECD783D8 = v6;

    objc_msgSend((id)UIApp, "_registerForUserDefaultsChanges");
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardImpl_sharedInstanceForCustomInputView___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD783E0 != -1)
    dispatch_once(&qword_1ECD783E0, block);
  return (id)qword_1ECD783D8;
}

- (BOOL)forCustomInputView
{
  return -[_UIKeyboardStateManager forCustomInputView](self->_keyboardStateManager, "forCustomInputView");
}

+ (id)sharedInstance
{
  return (id)objc_msgSend(a1, "sharedInstanceForCustomInputView:", 0);
}

- (void)flushDelayedTasks
{
  -[_UIKeyboardStateManager flushDelayedTasks](self->_keyboardStateManager, "flushDelayedTasks");
}

- (void)takeTextInputTraitsFromDelegate
{
  -[_UIKeyboardStateManager takeTextInputTraitsFromDelegate](self->_keyboardStateManager, "takeTextInputTraitsFromDelegate");
}

- (id)textInputTraits
{
  return -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
}

- (id)delegateAsResponder
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIKBInputDelegateManager)inputDelegateManager
{
  return -[_UIKeyboardStateManager inputDelegateManager](self->_keyboardStateManager, "inputDelegateManager");
}

- (id)window
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardImpl;
  -[UIView window](&v3, sel_window);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)refreshRivenPreferences
{
  id v2;

  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl refreshRivenStateWithTraits:isKeyboard:](UIKeyboardImpl, "refreshRivenStateWithTraits:isKeyboard:", v2, 1);

}

+ (void)refreshRivenStateWithTraits:(id)a3 isKeyboard:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t SafeDeviceIdiom;
  void *v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  double v14;
  char v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  BOOL v30;
  id v31;

  v4 = a4;
  v31 = a3;
  SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  byte_1ECD783BA = (SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v6 = v31;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!v31)
      goto LABEL_7;
    v7 = objc_msgSend(v31, "keyboardType");
    v8 = 0;
    if (v7 != 12 && v7 != 122)
      v8 = v7 != 127;
    byte_1ECD783C0 = v8;
    v9 = byte_1ECD783BA;
    if (!byte_1ECD783BA)
    {
      byte_1ECD783C4 = 0;
    }
    else
    {
LABEL_7:
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferencesActions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      byte_1ECD783C4 = objc_msgSend(v11, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE4E8]);

      v9 = byte_1ECD783C4;
    }
    byte_1ECD783C8 = v9;
    v12 = UIKeyboardDeviceSupportsSplit();
    byte_1ECD783C0 = v12;
    if (byte_1ECD783C4)
      v13 = v12;
    else
      v13 = 0;
    byte_1ECD783C4 = v13;
    +[UIKeyboardImpl persistentSplitProgress](UIKeyboardImpl, "persistentSplitProgress");
    byte_1ECD783B0 = 1.0 - v14 < 0.00000011920929;
    if (v4)
    {
      v15 = UIKeyboardSupportsSplit();
      if (byte_1ECD783C4)
        v16 = v15;
      else
        v16 = 0;
      byte_1ECD783C4 = v16;
    }
    if (v31)
    {
      v17 = objc_msgSend(v31, "acceptsSplitKeyboard");
      if (byte_1ECD783C4)
        v18 = v17;
      else
        v18 = 0;
      byte_1ECD783C4 = v18;
      v19 = objc_msgSend(v31, "keyboardType");
      v20 = 0;
      if (v19 != 12 && v19 != 122)
        v20 = v19 != 127;
      if (!byte_1ECD783C4)
        v20 = 0;
      byte_1ECD783C4 = v20;
      v21 = objc_msgSend(v31, "acceptsFloatingKeyboard");
      if (byte_1ECD783C8)
        v22 = v21;
      else
        v22 = 0;
      byte_1ECD783C8 = v22;
      objc_msgSend(v31, "floatingKeyboardEdgeInsets");
      qword_1ECD78410 = v23;
      *(_QWORD *)algn_1ECD78418 = v24;
      qword_1ECD78420 = v25;
      unk_1ECD78428 = v26;
    }
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "preferencesActions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE2E8]);

    v30 = (v29 & 1) != 0 || +[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced");
    v6 = v31;
    byte_1ECD783D0 = v30;
  }

}

- (BOOL)shouldUseCarPlayModes
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;

  if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
    return 0;
  objc_msgSend((id)objc_opt_class(), "keyboardWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v5, "idiom") == 3;
  return v2;
}

+ (BOOL)isActivatingForeground
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v2 = objc_msgSend((id)UIApp, "_isActivating");
  if (v2)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_FBSScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isForeground");

    LOBYTE(v2) = v7;
  }
  return v2;
}

- (id)remoteTextInputPartnerPrivate
{
  return -[_UIKeyboardStateManager remoteTextInputPartnerPrivate](self->_keyboardStateManager, "remoteTextInputPartnerPrivate");
}

+ (UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  BOOL v36;
  BOOL v37;
  int64_t v38;
  char v39;
  uint64_t SafeDeviceIdiom;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  int v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  CGRect v67;
  UIEdgeInsets result;
  CGRect v69;

  v6 = a4;
  objc_msgSend(a1, "keyboardScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomEdgeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "placement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v11;
  if ((objc_msgSend(v12, "showsInputViews") & 1) != 0 || objc_msgSend(v12, "isUndocked"))
  {
    objc_msgSend(v11, "frame", v11);
    if (v13 > 0.0)
    {
      objc_msgSend(v11, "safeAreaInsets");
LABEL_7:
      v15 = v14;
      goto LABEL_9;
    }
  }
  if (v9)
  {
    objc_msgSend(v9, "_managedSafeAreaInsets");
    goto LABEL_7;
  }
  objc_msgSend(a1, "keyboardWindow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_managedSafeAreaInsets");
  v15 = v17;

LABEL_9:
  objc_msgSend(v7, "_referenceBounds", v64);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v7, "_unjailedReferenceBounds");
  v69.origin.x = v26;
  v69.origin.y = v27;
  v69.size.width = v28;
  v69.size.height = v29;
  v67.origin.x = v19;
  v67.origin.y = v21;
  v67.size.width = v23;
  v67.size.height = v25;
  v66 = v9;
  if (CGRectEqualToRect(v67, v69)
    || (unint64_t)(+[UIApplication _classicMode](UIApplication, "_classicMode") - 5) <= 1)
  {
    v30 = v12;
    v31 = a1;
    v32 = v6;
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "userInterfaceIdiom");

      v35 = ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1) ^ ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1);
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v30 = v12;
    v31 = a1;
    v32 = v6;
    v35 = 1;
  }
  v36 = +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  v37 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");
  v38 = a3;
  if ((v35 & 1) != 0 || v37)
    goto LABEL_23;
  v39 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1 || v36;
  if ((v39 & 1) == 0 && !+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    v45 = 0.0;
    v41 = 20.0;
    goto LABEL_43;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
LABEL_23:
    SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    v41 = 0.0;
    if ((unint64_t)(a3 - 3) <= 1 && (SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(v32, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (UIKeyboardShouldAddMarginOnLandscapeLargePhoneKeyboard(v42))
      {
        objc_msgSend(v7, "_referenceBounds");
        v44 = v43;

        if (v44 >= 667.0)
        {
          v45 = 72.0;
          goto LABEL_43;
        }
      }
      else
      {

      }
    }
    v45 = 0.0;
    goto LABEL_43;
  }
  v45 = 0.0;
  if ((unint64_t)(a3 - 1) >= 2)
    v41 = 0.0;
  else
    v41 = 75.0;
  if ((unint64_t)(a3 - 3) <= 1)
  {
    if (objc_msgSend(v32, "isExtensionInputMode"))
      v41 = v15;
    else
      v41 = v15 + -2.0;
    objc_msgSend(v32, "identifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "hasPrefix:", CFSTR("emoji"));

    if (v47)
      v48 = 44.0;
    else
      v48 = 75.0;
    objc_msgSend(v7, "_referenceBounds");
    if (v49 >= 896.0)
      v45 = v48 + 42.0;
    else
      v45 = v48;
  }
LABEL_43:
  objc_msgSend(v31, "_applicationClientComponent");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "minimumKeyboardPadding");
  if (v52 == 0.0 && v51 == 0.0 && v54 == 0.0 && (v55 = 0.0, v53 == 0.0))
  {
    v56 = v45;
  }
  else
  {
    v55 = fmax(v51, 0.0);
    v57 = fmax(v45, v52);
    v41 = fmax(v41, v53);
    v58 = fmax(v45, v54);
    v59 = fmax(v57, v58);
    if ((unint64_t)(v38 - 3) >= 2)
      v45 = v58;
    else
      v45 = v59;
    if ((unint64_t)(v38 - 3) >= 2)
      v56 = v57;
    else
      v56 = v59;
  }

  v60 = v55;
  v61 = v56;
  v62 = v41;
  v63 = v45;
  result.right = v63;
  result.bottom = v62;
  result.left = v61;
  result.top = v60;
  return result;
}

+ (id)_applicationClientComponent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "keyboardWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_settingsScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_keyboardClientComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)automaticMinimizationEnabled
{
  if (self->m_automaticMinimizationEnabled)
    return 1;
  else
    return !+[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate](UIKeyboardVisualModeManager, "softwareKeyboardAllowedForActiveKeyboardSceneDelegate");
}

- (unint64_t)autocorrectionPreferenceForTraits
{
  return -[_UIKeyboardStateManager autocorrectionPreferenceForTraits](self->_keyboardStateManager, "autocorrectionPreferenceForTraits");
}

- (id)inlineTextCompletionController
{
  return -[_UIKeyboardStateManager inlineTextCompletionController](self->_keyboardStateManager, "inlineTextCompletionController");
}

- (void)setAutocorrectSpellingEnabled:(BOOL)a3
{
  -[_UIKeyboardStateManager setAutocorrectSpellingEnabled:](self->_keyboardStateManager, "setAutocorrectSpellingEnabled:", a3);
}

- (BOOL)checkSpellingPreferenceForTraits
{
  return -[_UIKeyboardStateManager checkSpellingPreferenceForTraits](self->_keyboardStateManager, "checkSpellingPreferenceForTraits");
}

- (void)_updateDelegateRequiresKeyEventsFromRemoteTextInput
{
  -[_UIKeyboardStateManager _updateDelegateRequiresKeyEventsFromRemoteTextInput](self->_keyboardStateManager, "_updateDelegateRequiresKeyEventsFromRemoteTextInput");
}

- (UIKeyboardAutocorrectionController)autocorrectionController
{
  return -[_UIKeyboardStateManager autocorrectionController](self->_keyboardStateManager, "autocorrectionController");
}

- (void)clearForwardingInputDelegateAndResign:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  if (-[UIKeyboardImpl _hasMarkedText](self, "_hasMarkedText"))
  {
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "forwardingInputDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unmarkText");

      }
    }
  }
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearForwardingInputDelegateAndResign:", v3);

  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forwardClearForwardingInputDelegateAndResign:", v3);

}

- (BOOL)_hasMarkedText
{
  return -[_UIKeyboardStateManager _hasMarkedText](self->_keyboardStateManager, "_hasMarkedText");
}

- (BOOL)textInputTraitsNeedOneTimeCode
{
  return -[_UIKeyboardStateManager textInputTraitsNeedOneTimeCode](self->_keyboardStateManager, "textInputTraitsNeedOneTimeCode");
}

- (BOOL)needAutofillLogin
{
  return -[_UIKeyboardStateManager needAutofillLogin](self->_keyboardStateManager, "needAutofillLogin");
}

- (BOOL)textInputTraitsNeedAutofill
{
  return -[_UIKeyboardStateManager textInputTraitsNeedAutofill](self->_keyboardStateManager, "textInputTraitsNeedAutofill");
}

- (BOOL)isMemberOfPossibleAutofillGroup:(id)a3
{
  return -[_UIKeyboardStateManager isMemberOfPossibleAutofillGroup:](self->_keyboardStateManager, "isMemberOfPossibleAutofillGroup:", a3);
}

- (BOOL)isMemberOfAutofillGroup:(id)a3
{
  return -[_UIKeyboardStateManager isMemberOfAutofillGroup:](self->_keyboardStateManager, "isMemberOfAutofillGroup:", a3);
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double m_bottomPadding;
  int64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisableUpdateMaskForSecureTextEntry:", objc_msgSend(v4, "isSecureTextEntry"));

  if (+[UIKeyboardImpl showsGlobeAndDictationKeysExternally](UIKeyboardImpl, "showsGlobeAndDictationKeysExternally"))
  {
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSupportsDockViewController");

  }
  -[UIView _window](self, "_window");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    m_bottomPadding = self->m_bottomPadding;
    v9 = -[UIView _keyboardOrientation](self, "_keyboardOrientation");
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", v9, v11);
    v13 = v12;

    if (m_bottomPadding != v13)
      -[UIKeyboardImpl updateLayout](self, "updateLayout");
  }
}

+ (BOOL)showsGlobeAndDictationKeysExternally
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  BOOL v11;

  objc_msgSend(a1, "keyboardScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = +[UIDevice _hasHomeButton](UIDevice, "_hasHomeButton");
  objc_msgSend(a1, "_applicationClientComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "isKeyboardDockDisabled") ^ 1;
  else
    LOBYTE(v9) = 1;
  v10 = v9 & ~v6;
  if (v5)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

- (BOOL)splitTransitionInProgress
{
  char v3;
  void *v4;
  char v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = -[UIKeyboardLayout pinchDetected](self->m_layout, "pinchDetected");
  else
    v3 = 0;
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 | objc_msgSend(v4, "isSplitting");

  return v5;
}

- (UIKeyInput)delegate
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKeyInput *)v3;
}

- (id)textSuggestions
{
  return -[_UIKeyboardStateManager textSuggestions](self->_keyboardStateManager, "textSuggestions");
}

- (UIKeyboardImplGeometryDelegate)geometryDelegate
{
  return (UIKeyboardImplGeometryDelegate *)objc_loadWeakRetained((id *)&self->m_geometryDelegate);
}

+ (CGPoint)persistentOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD783D8, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else if (objc_msgSend(v3, "isFloating"))
  {
    objc_msgSend(v3, "persistentOffset");
    v6 = v5;
    v8 = v7;
    goto LABEL_13;
  }
  if (byte_1ECD783C8
    || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating")
    || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "remoteKeyboardUndocked"), v9, (v10 & 1) != 0))
  {
    objc_msgSend(a1, "normalizedPersistentOffset");
    objc_msgSend(a1, "_screenPointFromNormalizedPoint:");
    v12 = v11;
    v14 = v13;
    +[UIKeyboardImpl persistentSplitProgress](UIKeyboardImpl, "persistentSplitProgress");
    v16 = v15 == 0.0;
    v17 = 0.0;
    v18 = -6.0;
    if (!v16)
      v18 = 0.0;
    if (v14 <= v18)
      v17 = v14;
    v6 = round(v12);
    v8 = round(v17);
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
LABEL_13:

  v19 = v6;
  v20 = v8;
  result.y = v20;
  result.x = v19;
  return result;
}

+ (CGPoint)normalizedPersistentOffset
{
  void *v3;
  char v4;
  double v5;
  double v6;
  CGPoint result;

  if (!byte_1ECD783C8 && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "remoteKeyboardUndocked");

    if ((v4 & 1) == 0)
      goto LABEL_8;
  }
  if (!+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    if (byte_1ECD783C0)
    {
      objc_msgSend(a1, "normalizedPersistentOffsetIgnoringState");
      goto LABEL_9;
    }
LABEL_8:
    v5 = *MEMORY[0x1E0C9D538];
    v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    goto LABEL_9;
  }
  +[UIKeyboardImpl floatingNormalizedPersistentOffset](UIKeyboardImpl, "floatingNormalizedPersistentOffset");
LABEL_9:
  result.y = v6;
  result.x = v5;
  return result;
}

+ (BOOL)rivenTranslationPreference
{
  return byte_1ECD783C8;
}

+ (UIEdgeInsets)deviceSpecificStaticHitBufferForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v6;
  double v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v6 = a4;
  v7 = 0.0;
  if ((_UIApplicationIsFirstPartyStickers() & 1) == 0)
  {
    v8 = objc_msgSend(v6, "isExtensionInputMode");
    objc_msgSend((id)objc_opt_class(), "keyboardScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "idiom");
    objc_msgSend(a1, "deviceSpecificPaddingForInterfaceOrientation:inputMode:", a3, v6);
    v13 = v12 <= 0.0 || v11 == 3;
    v14 = 17.0;
    if (v13)
      v14 = 0.0;
    if (v8)
      v7 = 0.0;
    else
      v7 = v14;

  }
  v15 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  v18 = v7;
  result.right = v17;
  result.bottom = v18;
  result.left = v16;
  result.top = v15;
  return result;
}

- (BOOL)isCurrentEditResponderInEditingMode
{
  return -[_UIKeyboardStateManager isCurrentEditResponderInEditingMode](self->_keyboardStateManager, "isCurrentEditResponderInEditingMode");
}

- (BOOL)shouldShowInternationalKey
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  char HasMultipleActiveSecureInputModes;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("autofillsignup"));

  if ((v6 & 1) != 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  if (objc_msgSend((id)objc_opt_class(), "canShowInternationalKey"))
  {
    -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isSecureTextEntry"))
    {
      HasMultipleActiveSecureInputModes = UIKeyboardHasMultipleActiveSecureInputModes();

      if ((HasMultipleActiveSecureInputModes & 1) == 0)
        goto LABEL_11;
    }
    else if ((unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") < 2)
    {
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "keyboardType");

      if (v11 != 122)
        goto LABEL_11;
    }
    else
    {

    }
    LOBYTE(v7) = 1;
    return v7;
  }
LABEL_11:
  v7 = UIKeyboardHas10KeyChineseKeyboard();
  if (v7)
  {
    UIKeyboardGetCurrentInputMode();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("zh"));

    LOBYTE(v7) = v14 ^ 1;
  }
  return v7;
}

- (BOOL)shouldShowDictationKey
{
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  int v8;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    && (-[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "rtiInputSourceState"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "showingEmojiSearch"),
        v7,
        v6,
        v8))
  {
    return +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation");
  }
  else
  {
    return 0;
  }
}

- (void)setLayoutRenderConfig:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKeyboardImpl activeLayout](self, "activeLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRenderConfig:", v4);

}

- (UIKeyboardLayout)activeLayout
{
  void *v3;
  void *v4;
  UIKeyboardLayout *v5;
  UIKeyboardLayout *WeakRetained;
  UIKeyboardLayout *m_layout;

  -[UIKeyboardEmojiPopoverController layout](self->_emojiPopoverController, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    WeakRetained = (UIKeyboardLayout *)objc_loadWeakRetained((id *)&self->_activeLayout);
    m_layout = WeakRetained;
    if (!WeakRetained)
      m_layout = self->m_layout;
    v5 = m_layout;

  }
  return v5;
}

+ (BOOL)isFloatingForced
{
  void *v2;
  char v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "floatingForced");

  return v3;
}

- (TIKeyboardState)keyboardState
{
  return -[_UIKeyboardStateManager keyboardState](self->_keyboardStateManager, "keyboardState");
}

- (CGRect)correctionRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKeyboardImpl getCorrectionRectIsVertical:](self, "getCorrectionRectIsVertical:", 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)callLayoutIsGeometricShiftOrMoreKeyForTouch:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (objc_opt_respondsToSelector() & 1) != 0
    && -[UIKeyboardLayout isGeometricShiftOrMoreKeyForTouch:](self->m_layout, "isGeometricShiftOrMoreKeyForTouch:", v4);

  return v5;
}

- (void)keyboardDidHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isRotating"))
    goto LABEL_4;
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_4:
    return;
  }
  -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    -[_UIKeyboardStateManager setReceivedCandidatesInCurrentInputMode:](self->_keyboardStateManager, "setReceivedCandidatesInCurrentInputMode:", 0);
}

void __45__UIKeyboardImpl_touchAutocorrectPromptTimer__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAutocorrection");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "autocorrectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autocorrection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "updateAutocorrectPrompt:executionContext:", v6, v7);
  }
  else
  {
    objc_msgSend(v7, "returnExecutionToParent");
  }

}

- (id)_keyboardBehaviorState
{
  return -[_UIKeyboardStateManager _keyboardBehaviorState](self->_keyboardStateManager, "_keyboardBehaviorState");
}

- (id)_markedText
{
  return -[_UIKeyboardStateManager _markedText](self->_keyboardStateManager, "_markedText");
}

- (void)removeAutocorrectPromptAndCandidateList
{
  -[_UIKeyboardStateManager removeAutocorrectPromptAndCandidateList](self->_keyboardStateManager, "removeAutocorrectPromptAndCandidateList");
}

- (void)removeCandidateList
{
  -[_UIKeyboardStateManager removeCandidateList](self->_keyboardStateManager, "removeCandidateList");
}

- (void)setUserSelectedCurrentCandidate:(BOOL)a3
{
  -[_UIKeyboardStateManager setUserSelectedCurrentCandidate:](self->_keyboardStateManager, "setUserSelectedCurrentCandidate:", a3);
}

- (void)updateAutocorrectPrompt:(id)a3 executionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[UIKeyboardImpl hasAdvancedInputDelegate](self, "hasAdvancedInputDelegate"))
    goto LABEL_12;
  -[UIKeyboardImpl clearAutocorrectPromptTimer](self, "clearAutocorrectPromptTimer");
  if (-[_UIKeyboardStateManager _isSelecting](self->_keyboardStateManager, "_isSelecting"))
    goto LABEL_11;
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEmpty");

  if ((v12 & 1) == 0
    || !objc_msgSend(v8, "length")
    || !-[UIKeyboardImpl delegateSupportsCorrectionUI](self, "delegateSupportsCorrectionUI")
    || -[UIKeyboardImpl autocorrectionPreferenceForTraits](self, "autocorrectionPreferenceForTraits") == 2)
  {
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "isEqualToString:", v9))
  {
    if (self->m_autocorrectPrompt)
    {
      UIKeyboardGetCurrentInputMode();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIAutocorrectInlinePrompt usageTrackingMask](self->m_autocorrectPrompt, "usageTrackingMask");
      TIStatisticScalarIncrementAutocorrectionKey();

    }
    goto LABEL_11;
  }
  if (-[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch"))
  {
LABEL_11:
    -[UIKeyboardImpl removeAutocorrectPrompt](self, "removeAutocorrectPrompt");
LABEL_12:
    objc_msgSend(v7, "returnExecutionToParent");
    goto LABEL_13;
  }
  if (-[UIKeyboardImpl hasAsyncCapableInputDelegate](self, "hasAsyncCapableInputDelegate"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke;
    aBlock[3] = &unk_1E16BB128;
    aBlock[4] = self;
    v19 = v6;
    v20 = v9;
    v15 = _Block_copy(aBlock);
    -[UIKeyboardImpl taskQueue](self, "taskQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTask:", v15);

    objc_msgSend(v7, "returnExecutionToParent");
  }
  else
  {
    -[UIKeyboardImpl autocorrectPromptRectsForInput:](self, "autocorrectPromptRectsForInput:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl updateAutocorrectPrompt:correctionRects:](self, "updateAutocorrectPrompt:correctionRects:", v6, v17);
    objc_msgSend(v7, "returnExecutionToParent");

  }
LABEL_13:

}

- (void)acceptCurrentCandidateIfSelected
{
  -[_UIKeyboardStateManager acceptCurrentCandidateIfSelected](self->_keyboardStateManager, "acceptCurrentCandidateIfSelected");
}

- (BOOL)userSelectedCurrentCandidate
{
  return -[_UIKeyboardStateManager userSelectedCurrentCandidate](self->_keyboardStateManager, "userSelectedCurrentCandidate");
}

+ (BOOL)shouldMergeAssistantBarWithKeyboardLayout
{
  void *v2;
  char v3;

  objc_msgSend((id)qword_1ECD783D8, "_layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldMergeAssistantBarWithKeyboardLayout");

  return v3;
}

- (BOOL)layoutIsResizing
{
  void *v2;
  char v3;

  -[UIKeyboardImpl _layout](self, "_layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isResizing");

  return v3;
}

- (BOOL)floatingForced
{
  return -[_UIKeyboardStateManager floatingForced](self->_keyboardStateManager, "floatingForced");
}

- (UIKeyboardCandidateController)candidateController
{
  return self->m_candidateController;
}

- (void)dismissDictationTip
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", CFSTR("DictationCommandTipsEnabled"));

  if (v4 && self->m_keyboardMenuType == 3)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDisplayingMenuForInputUI");

    if (v7)
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictationTipController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logDictationTipDimissialInstrumentation");

    }
    self->m_keyboardMenuType = 0;
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
      -[UIKeyboardImpl touchDictationMenuTimer](self, "touchDictationMenuTimer");
    -[UIDictationPopoverController dismissTip](self->_dictationPopoverController, "dismissTip");
    -[UIKeyboardImpl dismissDictationPopover](self, "dismissDictationPopover");
    -[UIKeyboardImpl dismissDictationMenu](self, "dismissDictationMenu");
  }
}

- (void)dismissDictationPopover
{
  if (-[UIKeyboardImpl isDictationPopoverPresented](self, "isDictationPopoverPresented"))
    -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", self->_dictationPopoverController, 1, 0);
}

- (BOOL)isDictationPopoverPresented
{
  _BOOL4 v3;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    LOBYTE(v3) = self->_dictationPopoverController != 0;
  }
  else
  {
    v3 = +[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled");
    if (v3)
      LOBYTE(v3) = -[UIKeyboardPopoverController isPresented](self->_dictationPopoverController, "isPresented");
  }
  return v3;
}

- (void)selectionScrolling:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UITextSelectionWillScroll"));

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((_DWORD)v5)
      v8 = sel_textSelectionWillScroll;
    else
      v8 = sel_textSelectionDidScroll;
    objc_msgSend(v6, "forwardInputDestinationEventToUIHost:", v8);
  }
  else
  {
    objc_msgSend(v9, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl _selectionScrolling:scroller:](self, "_selectionScrolling:scroller:", v5, v7);
  }

}

- (void)_selectionScrolling:(BOOL)a3 scroller:(id)a4
{
  int v4;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int m_scrolling;
  void *v13;
  char v14;
  void *v15;
  UIAutocorrectInlinePrompt *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  char v60;
  id v61;

  v4 = a3;
  v61 = a4;
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  v9 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (!v61 && v9)
    v61 = v8;
  -[UIKeyboardImpl window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || !v8)
    goto LABEL_51;
  v11 = objc_msgSend(v8, "isDescendantOfView:", v61);

  if (v11)
  {
    m_scrolling = self->m_scrolling;
    self->m_scrolling = v4;
    -[UIKeyboardImpl keyboardState](self, "keyboardState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "autofillMode")
      && +[UIKeyboard isAutoFillPanelUIEnabled](UIKeyboard, "isAutoFillPanelUIEnabled")
      && !+[UIKeyboard isAlwaysBlockedAutoFillPanelClient](UIKeyboard, "isAlwaysBlockedAutoFillPanelClient"))
    {
      if (+[UIKeyboard isAlwaysAllowedAutoFillPanelClient](UIKeyboard, "isAlwaysAllowedAutoFillPanelClient"))
      {
        v14 = 0;
      }
      else
      {
        v14 = !+[UIKeyboard isAutoFillPanelInAppsEnabled](UIKeyboard, "isAutoFillPanelInAppsEnabled");
      }

      if (m_scrolling == v4 || (v14 & 1) != 0)
      {
LABEL_20:
        -[UIView superview](self->m_autocorrectPrompt, "superview");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = self->m_autocorrectPrompt;
        }
        else
        {
          -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "superview");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v10 = 0;
LABEL_25:
            if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
            {
              v19 = self->m_scrolling;
              if (m_scrolling != v4 && self->m_scrolling)
              {
                if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
                {
                  -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "textWillBeginScrolling");

                }
                v19 = self->m_scrolling;
              }
              if (v19 || !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
              {
                -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "updateActivePromptForCandidate:displayRects:highlightOnly:", 0, 0, 0);

                -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "dismissIfPresented");

              }
              if (m_scrolling != v4
                && !self->m_scrolling
                && !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
              {
                -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "textDidEndScrolling");

              }
            }
            if (!v10)
              goto LABEL_51;
            if (self->m_scrolling)
            {
              objc_msgSend(v10, "window");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "_isTextEffectsWindow");

              if (v25)
              {
                objc_msgSend(v10, "window");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "frame");
                v28 = v27;
                v30 = v29;
                v32 = v31;
                v34 = v33;
                objc_msgSend(v10, "superview");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "convertRect:fromView:", v35, v28, v30, v32, v34);
                v37 = v36;
                v39 = v38;
                v41 = v40;
                v43 = v42;

                objc_msgSend(v10, "window");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "convertRect:toView:", v61, v37, v39, v41, v43);
                v46 = v45;
                v48 = v47;
                v50 = v49;
                v52 = v51;

                objc_msgSend(v10, "removeFromSuperview");
                objc_msgSend(v10, "setFrame:", v46, v48, v50, v52);
                objc_msgSend(v61, "addSubview:", v10);
              }
              goto LABEL_51;
            }
            objc_msgSend(v10, "superview");
            v53 = (id)objc_claimAutoreleasedReturnValue();
            v54 = v61;
            if (v53 != v61)
            {
              objc_msgSend(v10, "superview");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "textInputView");
              v57 = objc_claimAutoreleasedReturnValue();
              if (v55 != (void *)v57)
              {
                v58 = (void *)v57;
                objc_msgSend(v10, "window");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v59, "_isTextEffectsWindow");

                if ((v60 & 1) == 0)
                {
LABEL_51:

                  goto LABEL_52;
                }
LABEL_49:
                objc_msgSend(v10, "removeFromSuperview");
                if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
                  -[UIKeyboardImpl updateCandidateDisplay](self, "updateCandidateDisplay");
                goto LABEL_51;
              }

              v54 = v53;
            }

            goto LABEL_49;
          }
          -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
          v16 = (UIAutocorrectInlinePrompt *)objc_claimAutoreleasedReturnValue();
        }
        v10 = v16;
        goto LABEL_25;
      }
      -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "documentStateChanged");
    }

    goto LABEL_20;
  }
LABEL_52:

}

- (BOOL)canShowAppConnections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endOfDocument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "comparePosition:toPosition:", v5, v7);

  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v11 = 1;
  else
    v11 = v10 == 0;
  return !v11;
}

- (id)inputDelegate
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)cancelAllKeyEvents
{
  -[_UIKeyboardStateManager cancelAllKeyEvents](self->_keyboardStateManager, "cancelAllKeyEvents");
}

- (void)setLayoutForKeyHitTest:(id)a3
{
  -[_UIKeyboardStateManager setLayoutForKeyHitTest:](self->_keyboardStateManager, "setLayoutForKeyHitTest:", a3);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD v8[9];
  objc_super v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (_UIApplicationIsFirstPartyStickers())
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKeyboardImpl;
    -[UIView setFrame:](&v9, sel_setFrame_, x, y, width, height);
  }
  else
  {
    -[UIView frame](self, "frame");
    v11.origin.x = x;
    v11.origin.y = y;
    v11.size.width = width;
    v11.size.height = height;
    if (!CGRectEqualToRect(v10, v11))
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __27__UIKeyboardImpl_setFrame___block_invoke;
      v8[3] = &unk_1E16B20D8;
      *(double *)&v8[5] = x;
      *(double *)&v8[6] = y;
      *(double *)&v8[7] = width;
      *(double *)&v8[8] = height;
      v8[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);
      if (-[UIKeyboardImpl shouldUpdateLayoutAutomatically](self, "shouldUpdateLayoutAutomatically"))
        -[UIKeyboardImpl updateLayoutIfNecessary](self, "updateLayoutIfNecessary");
    }
  }
}

- (void)setGeometryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->m_geometryDelegate, a3);
}

- (void)setShouldUpdateLayoutAutomatically:(BOOL)a3
{
  self->_shouldUpdateLayoutAutomatically = a3;
}

- (void)updateLayoutIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;

  if (self->m_updatingLayout)
    return;
  +[UIPeripheralHost activeInstance](UIPeripheralHost, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadAwareInputViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboard");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v21;
  }
  else
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v22 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "interfaceOrientation");
  else
    v7 = -[UIView _keyboardOrientation](self, "_keyboardOrientation");
  v8 = v7;
  objc_msgSend(v22, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v22, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "_userInterfaceIdiom");

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "keyboardScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "_userInterfaceIdiom");
  }

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visualModeManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "windowingModeEnabled") & 1) == 0)
  {

    v17 = 0;
    goto LABEL_15;
  }
  -[UIKeyboardImpl window](self, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_class();
  LODWORD(v16) = objc_msgSend(v16, "isEqual:", objc_opt_class());

  if ((_DWORD)v16)
  {
    -[UIKeyboardImpl window](self, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "sceneIsResizing");
LABEL_15:

    goto LABEL_17;
  }
  v17 = 0;
LABEL_17:
  if (!objc_msgSend((id)objc_opt_class(), "keyboardOrientation:isEquivalentToOrientation:", v8, -[UIKeyboardLayout orientation](self->m_layout, "orientation"))|| v12 != -[UIKeyboardLayout idiom](self->m_layout, "idiom")|| objc_msgSend(v22, "isAutomatic")&& (objc_msgSend(v22, "bounds"), v19 = v18, -[UIView bounds](self->m_layout, "bounds"), v19 != v20))
  {
    v17 = 1;
  }
  if (v12 == 8 || !v17)
  {
    if (-[UIKeyboardImpl shouldShowCandidateBar](self, "shouldShowCandidateBar"))
      -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 1);
  }
  else
  {
    -[UIKeyboardImpl updateLayout](self, "updateLayout");
    if (-[UIKeyboardImpl showInputModeIndicator](self, "showInputModeIndicator"))
    {
      if (self->m_languageIndicator)
        -[UIKeyboardImpl updateInputModeIndicatorOnSingleKeyOnly:](self, "updateInputModeIndicatorOnSingleKeyOnly:", 0);
    }
  }

}

- (BOOL)shouldUpdateLayoutAutomatically
{
  return self->_shouldUpdateLayoutAutomatically;
}

- (void)setOverrideTextInputTraits:(id)a3
{
  -[_UIKeyboardStateManager setOverrideTextInputTraits:](self->_keyboardStateManager, "setOverrideTextInputTraits:", a3);
}

- (void)setDefaultTextInputTraits:(id)a3
{
  -[_UIKeyboardStateManager setDefaultTextInputTraits:](self->_keyboardStateManager, "setDefaultTextInputTraits:", a3);
}

+ (void)applicationWillSuspend:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesCandidateSelection");

  if (v4)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptAutocorrectionWithCompletionHandler:", 0);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetTouchProcessingForKeyboardChange");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clearUnusedObjects:", 0);

  +[UIKBRenderer clearInternalCaches](UIKBRenderer, "clearInternalCaches");
  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commitTransaction");

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearNonPersistentCache");

}

- (BOOL)isTrackpadMode
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[UIKeyboardLayout isTrackpadMode](self->m_layout, "isTrackpadMode");
  else
    return 0;
}

- (void)recomputeActiveInputModesWithExtensions:(BOOL)a3 allowNonLinguisticInputModes:(BOOL)a4
{
  -[_UIKeyboardStateManager recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:](self->_keyboardStateManager, "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", a3, a4);
}

- (void)postInputViewControllerShouldUpdateNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("UICompatibilityInputViewControllerInputModeKey"));
    objc_msgSend((id)objc_opt_class(), "keyboardWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("UICompatibilityInputViewControllerScreenKey"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("UICompatibilityInputViewControllerShouldUpdateNotification"), 0, v6);

  }
}

- (void)clearInput
{
  -[_UIKeyboardStateManager clearInput](self->_keyboardStateManager, "clearInput");
}

- (void)updateCandidateDisplay
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  if (-[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection")
    || -[UIKeyboardImpl usesAutocorrectionLists](self, "usesAutocorrectionLists")
    && -[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible"))
  {
    if (!-[_UIKeyboardStateManager needsToDeferUpdateTextCandidateView](self->_keyboardStateManager, "needsToDeferUpdateTextCandidateView"))
    {
      -[UIKeyboardImpl updateTextCandidateView](self, "updateTextCandidateView");
      goto LABEL_18;
    }
    -[UIKeyboardImpl autocorrectPromptTask](self, "autocorrectPromptTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isValid");

    if (v4)
    {
      -[UIKeyboardImpl autocorrectPromptTask](self, "autocorrectPromptTask");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resetTimer");
LABEL_16:

      goto LABEL_18;
    }
    -[UIKeyboardImpl taskQueue](self, "taskQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __40__UIKeyboardImpl_updateCandidateDisplay__block_invoke;
    v13[3] = &unk_1E16BAF98;
    v13[4] = self;
    objc_msgSend(v5, "scheduleTask:timeInterval:repeats:", v13, 0, 0.4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl setAutocorrectPromptTask:](self, "setAutocorrectPromptTask:", v11);
LABEL_15:

    goto LABEL_16;
  }
  if (!-[_UIKeyboardStateManager autoDeleteOK](self->_keyboardStateManager, "autoDeleteOK"))
  {
    -[UIKeyboardImpl updateKeyboardConfigurations](self, "updateKeyboardConfigurations");
    v6 = -[UIKeyboardImpl hasAutocorrectPrompt](self, "hasAutocorrectPrompt");
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasAsyncCapableInputDelegate");

    if ((v8 & 1) != 0
      || !v6
      || (-[UIKeyboardImpl autocorrectionController](self, "autocorrectionController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "hasAutocorrection"),
          v9,
          !v10))
    {
      -[UIKeyboardImpl touchAutocorrectPromptTimer](self, "touchAutocorrectPromptTimer");
      goto LABEL_18;
    }
    -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autocorrection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl updateAutocorrectPrompt:](self, "updateAutocorrectPrompt:", v11);
    goto LABEL_15;
  }
  -[UIKeyboardImpl removeAutocorrectPromptAndCandidateList](self, "removeAutocorrectPromptAndCandidateList");
LABEL_18:
  -[UIKeyboardImpl inlineTextCompletionController](self, "inlineTextCompletionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateTextCompletionDisplay");

}

- (BOOL)isPredictionViewControllerVisible
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemInputAssistantViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "predictionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "keyInputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isVisibleForInputDelegate:inputViews:", v7, 0);

  LOBYTE(v6) = objc_msgSend(v4, "isEmojiSearchResultsVisible");
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "visualModeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "useVisualModeWindowed");

  return v8 & ((v6 | v11) ^ 1);
}

- (id)inputOverlayContainerForCandidateView:(BOOL)a3
{
  return -[_UIKeyboardStateManager inputOverlayContainerForCandidateView:](self->_keyboardStateManager, "inputOverlayContainerForCandidateView:", a3);
}

- (BOOL)usesCandidateSelection
{
  return -[_UIKeyboardStateManager usesCandidateSelection](self->_keyboardStateManager, "usesCandidateSelection");
}

- (BOOL)shouldShowCandidateBarIfReceivedCandidatesInCurrentInputMode:(BOOL)a3 ignoreHidePredictionTrait:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;

  v4 = a4;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "isCustomInputView") & 1) == 0
    && ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
     || (unint64_t)(-[UIView _keyboardOrientation](self, "_keyboardOrientation") - 3) < 2
     || a3
     || (UIKeyboardAlwaysShowCandidateBarForCurrentInputMode() & 1) != 0
     || -[UIKeyboardImpl canShowAppConnections](self, "canShowAppConnections"))
    && -[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection")
    && self->m_layout
    && !-[UIKeyboardImpl isUsingDictationLayout](self, "isUsingDictationLayout")
    && !-[UIKeyboardLayout isResized](self->m_layout, "isResized"))
  {
    -[UIKeyboardLayout candidateList](self->m_layout, "candidateList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || -[UIKeyboardLayout hasCandidateKeys](self->m_layout, "hasCandidateKeys"))
    {
      v10 = 0;
    }
    else
    {
      -[UIKeyboardImpl dynamicCaretList](self, "dynamicCaretList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = !v12
         && (-[UIKeyboardImpl canUseCandidateBarAsSupplementToInlineView](self, "canUseCandidateBarAsSupplementToInlineView")|| (!-[UIKeyboardImpl isMinimized](self, "isMinimized") || self->m_maximizing)&& !-[UIKeyboardImpl showsCandidateInline](self, "showsCandidateInline"))&& -[UIKeyboardImpl currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:](self, "currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:", v4);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasAutocorrectPrompt
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    -[UIKeyboardImpl autocorrectPrompt](self, "autocorrectPrompt");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_3;
LABEL_5:
    v5 = 1;
    goto LABEL_6;
  }
  -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "showingAutocorrectInlinePrompt") & 1) != 0)
    goto LABEL_5;
LABEL_3:
  -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

LABEL_6:
  return v5;
}

- (void)removeAutocorrectPrompt
{
  void *v3;
  void *v4;
  void *m_autocorrectPrompt;
  void *v6;
  void *v7;
  id v8;

  -[UIKeyboardImpl updateKeyboardConfigurations](self, "updateKeyboardConfigurations");
  -[UIKeyboardImpl clearAutocorrectPromptTimer](self, "clearAutocorrectPromptTimer");
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateActivePromptForCandidate:displayRects:highlightOnly:", 0, 0, 0);

  }
  -[UIView superview](self->m_autocorrectPrompt, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIView removeFromSuperview](self->m_autocorrectPrompt, "removeFromSuperview");
    m_autocorrectPrompt = self->m_autocorrectPrompt;
    self->m_autocorrectPrompt = 0;
  }
  else
  {
    -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return;
    -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
    m_autocorrectPrompt = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(m_autocorrectPrompt, "reset");
  }

  -[UIKeyboardImpl sendCallbacksForPostCorrectionsRemoval](self, "sendCallbacksForPostCorrectionsRemoval");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardCandidateCorrectionDidChangeNotification"), 0, 0);

}

- (UIAutocorrectBubbleContainer)autocorrectBubbleContainer
{
  return self->_autocorrectBubbleContainer;
}

- (void)removeTextChoicePrompt
{
  id v3;

  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissIfPresented");

  }
}

- (id)inputOverlayContainer
{
  return -[_UIKeyboardStateManager inputOverlayContainer](self->_keyboardStateManager, "inputOverlayContainer");
}

- (BOOL)delegateSupportsCorrectionUI
{
  return -[_UIKeyboardStateManager delegateSupportsCorrectionUI](self->_keyboardStateManager, "delegateSupportsCorrectionUI");
}

- (void)updateKeyboardConfigurations
{
  -[_UIKeyboardStateManager updateKeyboardConfigurations](self->_keyboardStateManager, "updateKeyboardConfigurations");
}

- (void)dismissEducationTip
{
  void *v2;
  id v3;

  if (self->m_keyboardMenuType == 5)
  {
    self->m_keyboardMenuType = 0;
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "interactionAssistant");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissMenuForInputUI");

  }
}

- (void)touchAutocorrectPromptTimer
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  if (-[UIKeyboardImpl hasAdvancedInputDelegate](self, "hasAdvancedInputDelegate"))
  {
    -[UIKeyboardImpl autocorrectPromptTask](self, "autocorrectPromptTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isValid");

    if (v4)
    {
      -[UIKeyboardImpl autocorrectPromptTask](self, "autocorrectPromptTask");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resetTimer");

    }
    else
    {
      -[UIKeyboardImpl taskQueue](self, "taskQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __45__UIKeyboardImpl_touchAutocorrectPromptTimer__block_invoke;
      v8[3] = &unk_1E16BAF98;
      v8[4] = self;
      objc_msgSend(v5, "scheduleTask:timeInterval:repeats:", v8, 0, 0.2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardImpl setAutocorrectPromptTask:](self, "setAutocorrectPromptTask:", v6);

    }
  }
}

- (void)clearAutocorrectPromptTimer
{
  void *v3;

  -[UIKeyboardImpl autocorrectPromptTask](self, "autocorrectPromptTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIKeyboardImpl setAutocorrectPromptTask:](self, "setAutocorrectPromptTask:", 0);
  -[_UIKeyboardStateManager clearDelayDeleteTimer](self->_keyboardStateManager, "clearDelayDeleteTimer");
}

- (UIKeyboardScheduledTask)autocorrectPromptTask
{
  return self->_autocorrectPromptTask;
}

- (void)setAutocorrectPromptTask:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectPromptTask, a3);
}

- (BOOL)hasAdvancedInputDelegate
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[UIKeyboardImpl asyncInputDelegate](self, "asyncInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (id)asyncInputDelegate
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asyncInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)suppressUpdateLayout
{
  return -[_UIKeyboardStateManager suppressUpdateLayout](self->_keyboardStateManager, "suppressUpdateLayout");
}

- (BOOL)showsCandidateBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rtiInputSourceState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return self->m_showsCandidateBar;
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rtiInputSourceState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "showsCandidateBar");

  return v7;
}

- (void)keyboardSceneDelegate:(id)a3 stoppedPinningInputViewsOnBehalfOfResponder:(id)a4
{
  -[_UIKeyboardStateManager keyboardSceneDelegate:stoppedPinningInputViewsOnBehalfOfResponder:](self->_keyboardStateManager, "keyboardSceneDelegate:stoppedPinningInputViewsOnBehalfOfResponder:", a3, a4);
}

- (void)keyboardSceneDelegate:(id)a3 startedPinningInputViewsOnBehalfOfResponder:(id)a4
{
  -[_UIKeyboardStateManager keyboardSceneDelegate:startedPinningInputViewsOnBehalfOfResponder:](self->_keyboardStateManager, "keyboardSceneDelegate:startedPinningInputViewsOnBehalfOfResponder:", a3, a4);
}

+ (BOOL)rivenInstalled
{
  return byte_1ECD783BA;
}

- (void)clearLongPressTimer
{
  -[_UIKeyboardStateManager clearLongPressTimer](self->_keyboardStateManager, "clearLongPressTimer");
}

- (id)_sessionIdentifier
{
  return -[_UIKeyboardStateManager _sessionIdentifier](self->_keyboardStateManager, "_sessionIdentifier");
}

- (void)applicationResumed:(id)a3
{
  -[UIKeyboardImpl setCaretBlinks:](self, "setCaretBlinks:", 1);
}

- (UIKeyboardTaskQueue)taskQueue
{
  return -[_UIKeyboardStateManager taskQueue](self->_keyboardStateManager, "taskQueue");
}

- (void)updateShiftState
{
  -[_UIKeyboardStateManager updateShiftState](self->_keyboardStateManager, "updateShiftState");
}

- (BOOL)suppressUpdateShiftState
{
  return -[_UIKeyboardStateManager suppressUpdateShiftState](self->_keyboardStateManager, "suppressUpdateShiftState");
}

- (void)notifyShiftState
{
  -[_UIKeyboardStateManager notifyShiftState](self->_keyboardStateManager, "notifyShiftState");
}

- (void)callLayoutUpdateLocalizedKeys
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout updateLocalizedKeys:](self->m_layout, "updateLocalizedKeys:", 0);
}

- (void)setCapsLockSign
{
  _BOOL4 m_isCapsLocked;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  void *v13;
  UIView *v14;
  UIView *m_capsLockSign;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIView *v21;
  UIImageView *v22;
  void *v23;
  UIView *v24;
  UIView *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  void *v31;
  BOOL v32;
  double v33;
  UIView *v34;
  uint64_t v35;
  void *v36;
  id v37;
  CGRect v38;
  CGRect v39;

  if (+[UIKeyboard isCapslockIndicatorEnabled](UIKeyboard, "isCapslockIndicatorEnabled"))
  {
    m_isCapsLocked = self->m_isCapsLocked;
    -[UIKeyboardImpl capslockAssertion](self, "capslockAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (m_isCapsLocked)
    {

      if (!v5)
      {
        -[UIKeyboardImpl _activeAssertionController](self, "_activeAssertionController");
        v37 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "capslockAssertionWithReason:", CFSTR("setCapsLockSign"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardImpl setCapslockAssertion:](self, "setCapslockAssertion:", v6);
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v4, "invalidate");

      -[UIKeyboardImpl setCapslockAssertion:](self, "setCapslockAssertion:", 0);
    }
    return;
  }
  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v37, "isSecureTextEntry") & 1) == 0)
  {
LABEL_8:
    v7 = v37;
LABEL_9:

    return;
  }
  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "displaySecureTextUsingPlainText"))
    goto LABEL_7;
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyInputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "keyInputDelegate");
    v37 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "rightView");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v37, "rightView");
      v14 = (UIView *)objc_claimAutoreleasedReturnValue();
      m_capsLockSign = self->m_capsLockSign;

      v7 = v37;
      if (v14 != m_capsLockSign)
        goto LABEL_9;
    }
    if (-[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached")
      && self->m_isCapsLocked
      || -[_UIKeyboardStateManager shiftLocked](self->_keyboardStateManager, "shiftLocked")
      && -[UIKeyboardLayout isAlphabeticPlane](self->m_layout, "isAlphabeticPlane"))
    {
      objc_msgSend(v37, "font");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pointSize");
      v18 = v17 + 6.0;

      objc_msgSend(v37, "bounds");
      if (v18 > v19)
      {
        objc_msgSend(v37, "bounds");
        v18 = v20;
      }
      v21 = self->m_capsLockSign;
      if (!v21)
      {
        v22 = [UIImageView alloc];
        _UIImageWithName(CFSTR("password-capslock.png"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[UIImageView initWithImage:](v22, "initWithImage:", v23);
        v25 = self->m_capsLockSign;
        self->m_capsLockSign = v24;

        v21 = self->m_capsLockSign;
      }
      -[UIView frame](v21, "frame");
      v27 = v26;
      v29 = v28;
      objc_msgSend(v37, "rightView");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        -[UIView frame](self->m_capsLockSign, "frame");
        v39.origin.x = v27;
        v39.origin.y = v29;
        v39.size.width = v18;
        v39.size.height = v18;
        v32 = CGRectEqualToRect(v38, v39);

        v7 = v37;
        if (v32)
          goto LABEL_9;
      }
      -[UIView setFrame:](self->m_capsLockSign, "setFrame:", v27, v29, v18, v18);
      objc_msgSend(v37, "bounds");
      objc_msgSend(v37, "_setRightViewOffset:", (v33 - v18) * -0.5, 0.0);
      v34 = self->m_capsLockSign;
      v35 = 1;
    }
    else
    {
      objc_msgSend(v37, "rightView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v37;
      if (!v36)
        goto LABEL_9;
      v34 = 0;
      v35 = 0;
    }
    objc_msgSend(v37, "setRightView:", v34);
    objc_msgSend(v37, "setRightViewMode:", v35);
    goto LABEL_8;
  }
}

- (void)setSuppressUpdateLayout:(BOOL)a3
{
  -[_UIKeyboardStateManager setSuppressUpdateLayout:](self->_keyboardStateManager, "setSuppressUpdateLayout:", a3);
}

- (id)updatedKeyBehaviors
{
  return -[_UIKeyboardStateManager updatedKeyBehaviors](self->_keyboardStateManager, "updatedKeyBehaviors");
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
}

- (BOOL)callLayoutIsShiftKeyBeingHeld
{
  return (objc_opt_respondsToSelector() & 1) != 0
      && -[UIKeyboardLayout isShiftKeyBeingHeld](self->m_layout, "isShiftKeyBeingHeld");
}

- (void)_updateExternalDeviceInputSettingForWindow:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(a3, "screen");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setExternalDeviceShouldInputText:", v5 != 0);

  }
  else
  {
    -[UIKeyboardImpl window](self, "window");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setExternalDeviceShouldInputText:", 0);
  }

}

- (void)stopAutoDelete
{
  -[_UIKeyboardStateManager stopAutoDelete](self->_keyboardStateManager, "stopAutoDelete");
}

- (unint64_t)delegateConformanceType
{
  return -[_UIKeyboardStateManager delegateConformanceType](self->_keyboardStateManager, "delegateConformanceType");
}

- (void)setArrowKeyHistory:(id)a3
{
  -[_UIKeyboardStateManager setArrowKeyHistory:](self->_keyboardStateManager, "setArrowKeyHistory:", a3);
}

- (void)setReturnKeyEnabled:(BOOL)a3
{
  int m_returnKeyState;
  int v5;
  id v6;

  m_returnKeyState = self->m_returnKeyState;
  if (a3)
    v5 = 2;
  else
    v5 = 3;
  self->m_returnKeyState = v5;
  -[UIKeyboardImpl callLayoutUpdateReturnKey](self, "callLayoutUpdateReturnKey");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (self->m_returnKeyState != m_returnKeyState)
    {
      -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "documentTraitsChanged");

    }
  }
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(a1, "sizeForInterfaceOrientation:ignoreInputView:", a3, 0);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (Class)layoutClassForCurrentInputMode
{
  void *v3;
  void *v4;

  UIKeyboardGetCurrentInputMode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "layoutClassForInputMode:keyboardType:screenTraits:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadAwareInputViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isExtensionInputMode");

  if (!v11)
    goto LABEL_7;
  objc_msgSend(v8, "inputViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;

  if (objc_msgSend(v8, "isCustomInputView") && a4 || v17 <= 0.0)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentInputMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UICompatibilityInputViewController inputSnapshotViewForInputMode:orientation:](UICompatibilityInputViewController, "inputSnapshotViewForInputMode:orientation:", v19, a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "bounds");
      v15 = v21;
      v17 = v22;
LABEL_13:

      goto LABEL_14;
    }
LABEL_7:
    objc_msgSend(a1, "keyboardSizeForInterfaceOrientation:", a3);
    v15 = v23;
    v17 = v24;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;
    if (v25)
    {
      objc_msgSend(v25, "_layout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        if (a4)
          v27 = 0;
        else
          v27 = objc_msgSend(v8, "isCustomInputView");
        objc_msgSend(a1, "additionalInstanceHeightForInterfaceOrientation:hasInputView:", a3, v27);
        v29 = v28;
        objc_msgSend(a1, "topMarginForInterfaceOrientation:", a3);
        v17 = v17 + v29 - v30;
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  v31 = v15;
  v32 = v17;
  result.height = v32;
  result.width = v31;
  return result;
}

+ (CGSize)keyboardSizeForInterfaceOrientation:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  objc_msgSend(a1, "defaultSizeForInterfaceOrientation:");
  v6 = v5;
  v8 = v7;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "frame");
  v12 = v11;
  if (v10)
  {
    if ((objc_msgSend(v10, "isDynamicLayout") & 1) == 0
      && objc_msgSend(a1, "keyboardOrientation:isEquivalentToOrientation:", objc_msgSend(v10, "orientation"), a3)&& objc_msgSend(v10, "isMemberOfClass:", objc_msgSend(a1, "layoutClassForCurrentInputMode"))&& v6 == v12)
    {
      objc_msgSend(v10, "frame");
      v6 = v14;
LABEL_10:
      v18 = v13;
      objc_msgSend(a1, "topMarginForInterfaceOrientation:", a3);
      v8 = v18 + v19;
      goto LABEL_11;
    }
    if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textInputTraits");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "acceptsSplitKeyboard");

      if (v17)
      {
        objc_msgSend(v10, "frame");
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  if (objc_msgSend(v10, "idiom") == 3)
    v6 = v12;

  v20 = v6;
  v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "keyboardScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "keyboardType");
  else
    v9 = 0;
  if (objc_msgSend(v6, "idiom") == 2)
  {
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_useLinearLayout");

    }
    else
    {
      v12 = 0;
    }

    objc_msgSend(v6, "updateForLinearLayout:", v12);
  }
  else if (objc_msgSend(v6, "idiom") == 3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateForTextInputTraits:supportedInteractionModel:", 0, objc_msgSend(v13, "requestedInteractionModel"));

  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentInputMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(a1, "layoutClassForInputMode:keyboardType:screenTraits:", v16, v9, v6);

  objc_msgSend(v15, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "keyboardSizeForInputMode:screenTraits:keyboardType:", v18, v6, v9);
  v20 = v19;
  v22 = v21;

  objc_msgSend(a1, "topMarginForInterfaceOrientation:", a3);
  v24 = v22 + v23;
  objc_msgSend(a1, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", a3, v15);
  v26 = v24 + v25;

  v27 = v20;
  v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

+ (double)topMarginForInterfaceOrientation:(int64_t)a3
{
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardImpl_topMarginForInterfaceOrientation___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD78400 != -1)
    dispatch_once(&qword_1ECD78400, block);
  v5 = 0.0;
  if ((objc_msgSend(a1, "isSplit") & 1) == 0 && (objc_msgSend(a1, "isFloating") & 1) == 0)
  {
    v6 = qword_1ECD783F8;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentInputMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "normalizedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend((id)v6, "containsObject:", v9);

    if ((v6 & 1) == 0)
    {
      if ((unint64_t)(a3 - 3) >= 2)
        v10 = &qword_1ECD783E8;
      else
        v10 = (uint64_t *)&unk_1ECD783F0;
      return *(double *)v10;
    }
  }
  return v5;
}

+ (Class)layoutClassForInputMode:(id)a3 keyboardType:(int64_t)a4 screenTraits:(id)a5
{
  unsigned int v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("intl_HWR")) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    if (UIKeyboardInputModeWithTypeUsesKBStar(v7, v6))
      objc_msgSend((id)objc_opt_class(), "_subclassForScreenTraits:", v8);
    else
      UIKeyboardLayoutClassForInputMode(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v9;
}

+ (double)additionalInstanceHeightForInterfaceOrientation:(int64_t)a3 hasInputView:(BOOL)a4
{
  void *v7;
  void *v8;
  int v9;
  double result;

  if (objc_msgSend(a1, "shouldMergeAssistantBarWithKeyboardLayout"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentInputMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEmojiInputMode");

    if (!v9)
      return 0.0;
  }
  if ((objc_msgSend((id)qword_1ECD783D8, "disableInputBars") & 1) != 0 || a4)
    return 0.0;
  if (!a3)
    a3 = +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
  objc_msgSend(a1, "topMarginForInterfaceOrientation:", a3);
  return result;
}

+ (BOOL)keyboardOrientation:(int64_t)a3 isEquivalentToOrientation:(int64_t)a4
{
  if (a3 && a4)
    return ((unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFELL) ^ ((unint64_t)(a4 - 3) < 2);
  else
    return a3 == a4;
}

- (UIKeyboardImpl)initWithFrame:(CGRect)a3 forCustomInputView:(BOOL)a4
{
  _BOOL8 v4;
  UIKeyboardImpl *v5;
  UIKeyboardImpl *v6;
  uint64_t v7;
  _UIKeyboardStateManager *v8;
  _UIKeyboardStateManager *keyboardStateManager;
  uint64_t v10;
  NSMutableDictionary *m_keyedLayouts;
  uint64_t v12;
  UIKeyboardCandidateController *m_candidateController;
  _UIKeyboardStateManager *v14;
  UIKeyboardImpl *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _UIKBFeedbackGenerating *m_feedbackGenerator;
  _UIAssertionController *v22;
  _UIAssertionController *assertionController;
  void *v24;
  UIKeyboardImpl *v25;
  NSObject *v27;
  const char *v28;
  int64_t id;
  _QWORD v30[4];
  UIKeyboardImpl *v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int64_t v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)UIKeyboardImpl;
  v5 = -[UIView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = qword_1ECD78458++;
    v5->_id = v7;
    if (os_variant_has_internal_diagnostics())
    {
      _UIKeyboardExtendedLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = "No";
        id = v6->_id;
        if (v4)
          v28 = "Yes";
        *(_DWORD *)buf = 136315394;
        v34 = v28;
        v35 = 2048;
        v36 = id;
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "Impl init forCustomInputView:%s (id=%ld)", buf, 0x16u);
      }

    }
    objc_storeStrong((id *)&qword_1ECD783D8, v6);
    _UIKBRT_ResetSystemUptimeOnResume();
    v8 = -[_UIKeyboardStateManager initWithPresentationDelegateView:forCustomInputView:]([_UIKeyboardStateManager alloc], "initWithPresentationDelegateView:forCustomInputView:", v6, v4);
    keyboardStateManager = v6->_keyboardStateManager;
    v6->_keyboardStateManager = v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    m_keyedLayouts = v6->m_keyedLayouts;
    v6->m_keyedLayouts = (NSMutableDictionary *)v10;

    +[UIKeyboardCandidateController sharedInstance](UIKeyboardCandidateController, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    m_candidateController = v6->m_candidateController;
    v6->m_candidateController = (UIKeyboardCandidateController *)v12;

    -[UIKeyboardCandidateController setDelegate:](v6->m_candidateController, "setDelegate:", v6->_keyboardStateManager);
    v6->m_returnKeyState = 0;
    v6->m_animateUpdateBars = 1;
    v14 = v6->_keyboardStateManager;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __51__UIKeyboardImpl_initWithFrame_forCustomInputView___block_invoke;
    v30[3] = &unk_1E16B1B28;
    v15 = v6;
    v31 = v15;
    -[_UIKeyboardStateManager updatePreferencesWithBlock:](v14, "updatePreferencesWithBlock:", v30);
    if (-[_UIKeyboardStateManager hardwareKeyboardAttached](v6->_keyboardStateManager, "hardwareKeyboardAttached"))
    {
      v16 = (void *)UIApp;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hardwareInputMode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "automaticHardwareLayout");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHardwareKeyboardLayoutName:", v19);

      -[UIKeyboardImpl setCapsLockIfNeeded](v15, "setCapsLockIfNeeded");
    }
    -[UIKeyboardImpl updateLayout](v15, "updateLayout");
    objc_storeWeak((id *)&v15->m_geometryDelegate, 0);
    v15->_shouldUpdateLayoutAutomatically = 1;
    if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      +[_UIKBFeedbackGeneratorPartner feedbackGeneratorWithView:](_UIKBFeedbackGeneratorPartner, "feedbackGeneratorWithView:", v15);
      v20 = objc_claimAutoreleasedReturnValue();
      m_feedbackGenerator = v15->m_feedbackGenerator;
      v15->m_feedbackGenerator = (_UIKBFeedbackGenerating *)v20;

    }
    v15->_hideInlineCandidates = 0;
    v22 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v15);
    assertionController = v15->_assertionController;
    v15->_assertionController = v22;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v15, sel_hardwareKeyboardAvailabilityDidChange_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

    v15->m_initializationDone = 1;
    -[UIView _setSafeAreaInsetsFrozen:](v15, "_setSafeAreaInsetsFrozen:", 1);
    -[UIKeyboardImpl performSelector:withObject:afterDelay:](v15, "performSelector:withObject:afterDelay:", sel_delayedInit, 0, 0.0);
    v25 = v15;

  }
  return v6;
}

- (UIKeyboardInputModeIndicatorController)inputModeIndicatorController
{
  return -[_UIKeyboardStateManager inputModeIndicatorController](self->_keyboardStateManager, "inputModeIndicatorController");
}

- (void)setDelegate:(id)a3 force:(BOOL)a4 delayEndInputSession:(BOOL)a5
{
  -[_UIKeyboardStateManager setDelegate:force:delayEndInputSession:](self->_keyboardStateManager, "setDelegate:force:delayEndInputSession:", a3, a4, a5);
}

- (void)setIsAttachedHardwareKeyboard:(id)a3
{
  objc_storeStrong((id *)&self->_isAttachedHardwareKeyboard, a3);
}

- (void)setInHardwareKeyboardMode:(BOOL)a3 shouldMoveKeyboard:(BOOL)a4
{
  -[_UIKeyboardStateManager setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:](self->_keyboardStateManager, "setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:", a3, 0, a4);
}

- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4 shouldMoveKeyboard:(BOOL)a5
{
  -[_UIKeyboardStateManager setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:](self->_keyboardStateManager, "setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:", a3, a4, a5);
}

- (id)webInputDelegate
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputSystemSourceSession
{
  return -[_UIKeyboardStateManager inputSystemSourceSession](self->_keyboardStateManager, "inputSystemSourceSession");
}

- (void)setPendingSupplementalCandidateToInsert:(id)a3
{
  -[_UIKeyboardStateManager setPendingSupplementalCandidateToInsert:](self->_keyboardStateManager, "setPendingSupplementalCandidateToInsert:", a3);
}

- (void)clearChangeTimeAndCount
{
  -[_UIKeyboardStateManager clearChangeTimeAndCount](self->_keyboardStateManager, "clearChangeTimeAndCount");
}

- (int)changeCount
{
  return -[_UIKeyboardStateManager changeCount](self->_keyboardStateManager, "changeCount");
}

- (_UIStringAndPositionPair)pendingSupplementalCandidateToInsert
{
  return -[_UIKeyboardStateManager pendingSupplementalCandidateToInsert](self->_keyboardStateManager, "pendingSupplementalCandidateToInsert");
}

- (void)_postInputResponderChangedNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v9 = CFSTR("UITextInputResponderCapabilitiesChangedInputResponderKey");
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("UITextInputResponderDidChangeNotification"), 0, v7);

}

- (void)dismissDictationMenu
{
  void *v3;
  void *v4;
  UITextCursorAssertion *m_dictationIndicatorAssertion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    && !-[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputDelegateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputSystemSourceSession");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v11 = v15;
    if (!v15)
    {
LABEL_16:

      return;
    }
    objc_msgSend(v15, "textOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_dismissDictationMenu);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("selector"));

    objc_msgSend(v12, "setCustomInfoType:", 0x1E1750220);
    objc_msgSend(v12, "setCustomInfo:", v13);
    objc_msgSend(v15, "flushOperations");

    goto LABEL_14;
  }
  if (self->m_keyboardMenuType == 3)
    return;
  if (self->m_dictationIndicatorAssertion)
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectionDisplayInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearInputModeCursorAssertion");

    -[UITextCursorAssertion invalidate](self->m_dictationIndicatorAssertion, "invalidate");
    m_dictationIndicatorAssertion = self->m_dictationIndicatorAssertion;
    self->m_dictationIndicatorAssertion = 0;

  }
  if (!self->m_editMenuInteraction)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interactionAssistant");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissMenuForInputUI");
LABEL_14:

    goto LABEL_15;
  }
  if (self->m_keyboardMenuType != 3)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeInteraction:", self->m_editMenuInteraction);

    -[UIEditMenuInteraction dismissMenu](self->m_editMenuInteraction, "dismissMenu");
    +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v8, "isMenuVisible");

    if ((_DWORD)v6)
    {
      +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hideMenu");
LABEL_15:
      v11 = v15;
      goto LABEL_16;
    }
  }
}

- (void)setSuggestions:(id)a3
{
  -[_UIKeyboardStateManager setSuggestions:](self->_keyboardStateManager, "setSuggestions:", a3);
}

- (void)setForCustomInputView:(BOOL)a3
{
  -[_UIKeyboardStateManager setForCustomInputView:](self->_keyboardStateManager, "setForCustomInputView:", a3);
}

- (void)setDeleteWordLastDelete:(double)a3
{
  -[_UIKeyboardStateManager setDeleteWordLastDelete:](self->_keyboardStateManager, "setDeleteWordLastDelete:", a3);
}

- (void)dismissKeyboardPopover:(id)a3 beforeCleanup:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    objc_msgSend(v8, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v6)
        -[UIKeyboardImpl cleanupKeyboardPopover:](self, "cleanupKeyboardPopover:", v8);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __66__UIKeyboardImpl_dismissKeyboardPopover_beforeCleanup_completion___block_invoke;
      v11[3] = &unk_1E16B1CF0;
      v14 = v6;
      v11[4] = self;
      v12 = v8;
      v13 = v9;
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v11);

    }
    else
    {
      -[UIKeyboardImpl cleanupKeyboardPopover:](self, "cleanupKeyboardPopover:", v8);
      if (v9)
        (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }

  }
}

- (id)UILanguagePreference
{
  void *v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("intl");
  }

  return v3;
}

+ (double)persistentSplitProgress
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  double v6;

  if (!byte_1ECD783C4)
    return 0.0;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForPreferenceKey:", *MEMORY[0x1E0DBEA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

+ (void)applicationWillEnterForeground:(id)a3
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = _UIKBRT_ResetSystemUptimeOnResume();
  v4 = (void *)qword_1ECD783D8;
  objc_msgSend((id)qword_1ECD783D8, "window", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_updateSoundPreheatingForWindow:", v5);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyboardStateManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostApplicationWillEnterForeground");

}

- (void)willMoveToWindow:(id)a3
{
  id v4;

  v4 = a3;
  -[UIKeyboardImpl _updateExternalDeviceInputSettingForWindow:](self, "_updateExternalDeviceInputSettingForWindow:", v4);
  -[UIKeyboardImpl _updateSoundPreheatingForWindow:](self, "_updateSoundPreheatingForWindow:", v4);

  if (!v4)
  {
    -[UIKeyboardImpl dismissContinuousPathIntroductionView](self, "dismissContinuousPathIntroductionView");
    -[UIKeyboardImpl dismissMultilingualKeyboardTip](self, "dismissMultilingualKeyboardTip");
    -[UIKeyboardImpl dismissMultilingualSettingTip](self, "dismissMultilingualSettingTip");
    -[UIKeyboardImpl dismissStickerEditor:](self, "dismissStickerEditor:", 0);
  }
}

- (void)_updateSoundPreheatingForWindow:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  int v8;
  id v9;

  v9 = a3;
  if (!v9)
    goto LABEL_12;
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyInputDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  v6 = (void *)v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  if (objc_msgSend(WeakRetained, "isMinimized")
    && !-[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible"))
  {

LABEL_11:
    goto LABEL_12;
  }
  if (!objc_msgSend((id)UIApp, "isSuspended")
    || +[UIKeyboardImpl isActivatingForeground](UIKeyboardImpl, "isActivatingForeground"))
  {

    goto LABEL_8;
  }
  v8 = objc_msgSend(v9, "_isHostedInAnotherProcess");

  if (v8)
  {
LABEL_8:
    +[_UIKBFeedbackGeneratorPartner preheatSystemSoundsForObject:](_UIKBFeedbackGeneratorPartner, "preheatSystemSoundsForObject:", self);
    if ((-[_UIKBFeedbackGenerating isActive](self->m_feedbackGenerator, "isActive") & 1) == 0)
      -[_UIKBFeedbackGenerating activateWithCompletionBlock:](self->m_feedbackGenerator, "activateWithCompletionBlock:", 0);
    goto LABEL_15;
  }
LABEL_12:
  if (-[_UIKBFeedbackGenerating isActive](self->m_feedbackGenerator, "isActive"))
    -[_UIKBFeedbackGenerating deactivate](self->m_feedbackGenerator, "deactivate");
  +[_UIKBFeedbackGeneratorPartner cooldownSystemSoundsForObject:](_UIKBFeedbackGeneratorPartner, "cooldownSystemSoundsForObject:", self);
LABEL_15:

}

- (void)releaseInputManagerIfInactive
{
  void *v3;

  -[UIKeyboardImpl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[UIKeyboardImpl releaseInputManager](self, "releaseInputManager");
}

- (void)generateAutocorrectionWithExecutionContext:(id)a3
{
  -[_UIKeyboardStateManager generateAutocorrectionWithExecutionContext:](self->_keyboardStateManager, "generateAutocorrectionWithExecutionContext:", a3);
}

- (void)clearTransientState
{
  self->m_scrolling = 0;
}

- (void)setInputManagerState:(id)a3
{
  -[_UIKeyboardStateManager setInputManagerState:](self->_keyboardStateManager, "setInputManagerState:", a3);
}

- (void)changingContextWithTrigger:(id)a3
{
  -[_UIKeyboardStateManager changingContextWithTrigger:](self->_keyboardStateManager, "changingContextWithTrigger:", a3);
}

- (TIKeyboardInputManagerStub)inputManager
{
  return -[_UIKeyboardStateManager inputManager](self->_keyboardStateManager, "inputManager");
}

- (BOOL)shouldShowCandidateBar
{
  return -[UIKeyboardImpl shouldShowLongPredictionList](self, "shouldShowLongPredictionList")
      || -[UIKeyboardImpl shouldShowCandidateBarIfReceivedCandidatesInCurrentInputMode:ignoreHidePredictionTrait:](self, "shouldShowCandidateBarIfReceivedCandidatesInCurrentInputMode:ignoreHidePredictionTrait:", -[_UIKeyboardStateManager receivedCandidatesInCurrentInputMode](self->_keyboardStateManager, "receivedCandidatesInCurrentInputMode"), 0);
}

- (BOOL)shouldShowLongPredictionList
{
  return -[_UIKeyboardStateManager shouldShowLongPredictionList](self->_keyboardStateManager, "shouldShowLongPredictionList");
}

- (void)clearLayouts
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  UIKeyboardLayout *m_layout;
  NSMutableDictionary *v10;
  NSMutableDictionary *m_keyedLayouts;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyInputDelegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autocorrection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {

LABEL_6:
      -[UIKeyboardImpl acceptAutocorrectionWithCompletionHandler:](self, "acceptAutocorrectionWithCompletionHandler:", 0);
      goto LABEL_7;
    }
    v8 = -[UIKeyboardImpl _hasMarkedText](self, "_hasMarkedText");

    if (v8)
      goto LABEL_6;
  }
  else
  {

  }
LABEL_7:
  -[UIKeyboardImpl clearInput](self, "clearInput");
  -[UIKeyboardImpl removeAutocorrectPromptAndCandidateList](self, "removeAutocorrectPromptAndCandidateList");
  -[UIView removeFromSuperview](self->m_layout, "removeFromSuperview");
  m_layout = self->m_layout;
  self->m_layout = 0;

  v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  m_keyedLayouts = self->m_keyedLayouts;
  self->m_keyedLayouts = v10;

}

- (BOOL)isCallingTextChangedDuringInputModeSwitch
{
  return -[_UIKeyboardStateManager isCallingTextChangedDuringInputModeSwitch](self->_keyboardStateManager, "isCallingTextChangedDuringInputModeSwitch");
}

- (void)generateCandidates
{
  -[UIKeyboardImpl generateCandidatesWithOptions:](self, "generateCandidatesWithOptions:", 0);
}

- (void)generateCandidatesWithOptions:(int)a3
{
  -[_UIKeyboardStateManager generateCandidatesWithOptions:](self->_keyboardStateManager, "generateCandidatesWithOptions:", *(_QWORD *)&a3);
}

- (BOOL)canShowPredictionBar
{
  return -[_UIKeyboardStateManager canShowPredictionBar](self->_keyboardStateManager, "canShowPredictionBar");
}

- (BOOL)_isShowingSuggestionForKeyboardCamera
{
  void *v2;
  void *v3;
  char v4;

  -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textSuggestionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowingSuggestionForKeyboardCamera");

  return v4;
}

- (void)documentStateFromInputDelegate:(id)a3
{
  -[_UIKeyboardStateManager documentStateFromInputDelegate:](self->_keyboardStateManager, "documentStateFromInputDelegate:", a3);
}

- (id)asyncWebKitInteractionDelegate
{
  return -[_UIKeyboardStateManager asyncWebKitInteractionDelegate](self->_keyboardStateManager, "asyncWebKitInteractionDelegate");
}

- (void)didMoveToSuperview
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  -[UIView bounds](self, "bounds");
  +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v3, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSplitWidthsChanged:", byte_1ECD783B8 != byte_1ECD783B0);
  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsSecureTextEntry:", objc_msgSend(v5, "isSecureTextEntry"));

  -[UIView superview](self, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_didChangeKeyplaneWithContext:", v7);

  byte_1ECD783B8 = byte_1ECD783B0;
}

+ (BOOL)shouldAccessInputManagerService
{
  void *v2;
  char v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardLayoutIsInAnotherProcess");

  return v3 ^ 1;
}

- (BOOL)isEmojiPopoverPresented
{
  return -[UIKeyboardPopoverController isPresented](self->_emojiPopoverController, "isPresented");
}

- (BOOL)delegateSupportsImagePaste
{
  return -[_UIKeyboardStateManager delegateSupportsImagePaste](self->_keyboardStateManager, "delegateSupportsImagePaste");
}

- (id)responderForSendCurrentLocation
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (v3 = objc_msgSend(v2, "_sendCurrentLocationAction")) != 0)
  {
    objc_msgSend(v2, "targetForAction:withSender:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)layoutState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  if (self->m_layout)
  {
    v3 = (void *)objc_opt_new();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentSystemInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInputMode:", v6);

    objc_msgSend(v3, "setHasCandidateKey:", -[UIKeyboardLayout hasCandidateKeys](self->m_layout, "hasCandidateKeys"));
    objc_msgSend(v3, "setHasAccentKey:", -[UIKeyboardLayout hasAccentKey](self->m_layout, "hasAccentKey"));
    objc_msgSend(v3, "setCanMultitap:", -[UIKeyboardLayout canMultitap](self->m_layout, "canMultitap"));
    v7 = !-[UIKeyboardImpl isMinimized](self, "isMinimized")
      && -[UIKeyboardLayout isAlphabeticPlane](self->m_layout, "isAlphabeticPlane");
    objc_msgSend(v3, "setIsAlphabeticPlane:", v7);
    objc_msgSend(v3, "setIsKanaPlane:", -[UIKeyboardLayout isKanaPlane](self->m_layout, "isKanaPlane"));
    objc_msgSend(v3, "setDiacriticForwardCompose:", -[UIKeyboardLayout diacriticForwardCompose](self->m_layout, "diacriticForwardCompose"));
    -[UIKeyboardLayout layoutTag](self->m_layout, "layoutTag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLayoutTag:", v8);

    objc_msgSend((id)objc_opt_class(), "keyboardScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v9, -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "idiom");
    v12 = v11;
    if ((unint64_t)(v11 - 2) >= 3 && v11)
    {
      if (v11 == 1)
      {
        if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
          v12 = 0;
        else
          v12 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit") ^ 1;
      }
      else
      {
        v12 = -1;
      }
    }
    objc_msgSend(v3, "setUserInterfaceIdiom:", v12);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)imageSuggestionEnabled
{
  void *v3;
  char v4;

  if (-[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection")
    && (-[UIKeyboardImpl candidateController](self, "candidateController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "activeCandidateViewType"),
        v3,
        (v4 & 4) != 0))
  {
    return 0;
  }
  else
  {
    return -[UIKeyboardImpl delegateSupportsImagePaste](self, "delegateSupportsImagePaste");
  }
}

- (BOOL)candidateSelectionPredictionForTraits
{
  return -[_UIKeyboardStateManager candidateSelectionPredictionForTraits](self->_keyboardStateManager, "candidateSelectionPredictionForTraits");
}

- (BOOL)accessibilityUsesExtendedKeyboardPredictionsEnabled
{
  BOOL v3;
  void *v4;

  if (!-[UIKeyboardImpl canShowPredictionBar](self, "canShowPredictionBar")
    || -[UIKeyboardImpl keyboardIsKeyPad](self, "keyboardIsKeyPad"))
  {
    return 0;
  }
  -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v4, "usesCandidateSelection") & 1) == 0
    && -[_UIKeyboardStateManager isDefaultPrediction](self->_keyboardStateManager, "isDefaultPrediction")
    && _AXSExtendedKeyboardPredictionsEnabled() != 0;

  return v3;
}

- (void)clearInputWithCandidatesCleared:(BOOL)a3
{
  -[_UIKeyboardStateManager clearInputWithCandidatesCleared:](self->_keyboardStateManager, "clearInputWithCandidatesCleared:", a3);
}

- (BOOL)noContent
{
  return -[_UIKeyboardStateManager noContent](self->_keyboardStateManager, "noContent");
}

- (void)updateAssistantView
{
  id v3;

  if (!-[UIKeyboardImpl suppressUpdateAssistantView](self, "suppressUpdateAssistantView"))
  {
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUpdateAssistantView:", 1);
    -[UIKeyboardImpl _didChangeKeyplaneWithContext:](self, "_didChangeKeyplaneWithContext:", v3);

  }
}

- (BOOL)suppressUpdateAssistantView
{
  return -[_UIKeyboardStateManager suppressUpdateAssistantView](self->_keyboardStateManager, "suppressUpdateAssistantView");
}

- (void)setCandidates:(id)a3
{
  -[_UIKeyboardStateManager setCandidates:](self->_keyboardStateManager, "setCandidates:", a3);
}

- (void)setAutocorrection:(id)a3
{
  -[_UIKeyboardStateManager setAutocorrection:](self->_keyboardStateManager, "setAutocorrection:", a3);
}

- (void)clearInputForMarkedText
{
  -[_UIKeyboardStateManager clearInputForMarkedText](self->_keyboardStateManager, "clearInputForMarkedText");
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4;
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
  void *v15;
  uint64_t v16;
  UIKeyboardImpl **v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  BOOL v22;
  double v23;
  double v24;
  UIKeyboardImpl *v25;
  UIKeyboardImpl *v26;

  v4 = a3;
  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSecureTextEntry:", objc_msgSend(v5, "isSecureTextEntry"));

  if ((objc_msgSend(v4, "sizeDidChange") & 1) != 0)
  {
    objc_msgSend(v4, "size");
    v7 = v6;
    v9 = v8;
    +[UIKeyboardImpl additionalInstanceHeight](UIKeyboardImpl, "additionalInstanceHeight");
    v11 = v10;
    v12 = v9 + v10;
    -[UIView bounds](self, "bounds");
    if (v7 != v14 || v12 != v13)
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
        && (-[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "keyboardType"),
            v15,
            v16 == 127))
      {
        -[UIKeyboardImpl setFrame:](self, "setFrame:", 0.0, 0.0, v7, v9);
      }
      else
      {
        -[UIView setFrame:](self->m_layout, "setFrame:", 0.0, v11, v7, v9);
        -[UIKeyboardImpl setFrame:](self, "setFrame:", 0.0, 0.0, v7, v12);
        if (-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
          -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 1);
      }
    }
    -[UIView frame](self->m_layout, "frame");
    if (v11 != v18 || (-[UIView frame](self->m_layout, "frame"), v19 != 0.0))
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferencesActions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "currentInputModeSupportsCrescendo") & 1) != 0)
      {

      }
      else
      {
        v22 = +[UIKeyboard resizable](UIKeyboard, "resizable");

        if (!v22)
          -[UIView setFrameOrigin:](self->m_layout, "setFrameOrigin:", 0.0, v11);
      }
    }
    -[UIView bounds](self, "bounds");
    objc_msgSend(v4, "setSize:", v23, v24);
    v25 = self;
    v17 = &v25;
  }
  else
  {
    v26 = self;
    v17 = &v26;
  }
  v17[1] = (UIKeyboardImpl *)UIKeyboardImpl;
  objc_msgSendSuper2((objc_super *)v17, sel__didChangeKeyplaneWithContext_, v4, v25);

}

- (BOOL)_shouldLoadPredictionsBasedOnCurrentTraits
{
  void *v2;
  void *v3;
  BOOL v5;
  int v6;
  void *v7;
  uint64_t v8;

  if (-[UIKeyboardImpl predictionFromPreference](self, "predictionFromPreference"))
  {
    v5 = -[UIKeyboardImpl prewarmsPredictiveCandidates](self, "prewarmsPredictiveCandidates");
    if (!v5)
    {
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v2, "disablePrediction") & 1) != 0)
      {
LABEL_6:
        LOBYTE(v6) = 0;
LABEL_12:

        return v6;
      }
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "hidePrediction"))
      {

        goto LABEL_6;
      }
    }
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "autocorrectionType");

    if (!v5)
    {

    }
    if (v8 != 1)
    {
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v2, "isSecureTextEntry") ^ 1;
      goto LABEL_12;
    }
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)predictionFromPreference
{
  return -[_UIKeyboardStateManager predictionFromPreference](self->_keyboardStateManager, "predictionFromPreference");
}

+ (double)additionalInstanceHeight
{
  void *v3;
  double v4;
  double v5;

  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "additionalInstanceHeightForInterfaceOrientation:hasInputView:", objc_msgSend(v3, "interfaceOrientation"), 0);
  v5 = v4;

  return v5;
}

- (void)removeTextChoiceUnderlines
{
  id v3;

  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllUnderlines");

  }
}

- (BOOL)selectionScrolling
{
  return self->m_scrolling;
}

- (void)_updateCanSuggestSupplementalItemsForCurrentSelection
{
  -[_UIKeyboardStateManager _updateCanSuggestSupplementalItemsForCurrentSelection](self->_keyboardStateManager, "_updateCanSuggestSupplementalItemsForCurrentSelection");
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return -[_UIKeyboardStateManager canSuggestSupplementalItemsForCurrentSelection](self->_keyboardStateManager, "canSuggestSupplementalItemsForCurrentSelection");
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIKeyboardStateManager keyboardState](self->_keyboardStateManager, "keyboardState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanSuggestSupplementalItemsForCurrentSelection:", v3);

}

- (void)setDocumentState:(id)a3
{
  -[_UIKeyboardStateManager setDocumentState:](self->_keyboardStateManager, "setDocumentState:", a3);
}

- (id)documentState
{
  return -[_UIKeyboardStateManager documentState](self->_keyboardStateManager, "documentState");
}

- (void)displayAutoFillPopoverIfAutoFillModeDetected
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone](UIKeyboard, "useAutoFillUIRTIInterfaceForIphone")
    && !+[UIKeyboard isAlwaysBlockedAutoFillPanelClient](UIKeyboard, "isAlwaysBlockedAutoFillPanelClient")
    && +[UIKeyboard isAutoFillPanelUIEnabled](UIKeyboard, "isAutoFillPanelUIEnabled")
    && (+[UIKeyboard isAutoFillPanelInAppsEnabled](UIKeyboard, "isAutoFillPanelInAppsEnabled")
     || +[UIKeyboard isAlwaysAllowedAutoFillPanelClient](UIKeyboard, "isAlwaysAllowedAutoFillPanelClient"))
    && (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
     || +[UIKeyboard usesInputSystemUIForAutoFillOnly](UIKeyboard, "usesInputSystemUIForAutoFillOnly")))
  {
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "documentTraits");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "autofillMode");

    }
    else
    {
      v5 = -[_UIKeyboardStateManager cachedAutofillMode](self->_keyboardStateManager, "cachedAutofillMode");
    }
    switch(v5)
    {
      case 1:
      case 8:
        -[UIKeyboardImpl handleAutoFillPasswordDetected](self, "handleAutoFillPasswordDetected");
        break;
      case 5:
      case 6:
      case 7:
        -[UIKeyboardImpl handleAutoFillContactDetected](self, "handleAutoFillContactDetected");
        break;
      case 9:
        -[UIKeyboardImpl handleAutoFillCreditCardDetected](self, "handleAutoFillCreditCardDetected");
        break;
      default:
        return;
    }
  }
}

- (void)prepareKeyboardInputModeFromPreferences:(id)a3
{
  -[_UIKeyboardStateManager prepareKeyboardInputModeFromPreferences:](self->_keyboardStateManager, "prepareKeyboardInputModeFromPreferences:", a3);
}

- (CGRect)frameForKeylayoutName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v4 = a3;
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rtiInputSourceState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("split-left")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("split-right")))
    {
      objc_msgSend(v6, "rightSplitFrame");
      goto LABEL_6;
    }
LABEL_7:
    -[NSMutableDictionary objectForKey:](self->m_keyedLayouts, "objectForKey:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frameForKeylayoutName:", v4);
    v11 = v16;
    v12 = v17;
    v13 = v18;
    v14 = v19;

    goto LABEL_8;
  }
  objc_msgSend(v6, "leftSplitFrame");
LABEL_6:
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
LABEL_8:

  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)isShiftLocked
{
  return -[_UIKeyboardStateManager shiftLocked](self->_keyboardStateManager, "shiftLocked");
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3 userInitiated:(BOOL)a4
{
  -[_UIKeyboardStateManager setShouldSkipCandidateSelection:userInitiated:](self->_keyboardStateManager, "setShouldSkipCandidateSelection:userInitiated:", a3, a4);
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  -[_UIKeyboardStateManager setShouldSkipCandidateSelection:userInitiated:](self->_keyboardStateManager, "setShouldSkipCandidateSelection:userInitiated:", a3, 1);
}

- (void)deactivateLayout
{
  -[UIKeyboardImpl clearLanguageIndicator](self, "clearLanguageIndicator");
  -[UIKeyboardLayout deactivateActiveKeys](self->m_layout, "deactivateActiveKeys");
}

- (id)inputModePreference
{
  void *v2;
  void *v3;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setInputModeFromPreferences
{
  -[_UIKeyboardStateManager setInputModeFromPreferences](self->_keyboardStateManager, "setInputModeFromPreferences");
}

+ (BOOL)smartInsertDeleteIsEnabled
{
  void *v3;
  void *v4;
  char v5;

  if (qword_1ECD783D8)
    return objc_msgSend((id)qword_1ECD783D8, "smartInsertDeleteIsEnabled");
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE4F8]);

  return v5;
}

- (void)setInSplitKeyboardMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL8 v6;
  id v7;

  v3 = a3;
  -[UIKeyboardImpl keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSplitKeyboardMode:", v3);

  v6 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");
  -[UIKeyboardLayout screenTraits](self->m_layout, "screenTraits");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsSplit:", v6);

}

- (CGRect)getCorrectionRectIsVertical:(BOOL *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_UIKeyboardStateManager getCorrectionRectIsVertical:](self->_keyboardStateManager, "getCorrectionRectIsVertical:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)handleObserverCallback
{
  __CFRunLoopObserver *m_observer;
  void *v4;

  m_observer = self->m_observer;
  if (m_observer)
  {
    CFRelease(m_observer);
    self->m_observer = 0;
  }
  -[_UIKeyboardStateManager changedDelegate](self->_keyboardStateManager, "changedDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UIKeyboardStateManager callChangedDelegate](self->_keyboardStateManager, "callChangedDelegate");
  if (-[_UIKeyboardStateManager shiftNeedsUpdate](self->_keyboardStateManager, "shiftNeedsUpdate"))
  {
    -[_UIKeyboardStateManager _setShiftNeedsUpdate:](self->_keyboardStateManager, "_setShiftNeedsUpdate:", 0);
    -[UIKeyboardImpl updateShiftState](self, "updateShiftState");
  }
  -[UIKeyboardLayout updateUndoKeyState](self->m_layout, "updateUndoKeyState");
}

- (_UIKeyboardTextSelectionController)textSelectionController
{
  return -[_UIKeyboardStateManager textSelectionController](self->_keyboardStateManager, "textSelectionController");
}

- (void)updateReturnKey:(BOOL)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  int m_returnKeyState;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  if (!self->m_inDealloc)
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "emptyContentReturnKeyType");

    if (v6)
    {
LABEL_28:
      -[UIKeyboardImpl callLayoutUpdateReturnKey](self, "callLayoutUpdateReturnKey");
      v28[0] = CFSTR("UITextInputReturnKeyStateChangedDisplayStringKey");
      -[UIKeyboardImpl returnKeyDisplayName](self, "returnKeyDisplayName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v24;
      v28[1] = CFSTR("UITextInputReturnKeyStateChangedStateKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UIKeyboardImpl returnKeyEnabled](self, "returnKeyEnabled"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("UITextInputReturnKeyStateChangedNotification"), 0, v26);

      return;
    }
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "enablesReturnKeyAutomatically"))
    {

    }
    else
    {
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "enablesReturnKeyOnNonWhiteSpaceContent");

      if (!v9)
      {
        if (self->m_returnKeyEnabledInLayout != -[UIKeyboardImpl returnKeyEnabled](self, "returnKeyEnabled"))
          goto LABEL_28;
        goto LABEL_27;
      }
    }
    m_returnKeyState = self->m_returnKeyState;
    v11 = -[UIKeyboardImpl noContent](self, "noContent");
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && !v11)
    {
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "enablesReturnKeyOnNonWhiteSpaceContent");

      if (!v14 || -[UIKeyboardImpl _hasMarkedText](self, "_hasMarkedText"))
      {
        v11 = 0;
LABEL_15:
        -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "keyInputDelegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          v20 = v11;
        else
          v20 = 1;

        if ((v20 & 1) == 0 && m_returnKeyState == 1 || (v20 & 1) == 0 && (m_returnKeyState | 2) == 3)
        {
          v21 = 0;
LABEL_23:
          self->m_returnKeyState = v21;
          goto LABEL_28;
        }
        if (v11 && (m_returnKeyState | 2) == 2)
        {
          -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "emptyContentReturnKeyType");

          if (!v23)
          {
            v21 = 1;
            goto LABEL_23;
          }
        }
LABEL_27:
        if (!a3)
          return;
        goto LABEL_28;
      }
      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_fullText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v17, "length") == 0;

    }
    goto LABEL_15;
  }
}

- (void)callLayoutUpdateReturnKey
{
  UIKeyboardLayout *m_layout;
  _BOOL8 m_returnKeyEnabledInLayout;
  id v5;

  self->m_returnKeyEnabledInLayout = -[UIKeyboardImpl returnKeyEnabled](self, "returnKeyEnabled");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    m_layout = self->m_layout;
    m_returnKeyEnabledInLayout = self->m_returnKeyEnabledInLayout;
    -[UIKeyboardImpl returnKeyDisplayName](self, "returnKeyDisplayName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardLayout setReturnKeyEnabled:withDisplayName:withType:](m_layout, "setReturnKeyEnabled:withDisplayName:withType:", m_returnKeyEnabledInLayout, v5, -[UIKeyboardImpl returnKeyType](self, "returnKeyType"));

  }
}

- (BOOL)returnKeyEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;

  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "keyboardType") == 122)
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "returnKeyType");

    if (v5 == 9)
      return 1;
  }
  else
  {

  }
  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "enablesReturnKeyAutomatically"))
  {

  }
  else
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "enablesReturnKeyOnNonWhiteSpaceContent");

    if ((v9 & 1) == 0)
    {
      -[UIKeyboardImpl updatedKeyBehaviors](self, "updatedKeyBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "returnKeyBehavior");

      if (v11 != 9)
      {
        if (v11)
          return 1;
      }
    }
  }
  return (self->m_returnKeyState & 0xFFFFFFFD) == 0;
}

- (id)returnKeyDisplayName
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "emptyContentReturnKeyType") != 1)
  {

    goto LABEL_5;
  }
  v4 = -[UIKeyboardImpl noContent](self, "noContent");

  if (!v4)
  {
LABEL_5:
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardLocalizedReturnKeyName(objc_msgSend(v6, "returnKeyType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  UIKeyboardLocalizedString(CFSTR("UI-Cancel"), 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (int)returnKeyType
{
  return -[_UIKeyboardStateManager returnKeyType](self->_keyboardStateManager, "returnKeyType");
}

- (void)updateStylingTraitsIfNeeded
{
  id v3;

  -[UIKeyboardImpl responderStylingTraitsForceEditingMask:](self, "responderStylingTraitsForceEditingMask:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardLayout setTextEditingTraits:](self->m_layout, "setTextEditingTraits:", v3);

}

- (void)updateReturnKey
{
  -[UIKeyboardImpl updateReturnKey:](self, "updateReturnKey:", 0);
}

- (void)setShiftPreventAutoshift:(BOOL)a3
{
  -[_UIKeyboardStateManager setShiftPreventAutoshift:](self->_keyboardStateManager, "setShiftPreventAutoshift:", a3);
}

- (void)setShiftOffIfNeeded
{
  -[_UIKeyboardStateManager setShiftOffIfNeeded](self->_keyboardStateManager, "setShiftOffIfNeeded");
}

- (void)setShift:(BOOL)a3 autoshift:(BOOL)a4
{
  -[_UIKeyboardStateManager setShift:autoshift:](self->_keyboardStateManager, "setShift:autoshift:", a3, a4);
}

- (void)updateObserverState
{
  void *v3;
  __CFRunLoop *Current;

  -[_UIKeyboardStateManager changedDelegate](self->_keyboardStateManager, "changedDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (!-[_UIKeyboardStateManager shiftNeedsUpdate](self->_keyboardStateManager, "shiftNeedsUpdate"))
  {
    return;
  }
  if (!self->m_observer)
  {
    self->m_observer = CFRunLoopObserverCreate(0, 4uLL, 0, 0, (CFRunLoopObserverCallBack)observerCallback, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, self->m_observer, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  }
}

- (void)setShiftNeedsUpdate
{
  -[_UIKeyboardStateManager setShiftNeedsUpdate:](self->_keyboardStateManager, "setShiftNeedsUpdate:", 1);
}

- (void)setShift:(BOOL)a3
{
  -[UIKeyboardImpl setShift:autoshift:](self, "setShift:autoshift:", a3, 0);
}

- (id)responderStylingTraitsForceEditingMask:(BOOL)a3
{
  unint64_t v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
    v4 = 6;
  else
    v4 = -[UIKeyboardLayout textEditingKeyMask](self->m_layout, "textEditingKeyMask");
  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEditable");

    if (!v8)
      v4 &= ~1uLL;
  }
  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_responderForEditing");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBTextEditingTraits traitsWithResponder:keyMaskFlags:](UIKBTextEditingTraits, "traitsWithResponder:keyMaskFlags:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UITextCursorAssertion)cursorAssertion
{
  return self->_cursorAssertion;
}

- (id)_activeAssertionController
{
  return -[_UIKeyboardStateManager _activeAssertionController](self->_keyboardStateManager, "_activeAssertionController");
}

- (void)setInputModeAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeAssertion, a3);
}

- (UITextCursorAssertion)inputModeAssertion
{
  return self->_inputModeAssertion;
}

+ (void)applicationDidBecomeActive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCursorLocation:", 258);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateTouchProcessingForKeyboardChange");

}

- (void)setCaretBlinks:(BOOL)a3
{
  void *v5;
  id v6;

  -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    -[UIKeyboardImpl _activeAssertionController](self, "_activeAssertionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCursorBlinks:", objc_msgSend(v5, "_isNonBlinking") ^ 1);

  }
  else
  {
    objc_msgSend(v6, "setCursorBlinks:", 0);
  }

}

- (void)updateLayout
{
  UIKeyboardLayout *m_layout;
  UIKeyboardLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  double v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  UIKeyboardLayout *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[2];
  _QWORD v64[3];

  v64[2] = *MEMORY[0x1E0C80C00];
  if (self->m_initializationDone
    && !self->m_updatingLayout
    && !-[UIKeyboardImpl suppressUpdateLayout](self, "suppressUpdateLayout"))
  {
    if (-[UIKeyboardImpl keyboardLayoutIsInAnotherProcess](self, "keyboardLayoutIsInAnotherProcess"))
    {
      m_layout = self->m_layout;
      if (m_layout)
      {
        -[UIView removeFromSuperview](m_layout, "removeFromSuperview");
        v4 = self->m_layout;
        self->m_layout = 0;

      }
    }
    else
    {
      self->m_updatingLayout = 1;
      objc_storeWeak((id *)&self->_activeLayout, 0);
      UIKeyboardGetCurrentInputMode();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetNormalizedIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "keyboardWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v8, -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "idiom") == 2)
      {
        +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
          v11 = v7;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "_useLinearLayout");

          v7 = v11;
        }
        else
        {
          v13 = 0;
        }

        objc_msgSend(v9, "updateForLinearLayout:", v13);
      }
      else if (objc_msgSend(v9, "idiom") == 3)
      {
        -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateForTextInputTraits:supportedInteractionModel:", v14, -[UIKeyboardImpl requestedInteractionModel](self, "requestedInteractionModel"));

      }
      objc_msgSend(v9, "setSupportsSplit:", +[UIKeyboardImpl supportsSplit](UIKeyboardImpl, "supportsSplit"));
      objc_msgSend(v9, "setIsSplit:", +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"));
      objc_msgSend(v9, "setCenterFilled:", -[UIKeyboardImpl centerFilled](self, "centerFilled"));
      -[UIKeyboardImpl candidateController](self, "candidateController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "barIsExtended");

      if (v16)
      {
        -[UIKeyboardImpl candidateController](self, "candidateController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "collapse");

      }
      -[UIKeyboardImpl candidateController](self, "candidateController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setScreenTraits:", v9);

      -[UIKeyboardLayout clearTransientState](self->m_layout, "clearTransientState");
      v19 = (void *)objc_opt_class();
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "layoutClassForInputMode:keyboardType:screenTraits:", v6, objc_msgSend(v20, "keyboardType"), v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v60 = v7;
        v62 = v5;
        v61 = v6;
        if (!objc_msgSend(v6, "isEqualToString:", CFSTR("dictation"))
          || (-[UIView bounds](self, "bounds"), v23 = *MEMORY[0x1E0C9D820], *MEMORY[0x1E0C9D820] == v24)
          && (v23 = *(double *)(MEMORY[0x1E0C9D820] + 8), v23 == v22))
        {
          +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "interfaceOrientation");

          +[UIKeyboardImpl keyboardSizeForInterfaceOrientation:](UIKeyboardImpl, "keyboardSizeForInterfaceOrientation:", v26);
          v28 = v27;
          v30 = v29;
          +[UIKeyboardImpl topMarginForInterfaceOrientation:](UIKeyboardImpl, "topMarginForInterfaceOrientation:", v26);
          v32 = v30 - v31;
          v33 = -[UIView _keyboardOrientation](self, "_keyboardOrientation");
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "currentInputMode");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:](UIKeyboardImpl, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", v33, v35);
          self->m_bottomPadding = v36;

          v37 = v32 + self->m_bottomPadding;
        }
        else
        {
          -[UIView bounds](self, "bounds", v23);
          v28 = v38;
          v37 = v39;
        }
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "systemInputAssistantViewController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIView traitCollection](self, "traitCollection");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "preferredHeightForTraitCollection:", v42);
        v44 = v43;

        objc_msgSend(v9, "setKeyboardBarHeight:", v44);
        -[NSMutableDictionary objectForKey:](self->m_keyedLayouts, "objectForKey:", v21);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v46 = v45;
          +[UIKeyboardImpl additionalInstanceHeight](UIKeyboardImpl, "additionalInstanceHeight");
          objc_msgSend(v46, "setFrame:", 0.0, v47, v28, v37);
        }
        else
        {
          v46 = (id)objc_msgSend((id)objc_msgSend(v21, "alloc"), "initWithFrame:", 0.0, 0.0, v28, v37);
          -[UIKeyboardImpl taskQueue](self, "taskQueue");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setTaskQueue:", v48);

          if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || _UIGetUseTwoFingerPhone())
          {
            +[_UIKeyboardTextSelectionGestureController sharedInstance](_UIKeyboardTextSelectionGestureController, "sharedInstance");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (id)objc_msgSend(v49, "addTwoFingerTextSelectionInteractionsToView:", v46);

          }
          +[_UIKeyboardTextSelectionGestureController sharedInstance](_UIKeyboardTextSelectionGestureController, "sharedInstance");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (id)objc_msgSend(v51, "addOneFingerTextSelectionInteractionsToView:", v46);

          -[NSMutableDictionary setObject:forKey:](self->m_keyedLayouts, "setObject:forKey:", v46, v21);
        }
        v53 = self->m_layout;
        if (v53
          && -[UIKeyboardLayout shouldFadeFromLayout](v53, "shouldFadeFromLayout")
          && objc_msgSend(v46, "shouldFadeToLayout"))
        {
          v54 = objc_alloc(MEMORY[0x1E0CB36C0]);
          v64[0] = v46;
          v64[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(v54, "initWithTarget:selector:object:", self, sel_finishLayoutChangeWithArguments_, v55);

          -[UIKeyboardLayout fadeWithInvocation:](self->m_layout, "fadeWithInvocation:", v56);
        }
        else
        {
          v63[0] = v46;
          v63[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardImpl finishLayoutChangeWithArguments:](self, "finishLayoutChangeWithArguments:", v56);
        }

        if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
        {
          -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (v57)
          {
            -[UIKeyboardImpl buildInputSourceState](self, "buildInputSourceState");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "textOperations");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setInputSourceState:", v58);

            objc_msgSend(v57, "flushOperations");
          }

        }
        self->m_updatingLayout = 0;

        v6 = v61;
        v5 = v62;
        v7 = v60;
      }
      else
      {
        self->m_updatingLayout = 0;
      }

    }
  }
}

- (void)finishLayoutChangeWithArguments:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  UIKeyboardLayout **p_m_layout;
  UIKeyboardLayout *v9;
  UIKeyboardLayout *m_layout;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  _BOOL4 v40;
  UIKeyboardLayout *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  id v46;

  v46 = a3;
  v4 = objc_msgSend(v46, "count") == 2;
  v5 = v46;
  if (v4)
  {
    objc_msgSend(v46, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_m_layout = &self->m_layout;
    v9 = self->m_layout;
    objc_storeStrong((id *)&self->m_layout, v6);
    m_layout = self->m_layout;
    if (v9)
    {
      v4 = v9 == m_layout;
      m_layout = v9;
      if (!v4)
      {
        -[UIView removeFromSuperview](v9, "removeFromSuperview");
        m_layout = *p_m_layout;
      }
    }
    -[UIKeyboardLayout setSizeDelegate:](m_layout, "setSizeDelegate:", self);
    -[UIView addSubview:](self, "addSubview:", *p_m_layout);
    if (+[UIKeyboard resizable](UIKeyboard, "resizable"))
    {
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](*p_m_layout, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView topAnchor](*p_m_layout, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView topAnchor](self, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActive:", 1);

      -[UIView bottomAnchor](*p_m_layout, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bottomAnchor](self, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setActive:", 1);

      -[UIView leadingAnchor](*p_m_layout, "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView leadingAnchor](self, "leadingAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      -[UIView trailingAnchor](*p_m_layout, "trailingAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setActive:", 1);

    }
    -[UIKeyboardImpl setShouldSkipCandidateSelection:](self, "setShouldSkipCandidateSelection:", 0);
    -[_UIKeyboardStateManager setOriginalShouldSkipCandidateSelection:](self->_keyboardStateManager, "setOriginalShouldSkipCandidateSelection:", 0);
    if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit")
      && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "textInputTraits"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "acceptsSplitKeyboard"),
          v24,
          v23,
          v25))
    {
      -[UIKeyboardLayout currentKeyplane](v9, "currentKeyplane");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "frameForKeylayoutName:", CFSTR("split-left"));
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      objc_msgSend(v26, "frameForKeylayoutName:", CFSTR("split-right"));
      +[UIKBSplitTraits traitsWithLeftFrame:rightFrame:corners:](UIKBSplitTraits, "traitsWithLeftFrame:rightFrame:corners:", -1, v28, v30, v32, v34, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = 0;
    }
    v40 = -[_UIKeyboardStateManager updatingPreferences](self->_keyboardStateManager, "updatingPreferences");
    v41 = *p_m_layout;
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      -[UIKeyboardLayout reloadKeyboardWithInputTraits:screenTraits:splitTraits:](v41, "reloadKeyboardWithInputTraits:screenTraits:splitTraits:", v42, v7, v39);
    else
      -[UIKeyboardLayout showKeyboardWithInputTraits:screenTraits:splitTraits:](v41, "showKeyboardWithInputTraits:screenTraits:splitTraits:", v42, v7, v39);

    -[UIKeyboardImpl updateShiftState](self, "updateShiftState");
    -[_UIKeyboardStateManager _setShiftNeedsUpdate:](self->_keyboardStateManager, "_setShiftNeedsUpdate:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "postNotificationName:object:", CFSTR("UIKeyboardLayoutDidChangedNotification"), 0);

    -[UIKeyboardImpl callLayoutUpdateReturnKey](self, "callLayoutUpdateReturnKey");
    -[UIKeyboardImpl hideInternationalKeyIntroductionIfNeeded](self, "hideInternationalKeyIntroductionIfNeeded");
    if (-[UIKeyboardImpl floatingForced](self, "floatingForced"))
    {
      -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "usesContinuousPath");

      if (v45)
        -[UIKeyboardImpl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_presentContinuousPathIntroductionView, 0, 0.0);
    }

    v5 = v46;
  }

}

- (BOOL)isAutoShifted
{
  return -[_UIKeyboardStateManager autoshifted](self->_keyboardStateManager, "autoshifted");
}

- (BOOL)isShifted
{
  return -[_UIKeyboardStateManager shifted](self->_keyboardStateManager, "shifted");
}

- (void)hideInternationalKeyIntroductionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIKeyboardImpl internationalKeyIntroductionView](self, "internationalKeyIntroductionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferencesActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didTriggerOneTimeAction:", *MEMORY[0x1E0DBEA60]);

    -[UIKeyboardImpl internationalKeyIntroductionView](self, "internationalKeyIntroductionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[UIKeyboardImpl setInternationalKeyIntroductionView:](self, "setInternationalKeyIntroductionView:", 0);
  }
}

- (UIView)internationalKeyIntroductionView
{
  return self->_internationalKeyIntroductionView;
}

- (UIEdgeInsets)deviceSpecificStaticHitBufferForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v5;
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
  UIEdgeInsets result;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", a3, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v5;
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
  UIEdgeInsets result;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "deviceSpecificPaddingForInterfaceOrientation:inputMode:", a3, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (BOOL)centerFilled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 m_rivenCenterFilled;
  void *v9;
  BOOL v10;
  void *v11;

  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rtiInputSourceState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rtiInputSourceState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "centerFilled");

  }
  else
  {
    m_rivenCenterFilled = self->m_rivenCenterFilled;
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadAwareInputViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "supportsSplit"))
      v10 = -[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible");
    else
      v10 = 1;
    self->m_rivenCenterFilled = v10;
    if (objc_msgSend(v5, "isEmpty"))
    {
      self->m_rivenCenterFilled = m_rivenCenterFilled;
    }
    else if (m_rivenCenterFilled != self->m_rivenCenterFilled)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardRivenVisualStyleDidChange"), 0, 0);

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIKeyboardLayout setKeyboardAppearance:](self->m_layout, "setKeyboardAppearance:", -1);
    }
    v7 = self->m_rivenCenterFilled;
  }

  return v7;
}

+ (BOOL)supportsSplit
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    LODWORD(v4) = +[UIKeyboardImpl rivenPreference](UIKeyboardImpl, "rivenPreference");

    if ((_DWORD)v4)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textInputTraits");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = objc_msgSend(v5, "keyboardType");
      LOBYTE(v4) = 0;
      if (v6 != 12 && v6 != 122 && v6 != 127)
        LOBYTE(v4) = UIKeyboardSupportsSplit();

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)setUsesCandidateSelection:(BOOL)a3
{
  -[_UIKeyboardStateManager setUsesCandidateSelection:](self->_keyboardStateManager, "setUsesCandidateSelection:", a3);
}

- (void)delayedInit
{
  uint64_t SafeDeviceIdiom;
  char **v4;
  char *v5;
  const NSNotificationName *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_applicationSuspendedEventsOnly_, CFSTR("UIApplicationSuspendedEventsOnlyNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_applicationResumedEventsOnly_, CFSTR("UIApplicationResumedEventsOnlyNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_applicationResumed_, CFSTR("UIApplicationResumedNotification"), 0);
  SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  v4 = &selRef_updateInputAssistantButtonItems;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v4 = &selRef_keyboardDidHide_;
  v5 = *v4;
  v6 = &UIContentSizeCategoryDidChangeNotification;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) != 1)
    v6 = &UIKeyboardDidHideNotification;
  objc_msgSend(v8, "addObserver:selector:name:object:", self, v5, *v6, 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_selectionScrolling_, CFSTR("UITextSelectionWillScroll"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_selectionScrolling_, CFSTR("UITextSelectionDidScroll"), 0);
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupResponderChangeListeners");

  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__updateKeyboardSuppression_, CFSTR("UITextInputUpdateKeyboardSuppressionNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__updateKeyboardLanguage_, CFSTR("UITextInputUpdateKeyboardLanguageNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_scribbleWillBeginWriting_, CFSTR("_UIScribbleWillBeginWriting"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_beginObservingInputOverlayContainerFrame, CFSTR("UIWindowSceneDidBeginLiveResizeNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_endObservingInputOverlayContainerFrame, CFSTR("UIWindowSceneDidEndLiveResizeNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__dictationDidRecieveDidBeginDictationNotification_, CFSTR("UIKeyboardDidBeginDictationNotification"), 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_textSelectionInteractionWillBegin_, CFSTR("UITextSelectionInteractionWillBegin"), 0);

}

- (void)notifyInputSourceStateChangeIfNeeded
{
  -[_UIKeyboardStateManager notifyInputSourceStateChangeIfNeeded](self->_keyboardStateManager, "notifyInputSourceStateChangeIfNeeded");
}

void __51__UIKeyboardImpl_sharedInstanceForCustomInputView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_applicationWillSuspend_, CFSTR("UIApplicationSuspendedNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_applicationDidReceiveMemoryWarning_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_applicationWillResignActive_, CFSTR("UIApplicationWillResignActiveNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_applicationDidBecomeActive_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_applicationWillEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_applicationDidEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_switchControlStatusDidChange_, CFSTR("UIAccessibilitySwitchControlStatusDidChangeNotification"), 0);

}

void __51__UIKeyboardImpl_topMarginForInterfaceOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v2, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isKeyboardMinorEdgeWidth") && (objc_msgSend(v7, "keyboardWidth"), v3 >= 1024.0))
    {
      v4 = 7.0;
      v5 = 5.0;
    }
    else
    {
      v4 = 10.0;
      v5 = 7.0;
    }
    qword_1ECD783E8 = *(_QWORD *)&v5;
    unk_1ECD783F0 = *(_QWORD *)&v4;
    v6 = (void *)qword_1ECD783F8;
    qword_1ECD783F8 = (uint64_t)&unk_1E1A941F0;

  }
}

- (void)updateTextCandidateView
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  char v23;
  _UIKeyboardStateManager *keyboardStateManager;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  _UIKeyboardStateManager *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  char v74;
  void *v75;
  _UIKeyboardStateManager *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  uint64_t v88;
  void *v89;
  double v90;
  double v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  char v117;
  void *v118;
  id v119;
  void *v120;
  char v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  char v135;
  uint64_t v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  int v141;
  void *v142;
  void *v143;
  double v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  void *v156;
  char v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  char isKindOfClass;
  double v164;
  int v165;
  void *v166;
  void *v167;
  unsigned __int8 v168;
  CGRect v169;
  CGRect v170;

  if (!self->m_suppressUpdateCandidateView)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "shouldSuppressUpdateCandidateView");

      if ((v5 & 1) == 0)
      {
        -[UIKeyboardImpl candidateController](self, "candidateController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "inLineCandidateViewIsHosted");

        if (v7)
        {
          -[UIKeyboardImpl updateHostedInlineCandidateView](self, "updateHostedInlineCandidateView");
          return;
        }
        if (-[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection")
          && -[_UIKeyboardStateManager predictionType](self->_keyboardStateManager, "predictionType") == 4)
        {
          -[_UIKeyboardStateManager setPredictionType:](self->_keyboardStateManager, "setPredictionType:", 2);
        }
        if (!-[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible"))
        {
          -[UIKeyboardImpl clearAutocorrectPromptTimer](self, "clearAutocorrectPromptTimer");
          if (-[_UIKeyboardStateManager _isSelecting](self->_keyboardStateManager, "_isSelecting")
            && !-[UIKeyboardImpl hasEditableMarkedText](self, "hasEditableMarkedText"))
          {
            -[UIKeyboardImpl removeCandidateList](self, "removeCandidateList");
            return;
          }
          v168 = 0;
          -[UIKeyboardImpl getCorrectionRectIsVertical:](self, "getCorrectionRectIsVertical:", &v168);
          v9 = v8;
          v11 = v10;
          v13 = v12;
          v15 = v14;
          v16 = v168;
          -[UIKeyboardImpl candidateController](self, "candidateController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setInlineRectIsVertical:", v16);

          objc_msgSend((id)objc_opt_class(), "keyboardScreen");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v18, -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIKeyboardImpl candidateController](self, "candidateController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setScreenTraits:", v19);

          -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            if (-[UIKeyboardImpl isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"))
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
              v23 = objc_msgSend(WeakRetained, "isMinimized");

              if ((v23 & 1) != 0)
                goto LABEL_19;
            }
            keyboardStateManager = self->_keyboardStateManager;
            -[UIKeyboardLayout candidateList](self->m_layout, "candidateList");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIKeyboardStateManager _setCandidateList:](keyboardStateManager, "_setCandidateList:", v25);

            -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v26)
            {
LABEL_19:
              -[UIKeyboardImpl candidateController](self, "candidateController");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "activeCandidateViewType");

              -[UIKeyboardImpl candidateController](self, "candidateController");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if ((v28 & 1) != 0)
              {
                objc_msgSend(v29, "candidateKey");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v31 = objc_msgSend(v29, "activeCandidateViewType");

                if ((v31 & 4) == 0)
                  goto LABEL_24;
                -[UIKeyboardImpl candidateController](self, "candidateController");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "inlineCandidateView");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v33 = v32;
              objc_msgSend(v32, "superview");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
LABEL_25:
                v35 = -[UIKeyboardImpl shouldShowCandidateBar](self, "shouldShowCandidateBar");
                if (!-[UIKeyboardImpl floatingForced](self, "floatingForced"))
                  goto LABEL_28;
                if (-[UIKeyboardImpl _shouldSuppressAssistantBar](self, "_shouldSuppressAssistantBar"))
                  goto LABEL_28;
                +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "currentInputMode");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "identifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "containsString:", CFSTR("HWR"));

                if (v39)
                {
LABEL_28:
                  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "_responderForEditing");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v41, "_alwaysRequireInlineCandidateView");

                }
                else
                {
                  v42 = 1;
                }
                -[UIKeyboardImpl inputStringFromPhraseBoundary](self, "inputStringFromPhraseBoundary");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v43, "length");
                if (-[UIKeyboardImpl isMinimized](self, "isMinimized")
                  && !-[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible")
                  || (-[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList"),
                      (v45 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
                  && -[UIKeyboardImpl showsCandidateInline](self, "showsCandidateInline")
                  || (v45, v42))
                {
                  v46 = !-[UIKeyboardImpl keyboardIsInPencilTextInputMode](self, "keyboardIsInPencilTextInputMode");
                }
                else
                {
                  v46 = 0;
                }
                if ((v35 | v46) == 1)
                {
                  v47 = self->_keyboardStateManager;
                  -[UIKeyboardImpl candidateController](self, "candidateController");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_UIKeyboardStateManager _setCandidateList:](v47, "_setCandidateList:", v48);

                  v49 = 4;
                  if (!v46)
                    v49 = 0;
                  if (v35)
                    v50 = v49 | 2;
                  else
                    v50 = v49;
                  -[UIKeyboardImpl candidateController](self, "candidateController");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "setActiveCandidateViewType:", v50);

                  if (v35)
                  {
                    v164 = v15;
                    v52 = v13;
                    v53 = v11;
                    -[UIKeyboardImpl candidateController](self, "candidateController");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "loadCandidateBar");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    v56 = objc_msgSend(v55, "isHidden");

                    if (v56)
                    {
                      -[UIKeyboardImpl candidateController](self, "candidateController");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v57, "candidateBar");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v58, "setHidden:", 0);

                    }
                    v59 = v9;
                    if (!-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
                      -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 1);
                    -[UIKeyboardImpl candidateController](self, "candidateController");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "loadCandidateBar");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v61, "frame");
                    v63 = v62;
                    v65 = v64;
                    v67 = v66;
                    v69 = v68;
                    -[UIKeyboardImpl candidateController](self, "candidateController");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "candidateBarHeightForOrientation:", -[UIKeyboardLayout orientation](self->m_layout, "orientation"));
                    v72 = v71;

                    if (v69 != v72)
                    {
                      -[UIKeyboardImpl candidateController](self, "candidateController");
                      v73 = (void *)objc_claimAutoreleasedReturnValue();
                      v74 = objc_msgSend(v73, "isExtendedList");

                      if ((v74 & 1) == 0)
                        objc_msgSend(v61, "setFrame:", v63, v65, v67, v72);
                    }

                    v9 = v59;
                    v11 = v53;
                    v13 = v52;
                    v15 = v164;
                  }
                  else
                  {
                    -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 0);
                  }
                  if (v46)
                  {
                    -[UIKeyboardImpl candidateController](self, "candidateController");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "loadInlineCandidateView");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v79 = 0;
                  }
                  -[UIKeyboardImpl candidateController](self, "candidateController");
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "updateStates");

                  if (v79)
                  {
                    v165 = v44;
                    -[UIKeyboardImpl inputOverlayContainerForCandidateView:](self, "inputOverlayContainerForCandidateView:", 1);
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIKeyboardImpl candidateController](self, "candidateController");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "maximumSizeForInlineView");
                    v84 = v83;
                    v86 = v85;

                    if (!self->m_scrolling)
                    {
                      -[UIViewController popoverPresentationController](self->_emojiPopoverController, "popoverPresentationController");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "containerView");
                      v88 = objc_claimAutoreleasedReturnValue();
                      if (v81 == (void *)v88)
                      {
                        v92 = (uint64_t)v81;
                      }
                      else
                      {
                        v89 = (void *)v88;
                        objc_msgSend(v81, "bounds");
                        if (v90 >= v84 && (objc_msgSend(v81, "bounds"), v91 >= v86 + v86))
                        {
                          objc_opt_class();
                          isKindOfClass = objc_opt_isKindOfClass();

                          if ((isKindOfClass & 1) == 0)
                            goto LABEL_70;
                        }
                        else
                        {

                        }
                        +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v87, "transformedContainerView");
                        v92 = objc_claimAutoreleasedReturnValue();
                      }

                      v81 = (void *)v92;
                    }
LABEL_70:
                    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v79, "isFloating") & 1) == 0)
                    {
                      objc_msgSend(v79, "superview");
                      v93 = objc_claimAutoreleasedReturnValue();
                      if (v81 == (void *)v93)
                      {

                      }
                      else
                      {
                        v94 = (void *)v93;
                        objc_msgSend(v79, "superview");
                        v95 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v95)
                        {
                          objc_msgSend(v79, "frame");
                          v97 = v96;
                          v99 = v98;
                          v101 = v100;
                          v103 = v102;
                          objc_msgSend(v79, "superview");
                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v81, "convertPoint:fromView:", v104, v97, v99);
                          v106 = v105;
                          v108 = v107;

                          objc_msgSend(v79, "setFrame:", v106, v108, v101, v103);
                          objc_msgSend(v81, "addSubview:", v79);
                          v109 = v81;
                          goto LABEL_78;
                        }
                      }
                    }
                    objc_msgSend(v79, "superview");
                    v110 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v110)
                    {
                      v44 = v165;
                      goto LABEL_80;
                    }
                    objc_msgSend(v79, "superview");
                    v109 = (id)objc_claimAutoreleasedReturnValue();
LABEL_78:
                    v111 = v109;
                    v44 = v165;

                    v34 = v111;
LABEL_80:

                  }
                }
                else
                {
                  -[UIKeyboardImpl dynamicCaretList](self, "dynamicCaretList");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v75)
                  {
                    v76 = self->_keyboardStateManager;
                    -[UIKeyboardImpl dynamicCaretList](self, "dynamicCaretList");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UIKeyboardStateManager _setCandidateList:](v76, "_setCandidateList:", v77);

                  }
                  else if (-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
                  {
                    -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 0);
                  }
                }
                -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
                v112 = (void *)objc_claimAutoreleasedReturnValue();

                if (v112)
                {
                  -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v113, "candidates");
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  v115 = objc_msgSend(v114, "count");

                  if (!v115)
                    goto LABEL_97;
                  -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  v117 = objc_msgSend(v116, "hasCandidates");

                  if ((v117 & 1) != 0)
                  {
                    if (v44
                      || -[UIKeyboardImpl suppliesCompletions](self, "suppliesCompletions")
                      || -[UIKeyboardImpl usesAutocorrectionLists](self, "usesAutocorrectionLists")
                      || -[_UIKeyboardStateManager predictionType](self->_keyboardStateManager, "predictionType") == 2
                      || -[_UIKeyboardStateManager predictionType](self->_keyboardStateManager, "predictionType") == 4)
                    {
                      if (!v46
                        || (v169.origin.x = v9,
                            v169.origin.y = v11,
                            v169.size.width = v13,
                            v169.size.height = v15,
                            !CGRectIsNull(v169))
                        && v34
                        && -[UIKeyboardImpl delegateSupportsCorrectionUI](self, "delegateSupportsCorrectionUI"))
                      {
                        if (-[UIKeyboardImpl geometryIsChanging](self, "geometryIsChanging"))
                        {
                          -[UIKeyboardImpl keyboardState](self, "keyboardState");
                          v118 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v118, "currentCandidate");
                          v119 = (id)objc_claimAutoreleasedReturnValue();

                        }
                        else
                        {
                          v119 = 0;
                        }
                        -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
                        v122 = (void *)objc_claimAutoreleasedReturnValue();
                        -[UIKeyboardImpl keyboardStateManager](self, "keyboardStateManager");
                        v123 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v122, "setUIKeyboardCandidateListDelegate:", v123);

                        -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v124, "textInputView");
                        v125 = (void *)objc_claimAutoreleasedReturnValue();

                        -[UIKeyboardImpl convertRectToAutocorrectRect:delegateView:container:](self, "convertRectToAutocorrectRect:delegateView:container:", v125, v34, v9, v11, v13, v15);
                        v127 = v126;
                        v129 = v128;
                        v131 = v130;
                        v133 = v132;
                        -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
                        v134 = (void *)objc_claimAutoreleasedReturnValue();
                        v135 = objc_opt_respondsToSelector();

                        if ((v135 & 1) != 0)
                        {
                          v136 = -[UIKeyboardImpl promptTypeForInputString:](self, "promptTypeForInputString:", v43);
                          objc_msgSend(v34, "bounds");
                          v139 = v137 + v138;
                          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
                          v140 = (void *)objc_claimAutoreleasedReturnValue();
                          v141 = objc_msgSend(v140, "isInHardwareKeyboardMode");

                          if (v141)
                          {
                            if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
                              && !-[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented"))
                            {
                              +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
                              v166 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v166, "transformedContainerView");
                              v142 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v142, "window");
                              v143 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v143, "actualSceneBounds");
                              v144 = CGRectGetMaxX(v170) + -15.0;

                              if (v139 >= v144)
                                v139 = v144;
                            }
                          }
                          -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
                          v145 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v145, "setCandidates:type:inlineText:inlineRect:maxX:layout:", v146, v136, v43, 1, v127, v129, v131, v133, v139);
                        }
                        else
                        {
                          -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
                          v145 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
                          v146 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v34, "bounds");
                          objc_msgSend(v145, "setCandidates:inlineText:inlineRect:maxX:layout:", v146, v43, 1, v127, v129, v131, v133, v147 + v148);
                        }

                        if (-[UIKeyboardImpl shouldShowLongPredictionList](self, "shouldShowLongPredictionList"))
                        {
                          v167 = v125;
                          -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
                          v149 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v149, "candidates");
                          v150 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v150, "firstObject");
                          v151 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0C99E38], "null");
                          v152 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v151 != v152)
                          {
                            -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
                            v153 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v153, "candidates");
                            v154 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v154, "firstObject");
                            v155 = objc_claimAutoreleasedReturnValue();

                            v119 = (id)v155;
                          }
                          v125 = v167;
                        }
                        if (!v119
                          || (-[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList"),
                              v156 = (void *)objc_claimAutoreleasedReturnValue(),
                              v157 = objc_msgSend(v156, "showCandidate:", v119),
                              v156,
                              (v157 & 1) == 0))
                        {
                          -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
                          v158 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v158, "currentCandidate");
                          v159 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v159)
                          {
                            v160 = -[UIKeyboardImpl liveConversionEnabled](self, "liveConversionEnabled");
                            -[UIKeyboardImpl candidateController](self, "candidateController");
                            v161 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
                            v162 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v161, "showCandidateAtIndex:animated:scrollPosition:", objc_msgSend(v162, "initialSelectedIndex"), 0, v160);

                          }
                        }
                        -[UIKeyboardImpl setUserSelectedCurrentCandidate:](self, "setUserSelectedCurrentCandidate:", 0);
                        -[UIKeyboardImpl updateKeyboardConfigurations](self, "updateKeyboardConfigurations");

                        goto LABEL_116;
                      }
                    }
                    goto LABEL_97;
                  }
                  -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
                  v120 = (void *)objc_claimAutoreleasedReturnValue();
                  v121 = objc_msgSend(v120, "hasCandidates");

                  if ((v121 & 1) == 0)
LABEL_97:
                    -[UIKeyboardImpl removeCandidateList](self, "removeCandidateList");
                }
                else
                {
                  -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 0);
                }
LABEL_116:

                return;
              }
LABEL_24:
              -[UIKeyboardImpl inputOverlayContainerForCandidateView:](self, "inputOverlayContainerForCandidateView:", 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_25;
            }
            -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 0);
            -[UIKeyboardImpl candidateController](self, "candidateController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setActiveCandidateViewType:", 1);
          }

          goto LABEL_19;
        }
      }
    }
  }
}

- (BOOL)usesContinuousPath
{
  return -[_UIKeyboardStateManager usesContinuousPath](self->_keyboardStateManager, "usesContinuousPath");
}

- (void)setLayoutAllowsContinuousPath:(BOOL)a3
{
  -[_UIKeyboardStateManager setLayoutAllowsContinuousPath:](self->_keyboardStateManager, "setLayoutAllowsContinuousPath:", a3);
}

- (void)setCaretVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCursorVisible:", v3);

}

- (void)setCapslockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_capslockAssertion, a3);
}

- (void)removeASPVisualEffectsIfNecessary:(id)a3
{
  -[_UIKeyboardStateManager removeASPVisualEffectsIfNecessary:](self->_keyboardStateManager, "removeASPVisualEffectsIfNecessary:", a3);
}

- (void)releaseInputManager
{
  -[_UIKeyboardStateManager releaseInputManager](self->_keyboardStateManager, "releaseInputManager");
}

- (_UIStringAndPositionPair)lastMatchedSupplementalCandidate
{
  return -[_UIKeyboardStateManager lastMatchedSupplementalCandidate](self->_keyboardStateManager, "lastMatchedSupplementalCandidate");
}

- (void)dismissPressAndHoldPopover
{
  -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", self->_pressAndHoldPopoverController, 0, 0);
}

- (void)dismissEmojiPopoverIfNecessaryWithCompletion:(id)a3
{
  -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", self->_emojiPopoverController, 0, a3);
}

- (void)dismissAutoFillPopover
{
  void *v3;
  id v4;

  if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone](UIKeyboard, "useAutoFillUIRTIInterfaceForIphone"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localAuthenticationObserver");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "localAuthenticationPresentedOrBeingRecoveredFrom") & 1) == 0)
    {
      if (getAFUIPanelClass())
        -[AFUIPanel_Staging hide](self->_autoFillPanel, "hide");
    }

  }
}

- (void)clearShiftState
{
  -[_UIKeyboardStateManager clearShiftState](self->_keyboardStateManager, "clearShiftState");
}

- (void)clearCursorAccessory
{
  void *v3;
  void *v4;
  UITextCursorAssertion *m_dictationIndicatorAssertion;

  -[UIKeyboardImpl capslockAssertion](self, "capslockAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIKeyboardImpl setCapslockAssertion:](self, "setCapslockAssertion:", 0);
  -[UIKeyboardImpl inputModeAssertion](self, "inputModeAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[UIKeyboardImpl setInputModeAssertion:](self, "setInputModeAssertion:", 0);
  -[UITextCursorAssertion invalidate](self->m_dictationIndicatorAssertion, "invalidate");
  m_dictationIndicatorAssertion = self->m_dictationIndicatorAssertion;
  self->m_dictationIndicatorAssertion = 0;

}

- (UITextCursorAssertion)capslockAssertion
{
  return self->_capslockAssertion;
}

+ (void)releaseSharedInstance
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD783D8)
  {
    if (os_variant_has_internal_diagnostics())
    {
      _UIKeyboardExtendedLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(qword_1ECD783D8 + 720);
        v5 = 134217984;
        v6 = v4;
        _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "releasing shared Impl (id=%ld)", (uint8_t *)&v5, 0xCu);
      }

    }
    objc_msgSend((id)qword_1ECD783D8, "releaseInputManager");
    objc_msgSend((id)qword_1ECD783D8, "clearDelegate");
    objc_msgSend((id)qword_1ECD783D8, "clearAnimations");
    objc_msgSend((id)qword_1ECD783D8, "clearTimers");
    objc_msgSend((id)qword_1ECD783D8, "clearLayouts");
    objc_msgSend((id)qword_1ECD783D8, "removeFromSuperview");
    objc_msgSend((id)qword_1ECD783D8, "detach");
    v2 = (void *)qword_1ECD783D8;
    qword_1ECD783D8 = 0;

  }
  loadsAddressBook = 1;
}

+ (void)purgeImageCache
{
  id v2;

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purge");

}

+ (void)applicationWillResignActive:(id)a3
{
  _BOOL8 v3;
  void *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = +[UIKeyboard isSpotlight](UIKeyboard, "isSpotlight", a3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissEmojiPopoverBeforeCleanup:", v3);

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_effectiveUISettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deactivationReasons");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissAutoFillPopover");

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commitTransaction");

  +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearNonPersistentCache");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearTransientState");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_layout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCursorLocation:", 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deactivateLayout");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_layout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resetTouchProcessingForKeyboardChange");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cancelAllKeyEvents");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dismissEditingIntroductionView");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dismissMultilingualKeyboardTip");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dismissMultilingualSettingTip");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPreviousGlobeKeyEvent:", 0);

  +[_UIKBFeedbackGeneratorPartner cooldownSystemSoundsForObject:](_UIKBFeedbackGeneratorPartner, "cooldownSystemSoundsForObject:", qword_1ECD783D8);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "inputModeIndicatorController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "willResignActive");

}

+ (void)applicationDidEnterBackground:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetTouchProcessingForKeyboardChange");

  objc_msgSend(v7, "cancelAllKeyEvents");
  objc_msgSend((id)qword_1ECD783D8, "_updateSoundPreheatingForWindow:", 0);
  objc_msgSend(v7, "dismissEditingIntroductionView");
  objc_msgSend(v7, "dismissMultilingualKeyboardTip");
  objc_msgSend(v7, "dismissMultilingualSettingTip");
  objc_msgSend(v7, "dismissStickerEditor:", 0);
  objc_msgSend(v7, "keyboardStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostApplicationDidEnterBackground");

  v5 = (void *)UIKeyboardSupportsTouch;
  UIKeyboardSupportsTouch = 0;

  v6 = (void *)UIKeyboardCachedIsRightHandDrive;
  UIKeyboardCachedIsRightHandDrive = 0;

}

+ (void)applicationDidReceiveMemoryWarning:(id)a3
{
  id v3;

  v3 = a3;
  +[UICompatibilityInputViewController applicationDidReceiveMemoryWarning:](UICompatibilityInputViewController, "applicationDidReceiveMemoryWarning:", v3);

}

+ (void)switchControlStatusDidChange:(id)a3
{
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadCurrentInputMode");

}

- (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "defaultSizeForInterfaceOrientation:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)normalizedInputModesFromPreference
{
  void *v2;
  void *v3;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedEnabledInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (double)additionalInstanceHeightForInterfaceOrientation:(int64_t)a3
{
  double result;

  objc_msgSend(a1, "additionalInstanceHeightForInterfaceOrientation:hasInputView:", a3, 0);
  return result;
}

+ (BOOL)canShowInternationalKey
{
  return 1;
}

- (BOOL)isHardwareKeyboardAttachedNow
{
  void *v2;
  char v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHardwareKeyboardAvailable");

  return v3;
}

- (BOOL)hardwareKeyboardIsSeen
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "oneTimeActionCompleted:", *MEMORY[0x1E0DBDF98]);

  return v4;
}

- (void)setHardwareKeyboardIsSeen
{
  -[UIKeyboardImpl setHardwareKeyboardIsSeen:](self, "setHardwareKeyboardIsSeen:", 1);
}

- (void)setHardwareKeyboardIsSeen:(BOOL)a3
{
  void *v3;
  id v4;

  if (a3 && !-[UIKeyboardImpl hardwareKeyboardIsSeen](self, "hardwareKeyboardIsSeen"))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferencesActions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "didTriggerOneTimeAction:", *MEMORY[0x1E0DBDF98]);

  }
}

- (void)setCapsLockIfNeeded
{
  -[UIKeyboardImpl _setCapsLockIfNeeded:event:](self, "_setCapsLockIfNeeded:event:", objc_msgSend((id)UIApp, "_hardwareKeyboard:", 0), 0);
}

- (void)setCapsLockIfNeededForPhysicalKeyboardEvent:(id)a3
{
  -[UIKeyboardImpl _setCapsLockIfNeeded:event:](self, "_setCapsLockIfNeeded:event:", objc_msgSend((id)UIApp, "_hardwareKeyboardForPhysicalKeyboardEvent:createIfNeeded:", a3, 0), 0);
}

- (void)_setCapsLockIfNeeded:(__GSKeyboard *)a3 event:(__IOHIDEvent *)a4
{
  unsigned int v6;
  _BOOL4 v7;
  void *v8;
  int IsCapsLockLightOn;
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = GSKeyboardGetModifierState() & 0x40000;
  v7 = v6 == 0;
  if (a4)
  {
    BKSHIDEventGetKeyboardAttributes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsCapsLockLightOn = (objc_msgSend(v8, "GSModifierState") >> 18) & 1;

  }
  else
  {
    IsCapsLockLightOn = BKSHIDKeyboardIsCapsLockLightOn();
  }
  if (v6 >> 18 == IsCapsLockLightOn)
  {
    v7 = v6 != 0;
  }
  else
  {
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
    _UIHardwareKeyboardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[UIKeyboardImpl _setCapsLockIfNeeded:event:]";
      v13 = 1024;
      v14 = (v6 >> 18) ^ 1;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%s, toggle capslock state to %d", buf, 0x12u);
    }

  }
  if (self->m_isCapsLocked != v7)
  {
    self->m_isCapsLocked = v7;
    if (-[UIKeyboardImpl isMinimized](self, "isMinimized"))
      -[UIKeyboardImpl notifyShiftState](self, "notifyShiftState");
    else
      -[UIKeyboardImpl setCapsLockSign](self, "setCapsLockSign");
  }
}

- (BOOL)isCapsLockSignOn
{
  return self->m_isCapsLocked;
}

- (void)_resetCapsLock
{
  if (_lastUsedKeyboardSenderID)
    BKSHIDKeyboardSetCapsLockActive();
  -[UIKeyboardImpl setCapsLockIfNeeded](self, "setCapsLockIfNeeded");
}

- (UIKeyboardImpl)initWithFrame:(CGRect)a3
{
  return -[UIKeyboardImpl initWithFrame:forCustomInputView:](self, "initWithFrame:forCustomInputView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isInitializing
{
  return !self->m_initializationDone;
}

void __51__UIKeyboardImpl_initWithFrame_forCustomInputView___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "refreshRivenPreferences");
  v2 = *(void **)(a1 + 32);
  +[UIKeyboardImpl splitProgress](UIKeyboardImpl, "splitProgress");
  objc_msgSend(v2, "setInSplitKeyboardMode:", v3 > 0.00000011920929);
  if ((objc_msgSend(*(id *)(a1 + 32), "forCustomInputView") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setInputModeFromPreferences");
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 731) = objc_msgSend(v4, "automaticMinimizationEnabled");

}

- (void)scribbleWillBeginWriting:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  if (-[UIKeyboardImpl isEmojiPopoverBeingPresented](self, "isEmojiPopoverBeingPresented")
    || -[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented")
    && !-[UIKeyboardImpl isEmojiPopoverBeingDismissed](self, "isEmojiPopoverBeingDismissed"))
  {
    objc_msgSend(v7, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_emojiPopoverController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

    if ((v6 & 1) == 0)
      -[UIKeyboardImpl dismissEmojiPopoverIfNecessaryWithCompletion:](self, "dismissEmojiPopoverIfNecessaryWithCompletion:", 0);

  }
}

- (void)detach
{
  void *v3;
  void *v4;
  void *v5;
  __CFRunLoopObserver *m_observer;
  NSObject *v7;
  int64_t id;
  _QWORD v9[13];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id = self->_id;
      *(_DWORD *)buf = 134217984;
      v11 = id;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Impl detach (id=%ld)", buf, 0xCu);
    }

  }
  -[_UIKeyboardStateManager presentationDelegateWillDetach](self->_keyboardStateManager, "presentationDelegateWillDetach");
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPerformSelectorsWithTarget:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification");
  v9[1] = CFSTR("UIApplicationSuspendedEventsOnlyNotification");
  v9[2] = CFSTR("UIApplicationResumedEventsOnlyNotification");
  v9[3] = CFSTR("UIApplicationResumedNotification");
  v9[4] = CFSTR("UIKeyboardDidHideNotification");
  v9[5] = CFSTR("UIContentSizeCategoryDidChangeNotification");
  v9[6] = CFSTR("UITextSelectionWillScroll");
  v9[7] = CFSTR("UITextSelectionDidScroll");
  v9[8] = CFSTR("UITextInputUpdateKeyboardSuppressionNotification");
  v9[9] = CFSTR("UITextInputUpdateKeyboardLanguageNotification");
  v9[10] = CFSTR("_UIScribbleWillBeginWriting");
  v9[11] = CFSTR("UIWindowSceneDidBeginLiveResizeNotification");
  v9[12] = CFSTR("UIWindowSceneDidEndLiveResizeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  m_observer = self->m_observer;
  if (m_observer)
  {
    CFRunLoopObserverInvalidate(m_observer);
    CFRelease(self->m_observer);
    self->m_observer = 0;
  }
  if (self->m_isRotating)
    -[UIKeyboardImpl updateLayoutToCurrentInterfaceOrientation](self, "updateLayoutToCurrentInterfaceOrientation");
}

- (void)dealloc
{
  void *v3;
  UIKeyboardEmojiPopoverController *emojiPopoverController;
  void *v5;
  UIDictationPopoverController *dictationPopoverController;
  void *v7;
  UIPressAndHoldPopoverController *pressAndHoldPopoverController;
  NSNumber *isAttachedHardwareKeyboard;
  UIView **p_overlayContainerObserved;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int64_t id;
  objc_super v18;
  uint8_t buf[4];
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id = self->_id;
      *(_DWORD *)buf = 134217984;
      v20 = id;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "Impl dealloc (id=%ld)", buf, 0xCu);
    }

  }
  self->m_inDealloc = 1;
  objc_storeWeak((id *)&self->m_geometryDelegate, 0);
  -[UIKeyboardImpl detach](self, "detach");
  -[UIView removeFromSuperview](self->m_markedTextOverlay, "removeFromSuperview");
  -[UIView removeFromSuperview](self->m_languageIndicator, "removeFromSuperview");
  -[UIKeyboardImpl removeAutocorrectPromptAndCandidateList](self, "removeAutocorrectPromptAndCandidateList");
  -[UIKeyboardImpl removeTextChoicePrompt](self, "removeTextChoicePrompt");
  -[UIKeyboardImpl removeTextChoiceUnderlines](self, "removeTextChoiceUnderlines");
  -[UIKeyboardImpl dismissAutoFillPopover](self, "dismissAutoFillPopover");
  -[UIViewController presentingViewController](self->_emojiPopoverController, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, 0);

  emojiPopoverController = self->_emojiPopoverController;
  self->_emojiPopoverController = 0;

  -[UIViewController presentingViewController](self->_dictationPopoverController, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);

  dictationPopoverController = self->_dictationPopoverController;
  self->_dictationPopoverController = 0;

  -[UIViewController presentingViewController](self->_pressAndHoldPopoverController, "presentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

  pressAndHoldPopoverController = self->_pressAndHoldPopoverController;
  self->_pressAndHoldPopoverController = 0;

  self->_emojiPopoverToRestoreAfterRotation = 0;
  isAttachedHardwareKeyboard = self->_isAttachedHardwareKeyboard;
  self->_isAttachedHardwareKeyboard = 0;

  p_overlayContainerObserved = &self->_overlayContainerObserved;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    objc_msgSend(v13, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), v14);

    objc_storeWeak((id *)p_overlayContainerObserved, 0);
  }
  -[UIKeyboardImpl keyboardFeedbackAssistantViewController](self, "keyboardFeedbackAssistantViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    -[UIKeyboardImpl dismissKeyboardFeedbackAssistantViewController](self, "dismissKeyboardFeedbackAssistantViewController");
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardImpl;
  -[UIView dealloc](&v18, sel_dealloc);
}

- (BOOL)_mimicShiftBeingHeld
{
  return -[_UIKeyboardStateManager _mimicShiftBeingHeld](self->_keyboardStateManager, "_mimicShiftBeingHeld");
}

- (void)set_mimicShiftBeingHeld:(BOOL)a3
{
  -[_UIKeyboardStateManager set_mimicShiftBeingHeld:](self->_keyboardStateManager, "set_mimicShiftBeingHeld:", a3);
}

- (BOOL)hasPreviousKeyResponder
{
  return -[_UIKeyboardStateManager hasPreviousKeyResponder](self->_keyboardStateManager, "hasPreviousKeyResponder");
}

- (void)setHasPreviousKeyResponder:(BOOL)a3
{
  -[_UIKeyboardStateManager setHasPreviousKeyResponder:](self->_keyboardStateManager, "setHasPreviousKeyResponder:", a3);
}

- (BOOL)hasNextKeyResponder
{
  return -[_UIKeyboardStateManager hasNextKeyResponder](self->_keyboardStateManager, "hasNextKeyResponder");
}

- (void)setHasNextKeyResponder:(BOOL)a3
{
  -[_UIKeyboardStateManager setHasNextKeyResponder:](self->_keyboardStateManager, "setHasNextKeyResponder:", a3);
}

- (id)textContentTypeForCurrentInputDelegate
{
  return -[_UIKeyboardStateManager textContentTypeForCurrentInputDelegate](self->_keyboardStateManager, "textContentTypeForCurrentInputDelegate");
}

- (BOOL)textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact
{
  return -[_UIKeyboardStateManager textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact](self->_keyboardStateManager, "textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact");
}

- (BOOL)textInputTraitsNeedContactAutoFill
{
  return -[_UIKeyboardStateManager textInputTraitsNeedContactAutoFill](self->_keyboardStateManager, "textInputTraitsNeedContactAutoFill");
}

- (void)clearAutofillGroup
{
  -[_UIKeyboardStateManager clearAutofillGroup](self->_keyboardStateManager, "clearAutofillGroup");
}

- (void)handleAutofillCredentialSaveIfNeeded:(id)a3
{
  -[_UIKeyboardStateManager handleAutofillCredentialSaveIfNeeded:](self->_keyboardStateManager, "handleAutofillCredentialSaveIfNeeded:", a3);
}

- (void)provideAutoFillTypingUpdatesIfNecessary
{
  -[_UIKeyboardStateManager provideAutoFillTypingUpdatesIfNecessary](self->_keyboardStateManager, "provideAutoFillTypingUpdatesIfNecessary");
}

- (TIKeyboardLayout)layoutForKeyHitTest
{
  return -[_UIKeyboardStateManager layoutForKeyHitTest](self->_keyboardStateManager, "layoutForKeyHitTest");
}

- (id)keyedLayouts
{
  return self->m_keyedLayouts;
}

- (void)removeFromSuperview
{
  void *v3;
  objc_super v4;

  -[_UIKeyboardStateManager presentationDelegateWillRemoveFromSuperview](self->_keyboardStateManager, "presentationDelegateWillRemoveFromSuperview");
  -[UIKeyboardImpl clearTimers](self, "clearTimers");
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardImpl deactivateLayout](self, "deactivateLayout");
    -[UIKeyboardLayout resetTouchProcessingForKeyboardChange](self->m_layout, "resetTouchProcessingForKeyboardChange");
  }
  -[UIKeyboardImpl hideInternationalKeyIntroductionIfNeeded](self, "hideInternationalKeyIntroductionIfNeeded");
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardImpl;
  -[UIView removeFromSuperview](&v4, sel_removeFromSuperview);
}

- (void)applicationSuspendedEventsOnly:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  -[UIKeyboardImpl setCaretBlinks:](self, "setCaretBlinks:", 0);
  if (qword_1ECD78408 != -1)
    dispatch_once(&qword_1ECD78408, &__block_literal_global_350);
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_effectiveUISettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deactivationReasons");

  v8 = -262184;
  if (!_MergedGlobals_74)
    v8 = -1;
  if ((v8 & v7) != 0)
  {
    if (-[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection"))
      -[UIKeyboardImpl acceptAutocorrectionWithCompletionHandler:](self, "acceptAutocorrectionWithCompletionHandler:", 0);
    -[UIKeyboardImpl clearChangeTimeAndCount](self, "clearChangeTimeAndCount");
  }
}

void __49__UIKeyboardImpl_applicationSuspendedEventsOnly___block_invoke()
{
  _MergedGlobals_74 = 1;
}

- (void)applicationResumedEventsOnly:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIKeyboardImpl applicationResumed:](self, "applicationResumed:", a3);
  if (-[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached"))
  {
    v4 = (void *)UIApp;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hardwareInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "automaticHardwareLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHardwareKeyboardLayoutName:", v7);

    -[UIKeyboardImpl setCapsLockIfNeeded](self, "setCapsLockIfNeeded");
  }
}

- (void)textWillScroll
{
  -[UIKeyboardImpl _selectionScrolling:scroller:](self, "_selectionScrolling:scroller:", 1, 0);
}

- (void)textDidScroll
{
  -[UIKeyboardImpl _selectionScrolling:scroller:](self, "_selectionScrolling:scroller:", 0, 0);
}

- (void)updateDefaultsWithResults:(id)a3
{
  -[_UIKeyboardStateManager updateDefaultsWithResults:](self->_keyboardStateManager, "updateDefaultsWithResults:", a3);
}

- (void)didCompleteUpdateDefaults
{
  void *v2;
  void *v4;
  char v5;
  void *v6;
  BOOL v7;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOnScreen");
  if ((v5 & 1) == 0)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isUndocked") & 1) == 0)
      goto LABEL_9;
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "keyboardActive"))
  {

    if ((v5 & 1) != 0)
      goto LABEL_10;
LABEL_9:

    goto LABEL_10;
  }
  v7 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");

  if ((v5 & 1) == 0)
  if (!v7)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveToPersistentOffset");
LABEL_10:

  }
  objc_msgSend((id)objc_opt_class(), "suppressSetPersistentOffset:", 0);
  -[UIKeyboardImpl updateInputAssistantButtonItems](self, "updateInputAssistantButtonItems");
}

- (void)defaultsDidChange
{
  -[_UIKeyboardStateManager updateDefaultsWithResults:](self->_keyboardStateManager, "updateDefaultsWithResults:", 0);
}

- (CGRect)dragGestureRectInView:(id)a3
{
  UIKeyboardLayout *m_layout;
  id v5;
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
  double v20;
  double v21;
  CGRect result;

  m_layout = self->m_layout;
  v5 = a3;
  if (m_layout)
  {
    -[UIKeyboardLayout dragGestureRectInView:](m_layout, "dragGestureRectInView:", v5);
  }
  else
  {
    -[UIView bounds](self, "bounds");
    -[UIView convertRect:toView:](self, "convertRect:toView:", v5, v10 + v11 + -80.0, v12 + v13 + -80.0, 80.0, 80.0);
  }
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v17 = v9;

  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)rivenPreference
{
  return byte_1ECD783C4;
}

+ (BOOL)rivenShouldUndock
{
  return byte_1ECD783C0;
}

- (BOOL)rivenSplitLock
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBEA68]);

  return v4;
}

- (void)setRivenSplitLock:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateKeyboardIsSplit:locked:", objc_msgSend(v6, "splitKeyboardMode"), v3);

}

- (unint64_t)minimumTouchesForTranslation
{
  return 1;
}

+ (BOOL)supportsFloating
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t SafeDeviceIdiom;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeyboardOnEmbeddedScreen");

  v4 = qword_1ECD78430++;
  if (v4 < 1)
  {
    SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    --qword_1ECD78430;
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v9 = v3;
    else
      v9 = 0;
    if (v9 != 1)
      return 0;
  }
  else
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    --qword_1ECD78430;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v7 = v3;
    else
      v7 = 0;
    if ((v7 & 1) == 0)
      return 0;
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferencesActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE2A8]);

  if (!v12)
    return 0;
  objc_msgSend((id)qword_1ECD783D8, "textInputTraits");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "acceptsSplitKeyboard");
  else
    v15 = 1;
  if (objc_msgSend(v14, "keyboardAppearance") == 127
    || objc_msgSend(v14, "keyboardType") == 12
    || objc_msgSend(v14, "keyboardType") == 125)
  {
    v15 = 0;
  }

  return v15;
}

+ (UIEdgeInsets)requestedFloatingInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *(double *)&qword_1ECD78410;
  v3 = *(double *)algn_1ECD78418;
  v4 = *(double *)&qword_1ECD78420;
  v5 = unk_1ECD78428;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (void)setFloating:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = a3;
  if (objc_msgSend(a1, "supportsFloating"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "keyboardActive");

    if (v6)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferencesActions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateKeyboardIsFloating:", v3);

      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferencesActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "synchronizePreferences");

    }
    v11 = byte_1ECD783D0;
    byte_1ECD783D0 = v3;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferencesActions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "synchronizePreferences");

    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "remoteTextInputPartner");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "forwardKeyboardOperation:object:", a2, v16);

    }
    if (v11 != v3)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "acceptHandwritingCandidate");

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isUsingDictationLayout");

      if ((v19 & 1) == 0)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", 1, 1);

      }
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateDictationIgnoreKeyboardDidHideNotification");

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "notifyInputSourceStateChangeIfNeeded");

    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "systemInputAssistantViewController");
    v30 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "prepareForFloating:", v3);
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "updateLayout");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "keyboardStateManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "refreshAutofillModeIfNecessary");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "syncInputManagerToKeyboardState");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "keyboardStateManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "refreshSecureCandidatesIfNecessary");

  }
}

+ (void)setFloating:(BOOL)a3 positionedAtDefaultOffsetAnimated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  double v7;
  double v8;

  v4 = a4;
  v5 = a3;
  if (a3)
  {
    +[UIKeyboardImpl floatingPersistentOffset](UIKeyboardImpl, "floatingPersistentOffset");
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  objc_msgSend(a1, "setFloating:positionedAtOffset:animated:", v5, v4, v7, v8);
}

+ (void)setFloating:(BOOL)a3 positionedAtOffset:(CGPoint)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  id v8;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  +[UIKeyboardImpl setFloating:](UIKeyboardImpl, "setFloating:", a3);
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUndockedWithOffset:animated:", v5, x, y);

}

+ (int64_t)floatingIdiom
{
  return 0;
}

+ (double)floatingWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (objc_msgSend(a1, "floatingIdiom") != 1)
    return 320.0;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pointsPerInch");

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v3);
  v5 = v4;

  return v5;
}

+ (double)floatingHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (objc_msgSend(a1, "floatingIdiom") != 1)
    return -1.0;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pointsPerInch");

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToScreenScale(v3);
  v5 = v4;

  return v5;
}

+ (double)floatingScreenWidthToEmulate
{
  void *v2;
  double v3;
  double v4;

  if (objc_msgSend(a1, "floatingIdiom") != 1)
    return 320.0;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;

  return v4;
}

+ (double)keyboardWidthForScreen:(id)a3 withOrientation:(int64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;

  v6 = a3;
  if (objc_msgSend(a1, "isFloating"))
  {
    objc_msgSend(a1, "floatingWidth");
    v8 = v7;
  }
  else
  {
    objc_msgSend(v6, "_boundsForInterfaceOrientation:", a4);
    v8 = v9;
  }

  return v8;
}

- (void)beginFloatingTransitionFromPanGestureRecognizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIKeyboardImpl *v9;

  v4 = a3;
  -[UIKeyboardImpl window](self, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = self;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputView");
    v9 = (UIKeyboardImpl *)objc_claimAutoreleasedReturnValue();

  }
  -[UIView _rootInputWindowController](v9, "_rootInputWindowController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginFloatingTransitionFromPanGestureRecognizer:", v4);

}

- (BOOL)shouldAllowTwoFingerSelectionGestureOnView:(id)a3
{
  UIKeyboardImpl *v4;
  UIKeyboardImpl *v5;
  _BOOL4 v6;

  v4 = (UIKeyboardImpl *)a3;
  v5 = v4;
  if (v4
    && (v4 == self
     || -[UIView isDescendantOfView:](v4, "isDescendantOfView:", self)
     || -[UIView isDescendantOfView:](self, "isDescendantOfView:", v5)))
  {
    v6 = !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)setSplitProgress:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout setSplitProgress:](self->m_layout, "setSplitProgress:", a3);
}

+ (void)setPersistentSplitProgress:(double)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  byte_1ECD783B0 = a3 > 0.5;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "keyboardActive");

  if (v5)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferencesActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateKeyboardIsSplit:locked:", a3 > 0.00000011920929, 0);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInSplitKeyboardMode:", a3 > 0.00000011920929);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "syncInputManagerToKeyboardState");

}

+ (void)suppressSetPersistentOffset:(BOOL)a3
{
  byte_1ECD783CA = a3;
}

+ (CGPoint)_normalizedScreenPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;
  v9 = v8;

  v10 = +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
  if ((unint64_t)(v10 - 3) >= 2)
    v11 = v9;
  else
    v11 = v7;
  if ((unint64_t)(v10 - 3) >= 2)
    v12 = v7;
  else
    v12 = v9;
  v13 = x / v12;
  v14 = y / v11;
  result.y = v14;
  result.x = v13;
  return result;
}

+ (CGPoint)_screenPointFromNormalizedPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;
  v9 = v8;

  v10 = +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
  if ((unint64_t)(v10 - 3) >= 2)
    v11 = v9;
  else
    v11 = v7;
  if ((unint64_t)(v10 - 3) >= 2)
    v12 = v7;
  else
    v12 = v9;
  v13 = x * v12;
  v14 = y * v11;
  result.y = v14;
  result.x = v13;
  return result;
}

+ (void)setPersistentOffset:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  void *v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (!byte_1ECD783CA)
  {
    y = a3.y;
    x = a3.x;
    objc_msgSend(a1, "normalizedPersistentOffset");
    if (v7 != x || v6 != y)
    {
      +[UIKeyboardImpl persistentSplitProgress](UIKeyboardImpl, "persistentSplitProgress");
      if (fabs(y) < 6.0 && v9 == 0.0)
        y = 0.0;
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "keyboardActive");

      if (v12)
      {
        if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
        {
          +[UIKeyboardImpl setFloatingPersistentOffset:](UIKeyboardImpl, "setFloatingPersistentOffset:", x, y);
        }
        else if (byte_1ECD783C0)
        {
          objc_msgSend(a1, "_normalizedScreenPoint:", x, y);
          v14 = v13;
          v16 = v15;
          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "preferencesActions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setKeyboardPosition:", v16, v14);

          +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "preferencesActions");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "synchronizePreferences");

        }
      }
      if (y == 0.0 && (objc_msgSend(a1, "isSplit") & 1) == 0)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setRivenSplitLock:", 0);

      }
    }
  }
}

+ (CGPoint)normalizedPersistentOffsetIgnoringState
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardPosition");
  v5 = v4;
  v7 = v6;

  if (v5 <= -0.001)
    v8 = v5;
  else
    v8 = 0.0;
  v9 = v7;
  result.y = v8;
  result.x = v9;
  return result;
}

+ (CGPoint)defaultUndockedOffsetForFloating:(BOOL)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  if (a3)
    v3 = 30.0;
  v4 = -70.0;
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGPoint)floatingNormalizedPersistentOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  CGPoint result;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingKeyboardPosition");
  v6 = v5;
  v8 = v7;

  if (v6 == *MEMORY[0x1E0C9D538] && v8 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    objc_msgSend(a1, "defaultUndockedOffsetForFloating:", 1);
    objc_msgSend(a1, "_normalizedScreenPoint:");
  }
  else
  {
    v10 = v6;
    v11 = v8;
  }
  result.y = v11;
  result.x = v10;
  return result;
}

+ (CGPoint)floatingPersistentOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatingKeyboardPosition");
  v6 = v5;
  v8 = v7;

  objc_msgSend(a1, "_screenPointFromNormalizedPoint:", v6, v8);
  result.y = v10;
  result.x = v9;
  return result;
}

+ (void)setFloatingPersistentOffset:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  y = a3.y;
  x = a3.x;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "keyboardActive");

  if (v7)
  {
    objc_msgSend(a1, "_normalizedScreenPoint:", x, y);
    v9 = v8;
    v11 = v10;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferencesActions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatingKeyboardPosition");
    v15 = v14;
    v17 = v16;

    if (v15 != v9 || v17 != v11)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "preferencesActions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setFloatingKeyboardPosition:", v9, v11);

      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferencesActions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "synchronizePreferences");

    }
  }
}

- (BOOL)hideAccessoryViewsDuringSplit
{
  void *v3;
  void *v4;
  char v5;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsSplit");

  if ((v5 & 1) != 0)
    return 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIKeyboardLayout pinchSplitGestureEnabled](self->m_layout, "pinchSplitGestureEnabled") ^ 1;
  return 0;
}

- (void)cancelSplitTransition
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout showSplitTransitionView:](self->m_layout, "showSplitTransitionView:", 0);
}

- (BOOL)keyboardIsInPencilTextInputMode
{
  void *v3;
  BOOL v4;

  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_suppressSoftwareKeyboard"))
    v4 = -[UIKeyboardImpl _textInputSourceForDelegate:](self, "_textInputSourceForDelegate:", v3) == 3;
  else
    v4 = 0;

  return v4;
}

- (int64_t)_textInputSourceForDelegate:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "_textInputSource");
  else
    v4 = 0;

  return v4;
}

- (void)performReturn
{
  -[_UIKeyboardStateManager performReturn](self->_keyboardStateManager, "performReturn");
}

- (void)performDelete
{
  -[_UIKeyboardStateManager performDelete](self->_keyboardStateManager, "performDelete");
}

- (void)performOperations:(id)a3 withTextInputSource:(int64_t)a4
{
  -[_UIKeyboardStateManager performOperations:withTextInputSource:](self->_keyboardStateManager, "performOperations:withTextInputSource:", a3, a4);
}

- (void)_updateTextInputPencilSource
{
  id v2;

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateEventSource:options:", 3, 5);

}

- (void)updateTextInputKeyboardSource
{
  -[_UIKeyboardStateManager updateTextInputKeyboardSource](self->_keyboardStateManager, "updateTextInputKeyboardSource");
}

- (void)updateTextInputKeyboardSource:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("inputSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (int)objc_msgSend(v5, "intValue");
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateEventSource:options:", v6, (int)objc_msgSend(v7, "intValue"));

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteTextInputPartner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "forwardKeyboardOperation:object:", a2, v10);

  }
}

- (id)keyboardViewController
{
  void *v2;
  id *v3;
  void *v4;
  id v5;

  -[UIView superview](self, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIView __viewDelegate](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)smartInsertDeleteIsEnabled
{
  return -[_UIKeyboardStateManager smartInsertDeleteIsEnabled](self->_keyboardStateManager, "smartInsertDeleteIsEnabled");
}

- (BOOL)liveConversionEnabled
{
  return -[_UIKeyboardStateManager liveConversionEnabled](self->_keyboardStateManager, "liveConversionEnabled");
}

- (BOOL)delayedCandidateList
{
  return -[_UIKeyboardStateManager delayedCandidateList](self->_keyboardStateManager, "delayedCandidateList");
}

- (id)smartPunctuationController
{
  return -[_UIKeyboardStateManager smartPunctuationController](self->_keyboardStateManager, "smartPunctuationController");
}

- (BOOL)keyboardsExpandedPreference
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBDDE8]);

  return v4;
}

- (void)setAutomaticMinimizationEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  id v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v3 = a3;
  if (-[UIKeyboardImpl automaticMinimizationEnabled](self, "automaticMinimizationEnabled") != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
    if (!WeakRetained
      || (v6 = WeakRetained,
          v7 = objc_loadWeakRetained((id *)&self->m_geometryDelegate),
          v8 = objc_msgSend(v7, "shouldSaveMinimizationState"),
          v7,
          v6,
          v8))
    {
      self->m_automaticMinimizationEnabled = v3;
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "handlingRemoteEvent");

      if ((v10 & 1) == 0)
      {
        +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "preferencesActions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAutomaticMinimizationEnabled:", v3);

      }
    }
  }
}

- (void)setSuppressUpdateShiftState:(BOOL)a3
{
  -[_UIKeyboardStateManager setSuppressUpdateShiftState:](self->_keyboardStateManager, "setSuppressUpdateShiftState:", a3);
}

- (void)setSuppressUpdateAssistantView:(BOOL)a3
{
  -[_UIKeyboardStateManager setSuppressUpdateAssistantView:](self->_keyboardStateManager, "setSuppressUpdateAssistantView:", a3);
}

- (BOOL)suppressUpdateInputMode
{
  return -[_UIKeyboardStateManager suppressUpdateInputMode](self->_keyboardStateManager, "suppressUpdateInputMode");
}

- (void)setSuppressUpdateInputMode:(BOOL)a3
{
  -[_UIKeyboardStateManager setSuppressUpdateInputMode:](self->_keyboardStateManager, "setSuppressUpdateInputMode:", a3);
}

- (void)setIsCallingTextChangedDuringInputModeSwitch:(BOOL)a3
{
  -[_UIKeyboardStateManager setIsCallingTextChangedDuringInputModeSwitch:](self->_keyboardStateManager, "setIsCallingTextChangedDuringInputModeSwitch:", a3);
}

- (NSString)activeDictationLanguage
{
  return -[_UIKeyboardStateManager activeDictationLanguage](self->_keyboardStateManager, "activeDictationLanguage");
}

- (void)setActiveDictationLanguage:(id)a3
{
  -[_UIKeyboardStateManager setActiveDictationLanguage:](self->_keyboardStateManager, "setActiveDictationLanguage:", a3);
}

- (void)setLastMatchedSupplementalCandidate:(id)a3
{
  -[_UIKeyboardStateManager setLastMatchedSupplementalCandidate:](self->_keyboardStateManager, "setLastMatchedSupplementalCandidate:", a3);
}

- (unint64_t)lastChooseSupplementalItemToInsertCallbackIdentifier
{
  return -[_UIKeyboardStateManager lastChooseSupplementalItemToInsertCallbackIdentifier](self->_keyboardStateManager, "lastChooseSupplementalItemToInsertCallbackIdentifier");
}

- (void)setLastChooseSupplementalItemToInsertCallbackIdentifier:(unint64_t)a3
{
  -[_UIKeyboardStateManager setLastChooseSupplementalItemToInsertCallbackIdentifier:](self->_keyboardStateManager, "setLastChooseSupplementalItemToInsertCallbackIdentifier:", a3);
}

- (id)arrowKeyHistory
{
  return -[_UIKeyboardStateManager arrowKeyHistory](self->_keyboardStateManager, "arrowKeyHistory");
}

- (BOOL)performingRemoteTextOperations
{
  return -[_UIKeyboardStateManager performingRemoteTextOperations](self->_keyboardStateManager, "performingRemoteTextOperations");
}

- (void)setPerformingRemoteTextOperations:(BOOL)a3
{
  -[_UIKeyboardStateManager setPerformingRemoteTextOperations:](self->_keyboardStateManager, "setPerformingRemoteTextOperations:", a3);
}

- (void)saveInputModesPreference:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveInputModes:", v3);

}

- (id)inputModeLastUsedPreference
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputModeInPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)updatingPreferences
{
  return -[_UIKeyboardStateManager updatingPreferences](self->_keyboardStateManager, "updatingPreferences");
}

- (void)setShouldUpdateCacheOnInputModesChange:(BOOL)a3
{
  -[_UIKeyboardStateManager setShouldUpdateCacheOnInputModesChange:](self->_keyboardStateManager, "setShouldUpdateCacheOnInputModesChange:", a3);
}

- (void)setInputMode:(id)a3
{
  -[_UIKeyboardStateManager setInputMode:userInitiated:](self->_keyboardStateManager, "setInputMode:userInitiated:", a3, 0);
}

- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4
{
  -[_UIKeyboardStateManager setInputMode:userInitiated:](self->_keyboardStateManager, "setInputMode:userInitiated:", a3, a4);
}

- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4 updateIndicator:(BOOL)a5 executionContext:(id)a6
{
  -[_UIKeyboardStateManager setInputMode:userInitiated:updateIndicator:executionContext:](self->_keyboardStateManager, "setInputMode:userInitiated:updateIndicator:executionContext:", a3, a4, a5, a6);
}

- (void)setKeyboardInputMode:(id)a3 userInitiated:(BOOL)a4
{
  -[_UIKeyboardStateManager setKeyboardInputMode:userInitiated:](self->_keyboardStateManager, "setKeyboardInputMode:userInitiated:", a3, a4);
}

- (void)reloadCurrentInputMode
{
  -[_UIKeyboardStateManager reloadCurrentInputMode](self->_keyboardStateManager, "reloadCurrentInputMode");
}

- (void)updateForHandBiasChange
{
  id v3;

  if (-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
  {
    -[UIKeyboardImpl candidateController](self, "candidateController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateStates");

  }
}

- (void)reinitializeAfterInputModeSwitch:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;

  v3 = a3;
  if (!-[UIKeyboardImpl isMinimized](self, "isMinimized")
    || -[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached"))
  {
    goto LABEL_6;
  }
  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isSecureTextEntry"))
  {

    goto LABEL_6;
  }
  v6 = -[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible");

  if (v6)
  {
LABEL_6:
    if (byte_1ECD783BA)
      -[UIKeyboardImpl refreshRivenPreferences](self, "refreshRivenPreferences");
    -[UIKeyboardImpl updateLayout](self, "updateLayout");
    -[UIKeyboardImpl callLayoutUpdateLocalizedKeys](self, "callLayoutUpdateLocalizedKeys");
    -[UIKeyboardImpl updateShowCandidateBar](self, "updateShowCandidateBar");
    if (v3)
      goto LABEL_9;
    return;
  }
  self->m_updateLayoutOnShowKeyboard = 1;
  if (v3)
LABEL_9:
    -[UIKeyboardImpl updateInputModeIndicatorOnSingleKeyOnly:](self, "updateInputModeIndicatorOnSingleKeyOnly:", 0);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  UIKeyboardEmojiPopoverController *emojiPopoverController;
  UIKeyboardEmojiPopoverController *v5;
  void *v6;
  int v7;
  void *v9;
  void *v10;
  void *v11;

  emojiPopoverController = self->_emojiPopoverController;
  objc_msgSend(a3, "presentedViewController");
  v5 = (UIKeyboardEmojiPopoverController *)objc_claimAutoreleasedReturnValue();

  if (emojiPopoverController != v5)
    return 1;
  -[UIKeyboardEmojiPopoverController layout](self->_emojiPopoverController, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasActiveKeys");

  if (!v7
    || +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
  {
    return 1;
  }
  v9 = (void *)MEMORY[0x1E0DE7910];
  -[UIKeyboardEmojiPopoverController layout](self->_emojiPopoverController, "layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelPreviousPerformRequestsWithTarget:selector:object:", v10, sel_deactivateActiveKeys, 0);

  -[UIKeyboardEmojiPopoverController layout](self->_emojiPopoverController, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performSelector:withObject:afterDelay:", sel_deactivateActiveKeys, 0, 0.0);

  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  UIDictationPopoverController *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "presentedViewController");
    v7 = (UIDictationPopoverController *)objc_claimAutoreleasedReturnValue();
    if (self->_dictationPopoverController == v7)
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopDictation");

    }
    -[UIKeyboardImpl cleanupKeyboardPopover:](self, "cleanupKeyboardPopover:", v7);

    v6 = v9;
  }

}

- (BOOL)isEmojiPopoverBeingPresented
{
  return -[UIViewController isBeingPresented](self->_emojiPopoverController, "isBeingPresented");
}

- (BOOL)isEmojiPopoverBeingDismissed
{
  return -[UIViewController isBeingDismissed](self->_emojiPopoverController, "isBeingDismissed");
}

- (BOOL)isPressAndHoldPopoverPresented
{
  return -[UIKeyboardPopoverController isPresented](self->_pressAndHoldPopoverController, "isPresented");
}

- (BOOL)isEmojiPopoverVisibleOrDismissing
{
  void *v2;
  BOOL v3;

  -[UIViewController presentingViewController](self->_emojiPopoverController, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canPresentEmojiPopover
{
  void *v3;
  int v4;

  if (-[UIKeyboardImpl isMinimized](self, "isMinimized"))
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && UIKeyboardIsEmojiInputModeActive() && (_UIApplicationIsFirstPartyStickers() & 1) == 0)
      v4 = _UIApplicationIsEmojiPoster() ^ 1;
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)canPresentOrDismissEmojiPopover
{
  _BOOL4 v3;

  v3 = -[UIKeyboardImpl isMinimized](self, "isMinimized");
  if (v3)
  {
    v3 = -[UIKeyboardImpl isCurrentEditResponderInEditingMode](self, "isCurrentEditResponderInEditingMode");
    if (v3)
      LOBYTE(v3) = (UIKeyboardIsEmojiInputModeActive() & 1) != 0
                || -[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented");
  }
  return v3;
}

- (void)presentEmojiPopoverViaTrigger:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  void (**v19)(id, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (-[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented"))
  {
    if (v7)
      v7[2](v7, 1);
  }
  else if (-[UIKeyboardImpl canPresentEmojiPopover](self, "canPresentEmojiPopover"))
  {
    -[UIKeyboardImpl dismissDictationPopoverAndCancelDictation](self, "dismissDictationPopoverAndCancelDictation");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__UIKeyboardImpl_presentEmojiPopoverViaTrigger_completion___block_invoke;
    v18[3] = &unk_1E16B1BF8;
    v19 = v7;
    -[UIKeyboardImpl presentKeyboardPopoverWithType:keyString:completion:](self, "presentKeyboardPopoverWithType:keyString:completion:", 0, 0, v18);
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedTextRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "tokenizer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "positionFromPosition:toBoundary:inDirection:", v11, 0, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v8, "textRangeFromPosition:toPosition:", v13, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "textInRange:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v16, "_containsEmoji");
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
    +[UIKBAnalyticsDispatcher emojiPopoverSummoned:appendsEmoji:](UIKBAnalyticsDispatcher, "emojiPopoverSummoned:appendsEmoji:", v6, v17);

  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

uint64_t __59__UIKeyboardImpl_presentEmojiPopoverViaTrigger_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)handleAutoFillContactPopoverCommand
{
  -[UIKeyboardImpl _handleAutoFillPopoverCommandWithType:action:](self, "_handleAutoFillPopoverCommandWithType:action:", 4, sel_handleAutoFillContactPopoverCommand);
}

- (void)handleAutoFillCreditCardPopoverCommand
{
  -[UIKeyboardImpl _handleAutoFillPopoverCommandWithType:action:](self, "_handleAutoFillPopoverCommandWithType:action:", 5, sel_handleAutoFillCreditCardPopoverCommand);
}

- (void)handleAutoFillPasswordPopoverCommand
{
  -[_UIKeyboardStateManager setEverPresentedPasswordAutofillPanel:](self->_keyboardStateManager, "setEverPresentedPasswordAutofillPanel:", 1);
  -[UIKeyboardImpl _handleAutoFillPopoverCommandWithType:action:](self, "_handleAutoFillPopoverCommandWithType:action:", 6, sel_handleAutoFillPasswordPopoverCommand);
}

- (BOOL)_everPresentedPasswordAutofillPanel
{
  return -[_UIKeyboardStateManager everPresentedPasswordAutofillPanel](self->_keyboardStateManager, "everPresentedPasswordAutofillPanel");
}

- (void)handleAutoFillContactDetected
{
  -[UIKeyboardImpl _handleAutoFillPopoverCommandWithType:action:](self, "_handleAutoFillPopoverCommandWithType:action:", 7, sel_handleAutoFillContactDetected);
}

- (void)handleAutoFillCreditCardDetected
{
  -[UIKeyboardImpl _handleAutoFillPopoverCommandWithType:action:](self, "_handleAutoFillPopoverCommandWithType:action:", 8, sel_handleAutoFillCreditCardDetected);
}

- (void)handleAutoFillPasswordDetected
{
  -[UIKeyboardImpl _handleAutoFillPopoverCommandWithType:action:](self, "_handleAutoFillPopoverCommandWithType:action:", 9, sel_handleAutoFillPasswordDetected);
}

- (void)_handleAutoFillPopoverCommandWithType:(int)a3 action:(SEL)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  AFUIPanel_Staging *v10;
  AFUIPanel_Staging *autoFillPanel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  AFUIPanel_Staging *v16;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v5 = *(_QWORD *)&a3;
  if ((a3 - 3) >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardImpl.m"), 3001, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isAutoFillKeyboardPopoverType(type)"));

  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assertNeedsAutofillUI");

    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "forwardInputDestinationEventToUIHost:", a4);

  }
  else if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone](UIKeyboard, "useAutoFillUIRTIInterfaceForIphone"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localAuthenticationObserver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "localAuthenticationPresentedOrBeingRecoveredFrom") & 1) == 0)
    {
      objc_initWeak(&location, self);
      if (getAFUIPanelClass())
      {
        if (!self->_autoFillPanel)
        {
          v10 = (AFUIPanel_Staging *)objc_alloc_init((Class)getAFUIPanelClass());
          autoFillPanel = self->_autoFillPanel;
          self->_autoFillPanel = v10;

        }
        if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
        {
          -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "documentTraits");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "copy");

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D87180], "currentRTIDocumentTraitsForAutoFillPanel");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[_UIKeyboardStateManager _rtiDocumentStateForAutoFillPopover](self->_keyboardStateManager, "_rtiDocumentStateForAutoFillPopover");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAutofillMode:", -[UIKeyboardImpl _autoFillModeForPopoverType:](self, "_autoFillModeForPopoverType:", v5));
        objc_msgSend(v14, "setExplicitAutoFillMode:", -[UIKeyboardImpl _isAutoFillPopoverTypeExplicit:](self, "_isAutoFillPopoverTypeExplicit:", v5));
        v16 = self->_autoFillPanel;
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __63__UIKeyboardImpl__handleAutoFillPopoverCommandWithType_action___block_invoke;
        v20[3] = &unk_1E16D66A8;
        objc_copyWeak(&v21, &location);
        -[AFUIPanel_Staging displayForDocumentTraits:documentState:textOperationsHandler:](v16, "displayForDocumentTraits:documentState:textOperationsHandler:", v14, v15, v20);
        objc_destroyWeak(&v21);

      }
      objc_destroyWeak(&location);
    }

  }
}

void __63__UIKeyboardImpl__handleAutoFillPopoverCommandWithType_action___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "keyboardStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_performTextOperationsForAutoFill:", v3);

  objc_msgSend(WeakRetained, "dismissAutoFillPopover");
}

- (int64_t)_autoFillModeForPopoverType:(int)a3
{
  if ((a3 - 4) > 5)
    return 0;
  else
    return qword_186681390[a3 - 4];
}

- (BOOL)_isAutoFillPopoverTypeExplicit:(int)a3
{
  return (a3 - 3) < 4;
}

- (void)cleanupKeyboardPopover:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CGSize v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  UIDictationPopoverController *v15;

  v15 = (UIDictationPopoverController *)a3;
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "keyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destroyKeyboardWindowIfNecessary");

  }
  if (self->_dictationPopoverController == v15)
  {
    self->_dictationPopoverController = 0;

    v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->m_editMenuFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->m_editMenuFrame.size = v10;
    if (!-[UIKeyboardImpl isDictationMenuPresented](self, "isDictationMenuPresented"))
    {
      if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
      {
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isDictationPaused");

        if ((v12 & 1) == 0)
        {
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stopDictation");

        }
      }
    }
    +[UIDictationView activeInstance](UIDictationView, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "returnToKeyboard");

    goto LABEL_17;
  }
  if ((UIDictationPopoverController *)self->_pressAndHoldPopoverController == v15)
  {
    self->_pressAndHoldPopoverController = 0;

    goto LABEL_17;
  }
  if ((UIDictationPopoverController *)self->_emojiPopoverController != v15)
  {
LABEL_17:
    -[UIKeyboardImpl _requestInputManagerSync](self, "_requestInputManagerSync");
    goto LABEL_18;
  }
  self->_emojiPopoverController = 0;

  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "keyboardType");

  if (v9 != 124)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIKeyboardLayout reloadCurrentKeyplane](self->m_layout, "reloadCurrentKeyplane");
    -[UIKeyboardImpl dismissDictationPopoverAndCancelDictation](self, "dismissDictationPopoverAndCancelDictation");
    -[UIKeyboardImpl dismissPressAndHoldPopover](self, "dismissPressAndHoldPopover");
    -[UIKeyboardImpl dismissInputModeIndicator](self, "dismissInputModeIndicator");
    goto LABEL_17;
  }
  objc_msgSend(v4, "resignFirstResponder");
LABEL_18:

}

- (void)representDictationMenu
{
  UIDelayedAction *m_dictationMenuAction;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[UIDelayedAction cancel](self->m_dictationMenuAction, "cancel");
  m_dictationMenuAction = self->m_dictationMenuAction;
  self->m_dictationMenuAction = 0;

  -[UIKeyboardImpl touchDictationMenuTimer:](self, "touchDictationMenuTimer:", 0);
  -[UIKeyboardImpl candidateController](self, "candidateController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadInlineCandidateView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((!v7 || objc_msgSend(v7, "isHidden")) && !self->m_autocorrectPrompt)
  {
    -[UIKeyboardImpl inlineTextCompletionController](self, "inlineTextCompletionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasPrompt");

    if ((v6 & 1) == 0)
      -[UIKeyboardImpl _presentDictationMenuIfAllowed](self, "_presentDictationMenuIfAllowed");
  }

}

- (void)_presentDictationMenuIfAllowed
{
  void *v3;
  void *v4;
  id v5;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputSystemSourceSession");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "textOperations");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setEditingActionSelector:", sel__presentDictationMenuIfAllowed);
      objc_msgSend(v5, "flushOperations");

    }
  }
  else if (-[UIKeyboardImpl canPresentDictationMenuWithAnimationStyle:](self, "canPresentDictationMenuWithAnimationStyle:", 2))
  {
    -[UIKeyboardImpl presentDictationMenuWithAnimationStyle:](self, "presentDictationMenuWithAnimationStyle:", 2);
  }
}

- (void)clearDictationMenuTimer
{
  -[UIKeyboardImpl _clearDictationMenuTimer:](self, "_clearDictationMenuTimer:", 1);
}

- (void)_clearDictationMenuTimer:(BOOL)a3
{
  _BOOL4 v3;
  UIDelayedAction *m_dictationMenuAction;
  void *v6;

  v3 = a3;
  -[UIDelayedAction cancel](self->m_dictationMenuAction, "cancel");
  m_dictationMenuAction = self->m_dictationMenuAction;
  self->m_dictationMenuAction = 0;

  if (v3)
  {
    -[UIKeyboardImpl _editMenuAssistant](self, "_editMenuAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hideSelectionCommands");

  }
  if (self->m_presentingKeyboardMenuType != 2)
    -[UIKeyboardImpl dismissDictationMenu](self, "dismissDictationMenu");
}

- (void)touchDictationMenuTimer
{
  -[UIKeyboardImpl touchDictationMenuTimer:](self, "touchDictationMenuTimer:", 1);
}

- (void)touchDictationMenuTimer:(BOOL)a3
{
  _BOOL4 v3;
  UIDelayedAction *m_dictationMenuAction;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  UIDelayedAction *v11;
  UIDelayedAction *v12;

  v3 = a3;
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    if (v3)
      -[UIKeyboardImpl dismissDictationMenu](self, "dismissDictationMenu");
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      m_dictationMenuAction = self->m_dictationMenuAction;
      if (m_dictationMenuAction)
      {
        -[UIDelayedAction touch](m_dictationMenuAction, "touch");
      }
      else
      {
        +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "preferencesActions");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueForPreferenceKey:", CFSTR("DictationMenuReturnPauseInterval"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "floatValue");
        v10 = v9;

        v11 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_representDictationMenu, 0, v10);
        v12 = self->m_dictationMenuAction;
        self->m_dictationMenuAction = v11;

      }
    }
  }
}

- (void)showDictationMenuIfNeeded
{
  if (+[UIDictationController isListening](UIDictationController, "isListening"))
    -[UIKeyboardImpl touchDictationMenuTimer](self, "touchDictationMenuTimer");
}

- (void)hideDictationMenuIfNeeded:(BOOL)a3
{
  if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
  {
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      -[UIKeyboardImpl clearDictationMenuTimer](self, "clearDictationMenuTimer");
    }
    else if (!a3 && self->m_presentingKeyboardMenuType == 2)
    {
      -[UIKeyboardImpl dismissDictationMenu](self, "dismissDictationMenu");
    }
  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  void *v5;
  void *v6;

  -[UIKeyboardImpl keyboardMenuElements](self, "keyboardMenuElements", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stopDictationMenuElementsForTextInputView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[UIKeyboardImpl stopDictationMenuElementsShowingTitle:](self, "stopDictationMenuElementsShowingTitle:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v7;
}

- (id)stopDictationMenuElementsShowingTitle:(BOOL)a3
{
  _BOOL4 v3;
  __CFString *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v3 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  if (!+[UIDictationController isRunning](UIDictationController, "isRunning"))
    return MEMORY[0x1E0C9AA60];
  if (v3)
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Stop"), CFSTR("Stop"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E16EDF20;
  }
  _UIImageWithName(CFSTR("mic_badge_xmark"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v4, v6, 0, &__block_literal_global_217_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("stopDictationMenuElementIdentifier"));
  objc_msgSend(v7, "setAccessibilityLabel:", CFSTR("stopDictationMenuElement"));
  objc_msgSend(v7, "_setPreferredDisplayMode:", 1);
  if (+[UIDictationUtilities shouldAddDeleteMenuElement](UIDictationUtilities, "shouldAddDeleteMenuElement"))
  {
    _UIImageWithName(CFSTR("delete_landscape"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1E16EDF20, v8, 0, &__block_literal_global_225_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("deleteSelectedTextMenuElementIdentifier"));
    objc_msgSend(v9, "setAccessibilityLabel:", CFSTR("deleteSelectedTextMenuElement"));
    v12[0] = v7;
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __56__UIKeyboardImpl_stopDictationMenuElementsShowingTitle___block_invoke()
{
  void *v0;
  id v1;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setReasonType:", 29);

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopDictation");

}

void __56__UIKeyboardImpl_stopDictationMenuElementsShowingTitle___block_invoke_2()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "deleteBackward");

}

- (void)updateDictationIgnoreKeyboardDidHideNotification
{
  id v2;

  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIgnoreKeyboardDidHideNotification:", 1);

  }
}

- (BOOL)isDictationLanguageMenuPresented
{
  return self->m_keyboardMenuType == 2;
}

- (void)willDismissEditMenu
{
  int m_presentingKeyboardMenuType;
  id v4;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "shouldSuppressSoftwareKeyboard")
    && -[UIKeyboardImpl isDictationMenuPresented](self, "isDictationMenuPresented"))
  {
    m_presentingKeyboardMenuType = self->m_presentingKeyboardMenuType;

    if (m_presentingKeyboardMenuType != 2)
      return;
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resignFirstResponderWhenIdleIfNeeded");
  }

}

- (id)keyboardMenuElements
{
  int m_keyboardMenuType;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  id obj;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  void *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  m_keyboardMenuType = self->m_keyboardMenuType;
  if (m_keyboardMenuType != 4)
  {
    if (m_keyboardMenuType == 2)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enabledDictationLanguages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v15;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        v4 = (void *)MEMORY[0x1E0C9AA60];
        v19 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(obj);
            UIKeyboardLocalizedDictationDisplayName(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v19;
            v27[1] = 3221225472;
            v27[2] = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_2;
            v27[3] = &unk_1E16B2C10;
            v27[4] = self;
            +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v21, 0, 0, v27);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v4)
            {
              objc_msgSend(v4, "arrayByAddingObject:", v22);
              v23 = objc_claimAutoreleasedReturnValue();

              v4 = (void *)v23;
            }
            else
            {
              v34 = v22;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
              v4 = (void *)objc_claimAutoreleasedReturnValue();
            }

          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
        }
        while (v17);
      }
      else
      {
        v4 = (void *)MEMORY[0x1E0C9AA60];
      }

      if (objc_msgSend(v4, "count"))
      {
        v24 = self->m_keyboardMenuType;
        goto LABEL_28;
      }
LABEL_27:
      v24 = 0;
      goto LABEL_28;
    }
    if (m_keyboardMenuType == 1)
    {
      if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
      {
        -[UIKeyboardImpl stopDictationMenuElementsShowingTitle:](self, "stopDictationMenuElementsShowingTitle:", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardImpl activeDictationLanguage](self, "activeDictationLanguage");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "length");

        if (v6)
        {
          -[UIKeyboardImpl activeDictationLanguage](self, "activeDictationLanguage");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          UIKeyboardLocalizedDictationDisplayName(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v32[0] = MEMORY[0x1E0C809B0];
          v32[1] = 3221225472;
          v32[2] = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke;
          v32[3] = &unk_1E16B2C10;
          v32[4] = self;
          +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v32);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "arrayByAddingObject:", v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v10;
        }
      }
      else
      {
        v4 = (void *)MEMORY[0x1E0C9AA60];
      }
      if (objc_msgSend(v4, "count"))
      {
        v24 = self->m_keyboardMenuType;
LABEL_28:
        self->m_presentingKeyboardMenuType = v24;
        return v4;
      }
      goto LABEL_27;
    }
    goto LABEL_9;
  }
  if (!+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
LABEL_9:
    v4 = (void *)MEMORY[0x1E0C9AA60];
    return v4;
  }
  _UINSLocalizedStringWithDefaultValue(CFSTR("Undo"), CFSTR("Undo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.uturn.backward"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v11, v12, 0, &__block_literal_global_241_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_setPreferredDisplayMode:", 1);
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  id location;

  v3 = a2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 664) = 2;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__131;
  v21 = __Block_byref_object_dispose__131;
  v22 = 0;
  v5 = objc_loadWeakRetained(&location);
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_231;
  v13 = &unk_1E16D66D0;
  v14 = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v16, &location);
  v15 = &v17;
  objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("UIDictationControllerDictationDidFinish"), 0, v6, &v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v18[5];
  v18[5] = v7;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance", v10, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancelDictation");

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_231(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "presentKeyboardMenu:", 2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enabledDictationLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_3;
  v21[3] = &unk_1E16CCDA8;
  v6 = v3;
  v22 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v21);

  objc_msgSend(*(id *)(a1 + 32), "_editMenuAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hideSelectionCommands");

  objc_msgSend(*(id *)(a1 + 32), "dismissDictationMenu");
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReasonType:", 28);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "enabledDictationLanguages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "switchToDictationLanguage:", v20);

    goto LABEL_10;
  }
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDictation");

  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    objc_msgSend(v6, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enabledDictationLanguages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    v25 = 2112;
    v26 = v16;
    _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Something goes wrong, could not find dictation lauguage (%@) from enabledDictationLanguages: %@", buf, 0x16u);
LABEL_7:

LABEL_8:
    goto LABEL_10;
  }
  v11 = kbLineSeparator_block_invoke___s_category;
  if (!kbLineSeparator_block_invoke___s_category)
  {
    v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v11, (unint64_t *)&kbLineSeparator_block_invoke___s_category);
  }
  v12 = *(NSObject **)(v11 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    objc_msgSend(v6, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enabledDictationLanguages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Something goes wrong, could not find dictation lauguage (%@) from enabledDictationLanguages: %@", buf, 0x16u);
    goto LABEL_7;
  }
LABEL_10:

}

uint64_t __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardLocalizedDictationDisplayName(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_240()
{
  id v0;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_performDictationUndo");

}

- (void)presentDictationMenuTip:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardImpl presentDictationMenuTipWithTitle:description:](self, "presentDictationMenuTipWithTitle:description:", v6, v5);
}

- (void)presentDictationMenuTipWithTitle:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UIView *m_tipView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;

  v6 = a3;
  v7 = a4;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    && !-[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputDelegateManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inputSystemSourceSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "textOperations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_presentDictationMenuTip_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("selector"));

      objc_msgSend(v21, "setObject:forKeyedSubscript:", v6, CFSTR("title"));
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v7, CFSTR("description"));
      objc_msgSend(v20, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v20, "setCustomInfo:", v21);
      objc_msgSend(v19, "flushOperations");

    }
  }
  else
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferencesActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateDictationTipLastShownDate:", v10);

    -[UIKeyboardImpl _editMenuAssistant](self, "_editMenuAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hideSelectionCommands");

    -[UIKeyboardImpl dismissDictationMenu](self, "dismissDictationMenu");
    objc_initWeak(&location, self);
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __63__UIKeyboardImpl_presentDictationMenuTipWithTitle_description___block_invoke;
    v26 = &unk_1E16B58D0;
    objc_copyWeak(&v27, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl configureTipViewWithTitle:description:closeButtonAction:](self, "configureTipViewWithTitle:description:closeButtonAction:", v6, v7, v12, v23, v24, v25, v26);

    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "interactionAssistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl keyboardMenuTipIdentifier](self, "keyboardMenuTipIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentMenuForInputUI:preferredArrowDirection:", v15, 0);

    self->m_keyboardMenuType = 3;
    m_tipView = self->m_tipView;
    self->m_tipView = 0;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

}

void __63__UIKeyboardImpl_presentDictationMenuTipWithTitle_description___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissDictationTip");
    WeakRetained = v2;
  }

}

- (void)presentEducationTipWithTitle:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *m_tipView;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  if (+[UIKeyboard isInlineTextCompletionEducationUIEnabled](UIKeyboard, "isInlineTextCompletionEducationUIEnabled")&& !+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKeyboardImpl _editMenuAssistant](self, "_editMenuAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hideSelectionCommands");

    objc_initWeak(&location, self);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __59__UIKeyboardImpl_presentEducationTipWithTitle_description___block_invoke;
    v17 = &unk_1E16B58D0;
    objc_copyWeak(&v18, &location);
    +[UIAction actionWithHandler:](UIAction, "actionWithHandler:", &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl configureTipViewWithTitle:description:closeButtonAction:](self, "configureTipViewWithTitle:description:closeButtonAction:", v6, v7, v9, v14, v15, v16, v17);

    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactionAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl keyboardMenuTipIdentifier](self, "keyboardMenuTipIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentMenuForInputUI:preferredArrowDirection:", v12, 1);

    self->m_keyboardMenuType = 5;
    m_tipView = self->m_tipView;
    self->m_tipView = 0;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __59__UIKeyboardImpl_presentEducationTipWithTitle_description___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissEducationTip");
    WeakRetained = v2;
  }

}

- (CGRect)overrideEditMenuTargetRectForConfiguration:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  objc_msgSend(a3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl keyboardMenuTipIdentifier](self, "keyboardMenuTipIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictationTipController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "activeTipType");

    if (v13 == 7)
    {
      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textInputView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v4 = v27;
      v6 = 0.0;
      v7 = 0.0;
      v5 = 0.0;
      goto LABEL_6;
    }
    if (v13 == 3)
    {
      -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activeSelection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "selectedRange");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "start");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "positionFromPosition:inDirection:offset:", v17, 3, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textRangeFromPosition:toPosition:", v19, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "firstRectForRange:", v21);
      v4 = v23;
      v5 = v24;
      v7 = v25;
      v6 = v26;

LABEL_6:
    }
  }
  v28 = v4;
  v29 = v5;
  v30 = v7;
  v31 = v6;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)editMenuTipView
{
  return self->m_tipView;
}

- (void)configureTipViewWithTitle:(id)a3 description:(id)a4 closeButtonAction:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIView *m_tipView;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  UIView *v63;
  void *v64;
  _QWORD v66[14];

  v66[12] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(v10, "setNumberOfLines:", 0);
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v10, "setTextAlignment:", 0);
  objc_msgSend(v10, "setPreferredMaxLayoutWidth:", 180.0);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_opt_new();
  +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextColor:", v13);

  objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleFootnote"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v14);

  objc_msgSend(v12, "setNumberOfLines:", 0);
  objc_msgSend(v12, "setText:", v8);

  objc_msgSend(v12, "setTextAlignment:", 0);
  objc_msgSend(v12, "setPreferredMaxLayoutWidth:", 180.0);
  v15 = v12;
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "addAction:forControlEvents:", v7, 0x2000);

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor quaternaryLabelColor](UIColor, "quaternaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithTintColor:renderingMode:", v18, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithWeight:](UIImageSymbolConfiguration, "configurationWithWeight:", 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageByApplyingSymbolConfiguration:", v20);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setImage:forState:", v64, 0);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v63 = (UIView *)objc_opt_new();
  -[UIView setLayoutMargins:](v63, "setLayoutMargins:", 14.0, 13.0, 16.0, 13.0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v63, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v63, "addSubview:", v10);
  -[UIView addSubview:](v63, "addSubview:", v15);
  -[UIView addSubview:](v63, "addSubview:", v16);
  -[UIView layoutMarginsGuide](v63, "layoutMarginsGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)MEMORY[0x1E0D156E0];
  objc_msgSend(v10, "topAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v60;
  objc_msgSend(v10, "leadingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "leadingAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v57;
  objc_msgSend(v10, "widthAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widthAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, -18.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v54;
  objc_msgSend(v16, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v66[3] = v50;
  objc_msgSend(v16, "leftAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v66[4] = v46;
  objc_msgSend(v16, "heightAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToConstant:", 18.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v66[5] = v44;
  objc_msgSend(v16, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v16;
  objc_msgSend(v16, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v66[6] = v39;
  v22 = v21;
  v42 = v21;
  objc_msgSend(v21, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v66[7] = v36;
  objc_msgSend(v15, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 4.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v66[8] = v33;
  v43 = v15;
  objc_msgSend(v15, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v66[9] = v25;
  objc_msgSend(v10, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:", 180.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v66[10] = v27;
  objc_msgSend(v22, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v66[11] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "activateConstraints:", v31);

  m_tipView = self->m_tipView;
  self->m_tipView = v63;

}

- (void)presentKeyboardMenu:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *m_editMenuInteraction;
  UIEditMenuInteraction *v12;
  UIEditMenuInteraction *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  self->m_keyboardMenuType = a3;
  -[UIKeyboardImpl touchDictationMenuTimer:](self, "touchDictationMenuTimer:", 0);
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_editMenuAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_selectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "interactionAssistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentMenuForInputUI:preferredArrowDirection:", 0, 0);

    m_editMenuInteraction = self->m_editMenuInteraction;
    self->m_editMenuInteraction = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (self->m_editMenuInteraction
    || (v12 = -[UIEditMenuInteraction initWithDelegate:]([UIEditMenuInteraction alloc], "initWithDelegate:", self), v13 = self->m_editMenuInteraction, self->m_editMenuInteraction = v12, v13, -[UIEditMenuInteraction setPresentsContextMenuAsSecondaryAction:](self->m_editMenuInteraction, "setPresentsContextMenuAsSecondaryAction:", 0), self->m_editMenuInteraction))
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textInputView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addInteraction:", self->m_editMenuInteraction);

    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedTextRange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "start");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "caretRectForPosition:", v19);
    v22 = v21 + v20 * 0.5;
    v25 = v24 + v23 * 0.5;

    +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v22, v25);
    m_editMenuInteraction = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(m_editMenuInteraction, "set_ignoresPassthroughInView:", 1);
    -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->m_editMenuInteraction, "presentEditMenuWithConfiguration:", m_editMenuInteraction);
    goto LABEL_6;
  }
LABEL_7:
  self->m_keyboardMenuType = 0;
}

- (void)presentDictationPopover
{
  if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled"))
  {
    -[UIKeyboardImpl dismissInputModeIndicator](self, "dismissInputModeIndicator");
    -[UIKeyboardImpl presentKeyboardPopoverWithType:keyString:completion:](self, "presentKeyboardPopoverWithType:keyString:completion:", 1, 0, 0);
  }
}

- (id)keyboardMenuTipIdentifier
{
  return CFSTR("KeyboardMenuTipIdentifier");
}

- (BOOL)canPresentDictationMenuWithAnimationStyle:(int64_t)a3
{
  void *v5;
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
  char v20;
  void *v21;
  int v22;
  UIEditMenuInteraction *m_editMenuInteraction;
  int v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v30;
  CGRect v31;
  CGRect v32;

  -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_caretView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toView:", 0);
  v32.origin.x = v16;
  v32.origin.y = v17;
  v32.size.width = v18;
  v32.size.height = v19;
  v31.origin.x = v9;
  v31.origin.y = v11;
  v31.size.width = v13;
  v31.size.height = v15;
  if (CGRectIntersectsRect(v31, v32))
    v20 = 0;
  else
    v20 = !+[UIKeyboard isInlineDictationIndicatorEnabled](UIKeyboard, "isInlineDictationIndicatorEnabled");

  if (self->m_editMenuInteraction)
  {
    +[UIMenuController sharedMenuController](UIMenuController, "sharedMenuController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isMenuVisible");

    m_editMenuInteraction = self->m_editMenuInteraction;
    if (m_editMenuInteraction)
    {
      v24 = -[UIEditMenuInteraction isDisplayingMenu](m_editMenuInteraction, "isDisplayingMenu");
      goto LABEL_9;
    }
  }
  else
  {
    v22 = 0;
  }
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "interactionAssistant");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v26, "isDisplayingMenu");

LABEL_9:
  if (a3 == 1)
    v27 = 1;
  else
    v27 = (v24 | v22) ^ 1;
  if ((v20 & 1) != 0
    || self->m_dictationIndicatorAssertion
    || (v27 & ~-[UIKeyboardImpl hasAutocorrectPrompt](self, "hasAutocorrectPrompt")) != 1
    || +[UIKeyboard isInlineDictationIndicatorEnabled](UIKeyboard, "isInlineDictationIndicatorEnabled")
    && -[UIKeyboardImpl inputModeSwitcherVisible](self, "inputModeSwitcherVisible"))
  {
    LOBYTE(v28) = 0;
  }
  else
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v30, "showingPromptsIncludingDictationChoices") ^ 1;

  }
  return v28;
}

- (void)presentDictationMenuWithAnimationStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UITextCursorAssertion *v13;
  UITextCursorAssertion *m_dictationIndicatorAssertion;
  uint8_t v15[8];
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->m_keyboardMenuType != 3)
  {
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_fault_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Dictation Menu should not be presented in keyboard process", v15, 2u);
      }
    }
    else if (+[UIKeyboard isInlineDictationIndicatorEnabled](UIKeyboard, "isInlineDictationIndicatorEnabled")&& (-[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager"), v5 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "selectionDisplayInteraction"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isActivated"), v6, v5, v7))
    {
      if (-[UIKeyboardImpl canPresentDictationMenuWithAnimationStyle:](self, "canPresentDictationMenuWithAnimationStyle:", a3))
      {
        -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "selectionDisplayInteraction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setGlowViewMode:", 1);

        -[UIKeyboardImpl _activeAssertionController](self, "_activeAssertionController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("_UITextCursorAnimationStyleUserInfoKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dictationIndicatorAssertionWithReason:userInfo:", CFSTR("Starting dictation"), v12);
        v13 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
        m_dictationIndicatorAssertion = self->m_dictationIndicatorAssertion;
        self->m_dictationIndicatorAssertion = v13;

      }
    }
    else
    {
      -[UIKeyboardImpl presentKeyboardMenu:](self, "presentKeyboardMenu:", 1);
    }
  }
}

- (void)presentDictationUndoMenu
{
  -[UIKeyboardImpl presentKeyboardMenu:](self, "presentKeyboardMenu:", 4);
}

- (void)presentDictationMenu
{
  -[UIKeyboardImpl presentDictationMenuWithAnimationStyle:](self, "presentDictationMenuWithAnimationStyle:", 1);
}

- (void)_dictationDidRecieveDidBeginDictationNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess", a3))
  {
    if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled")
      || +[UIKeyboard isInlineDictationIndicatorEnabled](UIKeyboard, "isInlineDictationIndicatorEnabled")
      && (-[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "selectionDisplayInteraction"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isActivated"),
          v5,
          v4,
          (v6 & 1) == 0))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentDictationMenu");

    }
  }
}

- (void)presentPressAndHoldPopoverWithKeyString:(id)a3
{
  -[UIKeyboardImpl presentKeyboardPopoverWithType:keyString:completion:](self, "presentKeyboardPopoverWithType:keyString:completion:", 2, a3, 0);
}

- (void)setRemoteDictationPopover:(id)a3
{
  void *v4;
  int v5;
  UIDictationPopoverController *dictationPopoverController;
  void *v7;
  UIDictationPopoverController *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  UIDictationPopoverController *v14;
  UIDictationPopoverController *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("appear"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  dictationPopoverController = self->_dictationPopoverController;
  if (v5)
  {
    if (!dictationPopoverController)
    {
      +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = [UIDictationPopoverController alloc];
      objc_msgSend(v7, "frame");
      v10 = v9;
      v12 = v11;
      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[UIDictationPopoverController initWithContentView:contentSize:inputDelegate:](v8, "initWithContentView:contentSize:inputDelegate:", v7, v13, v10, v12);
      v15 = self->_dictationPopoverController;
      self->_dictationPopoverController = v14;

      dictationPopoverController = self->_dictationPopoverController;
    }
    -[UIDictationPopoverController setRemoteDictationPopover:](dictationPopoverController, "setRemoteDictationPopover:", v16);
  }
  else
  {
    self->_dictationPopoverController = 0;

  }
}

- (id)dictationPopoverController
{
  return self->_dictationPopoverController;
}

- (BOOL)isDictationMenuPresented
{
  UIEditMenuInteraction *m_editMenuInteraction;
  void *v5;
  void *v6;
  char v7;

  m_editMenuInteraction = self->m_editMenuInteraction;
  if (m_editMenuInteraction)
  {
    if (-[UIEditMenuInteraction isDisplayingMenu](m_editMenuInteraction, "isDisplayingMenu"))
      return 1;
  }
  else
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactionAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isDisplayingMenuForInputUI");

    if ((v7 & 1) != 0)
      return 1;
  }
  return self->m_dictationMenuAction != 0;
}

+ (BOOL)isDictationPopoverEnabled
{
  int v2;
  void *v4;
  void *v5;
  void *v6;

  if (os_variant_has_internal_diagnostics())
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferencesActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForPreferenceKey:", CFSTR("DictationDisableInlinePopoverUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = objc_msgSend(v6, "BOOLValue") ^ 1;
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)dismissDictationPopoverAndCancelDictation
{
  void *v3;

  if (self->m_keyboardMenuType != 3)
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelDictation");

    -[UIKeyboardImpl dismissDictationPopover](self, "dismissDictationPopover");
  }
}

- (void)setInputModeAssertionWithReason:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIKeyboardImpl _activeAssertionController](self, "_activeAssertionController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeInputModeAssertionWithReason:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardImpl setInputModeAssertion:](self, "setInputModeAssertion:", v5);
}

- (void)clearInputModeAssertion
{
  void *v3;

  -[UIKeyboardImpl inputModeAssertion](self, "inputModeAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[UIKeyboardImpl setInputModeAssertion:](self, "setInputModeAssertion:", 0);
}

- (UIViewController)emojiPopoverController
{
  return (UIViewController *)self->_emojiPopoverController;
}

- (void)presentKeyboardPopoverWithType:(int)a3 keyString:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  dispatch_time_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
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
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  double Height;
  double Width;
  _BOOL4 v55;
  void *v56;
  int v57;
  void *v58;
  unint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  unsigned int v71;
  void *v72;
  _QWORD v73[5];
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  int v83;
  char v84;
  uint8_t buf[8];
  uint8_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _QWORD v91[5];
  id v92;
  id v93;
  int v94;
  _QWORD aBlock[5];
  id v96;
  id v97;
  int v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if (-[UIKeyboardImpl isSettingDelegate](self, "isSettingDelegate"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke;
    aBlock[3] = &unk_1E16D66F8;
    aBlock[4] = self;
    v98 = v6;
    v96 = v8;
    v97 = v9;
    v10 = _Block_copy(aBlock);
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v11, "documentState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "clientFrameInWindow");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;

        v99.origin.x = v15;
        v99.origin.y = v17;
        v99.size.width = v19;
        v99.size.height = v21;
        if (CGRectIsEmpty(v99))
        {
          v22 = dispatch_time(0, 500000000);
          dispatch_after(v22, MEMORY[0x1E0C80D38], v10);

LABEL_34:
          goto LABEL_52;
        }

      }
    }
    dispatch_async(MEMORY[0x1E0C80D38], v10);
    goto LABEL_34;
  }
  if ((_DWORD)v6 == 1)
  {
    if (!objc_msgSend((id)objc_opt_class(), "isDictationPopoverEnabled"))
      goto LABEL_52;
LABEL_12:
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textInputView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "keyboardSceneDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = v25;
    }
    else
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

    if (-[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented"))
    {
      v29 = (((_DWORD)v6 != 1) & -[UIKeyboardImpl isDictationPopoverPresented](self, "isDictationPopoverPresented")) == 0;
      v30 = 17;
      if (!v29)
        v30 = 23;
      v31 = OBJC_IVAR___UIKeyboardImpl__id[v30];
    }
    else
    {
      if (!(_DWORD)v6)
      {
        if (-[UIKeyboardImpl _showsScribbleIconsInAssistantView](self, "_showsScribbleIconsInAssistantView")
          || (objc_msgSend(v28, "visualModeManager"),
              v56 = (void *)objc_claimAutoreleasedReturnValue(),
              v57 = objc_msgSend(v56, "shouldShowWithinAppWindow"),
              v56,
              v57))
        {
          objc_msgSend(v28, "containerRootController");
          v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
          v33 = v32;
          if (v32)
            goto LABEL_24;
LABEL_40:
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_185066000, v68, OS_LOG_TYPE_FAULT, "Why don't we have a view controller for the keyboard popover?", buf, 2u);
            }

          }
          else
          {
            v59 = qword_1ECD78438;
            if (!qword_1ECD78438)
            {
              v59 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v59, (unint64_t *)&qword_1ECD78438);
            }
            v60 = *(NSObject **)(v59 + 8);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_185066000, v60, OS_LOG_TYPE_ERROR, "Why don't we have a view controller for the keyboard popover?", buf, 2u);
            }
          }
LABEL_24:
          objc_msgSend(v33, "presentedViewController");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_msgSend(v33, "presentedViewController");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v91[0] = MEMORY[0x1E0C809B0];
            v91[1] = 3221225472;
            v91[2] = __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_275;
            v91[3] = &unk_1E16D66F8;
            v91[4] = self;
            v94 = v6;
            v92 = v8;
            v93 = v9;
            objc_msgSend(v35, "dismissViewControllerAnimated:completion:", 0, v91);

LABEL_51:
            goto LABEL_52;
          }
          v72 = v24;
          v70 = v28;
          if (!(_DWORD)v6
            && self->_emojiPopoverController
            && -[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented"))
          {
            if (os_variant_has_internal_diagnostics())
            {
              __UIFaultDebugAssertLog();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_185066000, v69, OS_LOG_TYPE_FAULT, "We're being asked to present the Emoji Popover when it's already presented.", buf, 2u);
              }

            }
            else
            {
              v66 = qword_1ECD78440;
              if (!qword_1ECD78440)
              {
                v66 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v66, (unint64_t *)&qword_1ECD78440);
              }
              v67 = *(NSObject **)(v66 + 8);
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_185066000, v67, OS_LOG_TYPE_ERROR, "We're being asked to present the Emoji Popover when it's already presented.", buf, 2u);
              }
            }
          }
          -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "selectedTextRange");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "selectionRectsForRange:", v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = objc_msgSend(v40, "isVertical");

          v41 = v37;
          -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "start");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "caretRectForPosition:", v43);
          v45 = v44;
          v47 = v46;
          v49 = v48;
          v51 = v50;

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = v23;
            objc_msgSend(v52, "bounds");
            Height = CGRectGetHeight(v100);
            v101.origin.x = v45;
            v101.origin.y = v47;
            v101.size.width = v49;
            v101.size.height = v51;
            if (Height <= CGRectGetHeight(v101))
            {
              v55 = 1;
            }
            else
            {
              objc_msgSend(v52, "bounds");
              Width = CGRectGetWidth(v102);
              v103.origin.x = v45;
              v103.origin.y = v47;
              v103.size.width = v49;
              v103.size.height = v51;
              v55 = Width <= CGRectGetWidth(v103);
            }
            if (objc_msgSend(v52, "isScrollEnabled"))
            {
              objc_msgSend(v52, "bounds");
              v105.origin.x = v45;
              v105.origin.y = v47;
              v105.size.width = v49;
              v105.size.height = v51;
              if (!CGRectIntersectsRect(v104, v105) && !v55)
              {
                *(_QWORD *)buf = 0;
                v86 = buf;
                v87 = 0x3032000000;
                v88 = __Block_byref_object_copy__131;
                v89 = __Block_byref_object_dispose__131;
                v90 = 0;
                objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v73[0] = MEMORY[0x1E0C809B0];
                v73[1] = 3221225472;
                v73[2] = __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_278;
                v73[3] = &unk_1E16D6720;
                v78 = buf;
                v73[4] = self;
                v83 = v6;
                v74 = v8;
                v75 = v33;
                v76 = v72;
                v79 = v45;
                v80 = v47;
                v81 = v49;
                v82 = v51;
                v84 = v71;
                v77 = v9;
                objc_msgSend(v61, "addObserverForName:object:queue:usingBlock:", CFSTR("UITextSelectionDidScroll"), v52, v62, v73);
                v63 = objc_claimAutoreleasedReturnValue();
                v64 = (void *)*((_QWORD *)v86 + 5);
                *((_QWORD *)v86 + 5) = v63;

                objc_msgSend(v52, "interactionAssistant");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "scrollSelectionToVisible");

                _Block_object_dispose(buf, 8);
                v28 = v70;
                v41 = v37;
                v24 = v72;
                goto LABEL_50;
              }
            }

            v28 = v70;
            v41 = v37;
          }
          else
          {
            v28 = v70;
          }
          v24 = v72;
          -[UIKeyboardImpl _presentKeyboardPopoverWithType:keyString:popoverController:textInputView:caretRect:isVerticalText:completion:](self, "_presentKeyboardPopoverWithType:keyString:popoverController:textInputView:caretRect:isVerticalText:completion:", v6, v8, v33, v72, v71, v9, v45, v47, v49, v51);
LABEL_50:

          goto LABEL_51;
        }
      }
      if (!-[UIKeyboardImpl isDictationPopoverPresented](self, "isDictationPopoverPresented"))
      {
        objc_msgSend(v28, "forceCreateKeyboardWindow");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "rootViewController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
          goto LABEL_24;
        goto LABEL_40;
      }
      v31 = 584;
    }
    v32 = *(id *)((char *)&self->super.super.super.isa + v31);
    goto LABEL_23;
  }
  if ((_DWORD)v6 != 2
    || !-[UIKeyboardImpl isPressAndHoldPopoverPresented](self, "isPressAndHoldPopoverPresented")
    || !-[UIPressAndHoldPopoverController isSamePressAndHoldPopoverForKeyString:](self->_pressAndHoldPopoverController, "isSamePressAndHoldPopoverForKeyString:", v8))
  {
    goto LABEL_12;
  }
LABEL_52:

}

uint64_t __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "canPresentEmojiPopover");
  v3 = *(unsigned int *)(a1 + 56);
  if ((result & 1) != 0 || (_DWORD)v3 == 1)
    return objc_msgSend(*(id *)(a1 + 32), "presentKeyboardPopoverWithType:keyString:completion:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

void __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_275(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "presentKeyboardPopoverWithType:keyString:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_278(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_presentKeyboardPopoverWithType:keyString:popoverController:textInputView:caretRect:isVerticalText:completion:", *(unsigned int *)(a1 + 112), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 116), *(_QWORD *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

- (void)_presentKeyboardPopoverWithType:(int)a3 keyString:(id)a4 popoverController:(id)a5 textInputView:(id)a6 caretRect:(CGRect)a7 isVerticalText:(BOOL)a8 completion:(id)a9
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  BOOL v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double MinX;
  double v43;
  double MinY;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  uint64_t v51;
  CGFloat v52;
  double v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  CGFloat v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  UIPressAndHoldPopoverController *v92;
  UIPressAndHoldPopoverController *pressAndHoldPopoverController;
  UIDictationPopoverController *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  id v100;
  uint64_t v101;
  void *v102;
  UIDictationPopoverController *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  UIDictationPopoverController *v109;
  UIDictationPopoverController *dictationPopoverController;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  CGFloat v116;
  uint64_t v117;
  CGRect *p_m_editMenuFrame;
  double MidY;
  void *v120;
  void *v121;
  uint64_t v122;
  UIKeyboardEmojiPopoverController *v123;
  void *v124;
  void *v125;
  UIKeyboardEmojiPopoverController *v126;
  UIKeyboardEmojiPopoverController *emojiPopoverController;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CGFloat v142;
  double MaxY;
  void *v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  BOOL v148;
  void *v149;
  void *v150;
  void *v151;
  id v152;
  UIDictationPopoverController *v153;
  unint64_t v154;
  NSObject *v155;
  unint64_t v156;
  NSObject *v157;
  NSObject *v158;
  NSObject *v159;
  BOOL v160;
  double v161;
  uint64_t v162;
  CGFloat v163;
  unsigned int v164;
  id v165;
  _QWORD v167[4];
  UIDictationPopoverController *v168;
  id v169;
  UIKeyboardImpl *v170;
  id v171;
  void (**v172)(_QWORD);
  int v173;
  uint8_t buf[16];
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = (void (**)(_QWORD))a9;
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v163 = width;
    objc_msgSend(v19, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "bounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = -[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch");
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess") && !v33)
    {
      -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        objc_msgSend(v35, "documentState");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "clientFrameInWindow");
        v26 = v38;
        v28 = v39;
        v30 = v40;
        v32 = v41;

      }
      v34 = height;

    }
    else
    {
      v34 = height;
    }
    v175.origin.x = v26;
    v175.origin.y = v28;
    v175.size.width = v30;
    v175.size.height = v32;
    MinX = CGRectGetMinX(v175);
    v176.origin.x = v26;
    v176.origin.y = v28;
    v176.size.width = v30;
    v176.size.height = v32;
    v43 = fmax(MinX, fmin(x, CGRectGetMaxX(v176)));
    v177.origin.x = v26;
    v177.origin.y = v28;
    v177.size.width = v30;
    v177.size.height = v32;
    MinY = CGRectGetMinY(v177);
    v178.origin.x = v26;
    v178.origin.y = v28;
    v178.size.width = v30;
    v178.size.height = v32;
    v45 = fmax(MinY, fmin(y, CGRectGetMaxY(v178)));
    v165 = v18;
    v160 = a8;
    v46 = v43;
    v47 = v45;
    if (a8)
    {
      v48 = v163;
      v49 = v163;
      v50 = v34;
      if (CGRectGetWidth(*(CGRect *)&v46) > 100.0)
      {
        v179.origin.x = v43;
        v179.origin.y = v45;
        v179.size.width = v163;
        v179.size.height = v34;
        v43 = CGRectGetMaxX(v179) + -1.0;
        v48 = 1.0;
      }
      v51 = 12;
    }
    else
    {
      v48 = v163;
      v52 = v163;
      v53 = v34;
      if (CGRectGetHeight(*(CGRect *)&v46) > 100.0)
      {
        v180.origin.x = v43;
        v180.origin.y = v45;
        v180.size.width = v163;
        v180.size.height = v34;
        v45 = CGRectGetMaxY(v180) + -1.0;
        v34 = 1.0;
      }
      v51 = 3;
    }
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "visualModeManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "shouldShowWithinAppWindow");

    v164 = v56;
    if (v56)
      v51 = 15;
    objc_msgSend(v20, "keyboardSceneDelegate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
      objc_msgSend(v20, "keyboardSceneDelegate");
    else
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "containerWindow");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v59, "_isHostedInAnotherProcess") && (objc_msgSend(v59, "_isFullscreen") & 1) == 0)
    {
      if (a3)
      {
        objc_msgSend(v59, "convertRect:fromView:", v20, v43, v45, v48, v34);
        v61 = v96;
        v63 = v97;
        v65 = v98;
        v67 = v99;
        v100 = v59;

        objc_msgSend(v100, "rootViewController");
        v101 = objc_claimAutoreleasedReturnValue();

        v24 = v100;
        v19 = (id)v101;
      }
      else
      {
        objc_msgSend(v20, "window");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "convertRect:toView:", v128, v43, v45, v48, v34);
        v130 = v129;
        v132 = v131;
        v134 = v133;
        v136 = v135;

        objc_msgSend(v20, "window");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "convertRect:fromWindow:", v137, v130, v132, v134, v136);
        v61 = v138;
        v63 = v139;
        v65 = v140;
        v67 = v141;

      }
    }
    else
    {
      objc_msgSend(v59, "convertRect:fromView:", v20, v43, v45, v48, v34);
      objc_msgSend(v59, "convertRect:toView:", v24);
      v61 = v60;
      v63 = v62;
      v65 = v64;
      v67 = v66;
    }
    if (v24)
    {
      objc_msgSend(v59, "screen");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "screen");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v162 = v51;
      if (v68 != v69)
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v158 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v158, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v158, OS_LOG_TYPE_FAULT, "The input view is on a different screen than the popover window; popover will have the wrong frame.",
              buf,
              2u);
          }

        }
        else
        {
          v154 = qword_1ECD78448;
          if (!qword_1ECD78448)
          {
            v154 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v154, (unint64_t *)&qword_1ECD78448);
          }
          v155 = *(NSObject **)(v154 + 8);
          if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v155, OS_LOG_TYPE_ERROR, "The input view is on a different screen than the popover window; popover will have the wrong frame.",
              buf,
              2u);
          }
        }
      }
      v161 = v67;
      v70 = v65;
      objc_msgSend(v59, "frame");
      v72 = v71;
      v74 = v73;
      v76 = v75;
      v78 = v77;
      objc_msgSend(v24, "frame");
      v196.origin.x = v79;
      v196.origin.y = v80;
      v196.size.width = v81;
      v196.size.height = v82;
      v181.origin.x = v72;
      v181.origin.y = v74;
      v181.size.width = v76;
      v181.size.height = v78;
      if (!CGRectEqualToRect(v181, v196))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v159 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v159, OS_LOG_TYPE_FAULT, "The input view's window has a different frame than the popover window; popover may have the wrong frame.",
              buf,
              2u);
          }

        }
        else
        {
          v156 = qword_1ECD78450;
          if (!qword_1ECD78450)
          {
            v156 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v156, (unint64_t *)&qword_1ECD78450);
          }
          v157 = *(NSObject **)(v156 + 8);
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_185066000, v157, OS_LOG_TYPE_ERROR, "The input view's window has a different frame than the popover window; popover may have the wrong frame.",
              buf,
              2u);
          }
        }
      }
      objc_msgSend(v24, "bounds");
      v83 = v182.origin.x;
      v84 = v182.origin.y;
      v85 = v182.size.width;
      v86 = v182.size.height;
      v87 = CGRectGetMinX(v182);
      v183.origin.x = v83;
      v183.origin.y = v84;
      v183.size.width = v85;
      v183.size.height = v86;
      v88 = fmax(v87, fmin(v61, CGRectGetMaxX(v183)));
      v184.origin.x = v83;
      v184.origin.y = v84;
      v184.size.width = v85;
      v184.size.height = v86;
      v89 = CGRectGetMinY(v184);
      v185.origin.x = v83;
      v185.origin.y = v84;
      v185.size.width = v85;
      v185.size.height = v86;
      v90 = fmax(v89, fmin(v63, CGRectGetMaxY(v185)));
      if (a3 == 1)
      {
        -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", self->_dictationPopoverController, 1, 0);
        +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = [UIDictationPopoverController alloc];
        objc_msgSend(v102, "frame");
        v105 = v104;
        v107 = v106;
        -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = -[UIDictationPopoverController initWithContentView:contentSize:inputDelegate:](v103, "initWithContentView:contentSize:inputDelegate:", v102, v108, v105, v107);
        dictationPopoverController = self->_dictationPopoverController;
        self->_dictationPopoverController = v109;

        v94 = self->_dictationPopoverController;
        objc_msgSend(v102, "frame");
        v111 = CGRectGetHeight(v186);
        objc_msgSend(v24, "safeAreaInsets");
        v113 = v111 + v112;
        -[objc_class arrowHeight](+[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass"), "arrowHeight");
        v115 = v113 + v114;
        v91 = v70;
        v95 = v161;
        if (!v160)
        {
          v187.origin.x = v88;
          v187.origin.y = v90;
          v187.size.width = v91;
          v187.size.height = v161;
          v116 = CGRectGetMinY(v187);
          v117 = v51;
          if (v116 > v115)
            v117 = 2;
          v162 = v117;
        }
        p_m_editMenuFrame = &self->m_editMenuFrame;
        if (!CGRectIsEmpty(self->m_editMenuFrame))
        {
          v188.origin.x = p_m_editMenuFrame->origin.x;
          v188.origin.y = self->m_editMenuFrame.origin.y;
          v188.size.width = self->m_editMenuFrame.size.width;
          v188.size.height = self->m_editMenuFrame.size.height;
          MidY = CGRectGetMidY(v188);
          v189.origin.x = v88;
          v189.origin.y = v90;
          v189.size.width = v91;
          v189.size.height = v161;
          if (MidY >= CGRectGetMidY(v189))
          {
            v193.origin.x = v88;
            v193.origin.y = v90;
            v193.size.width = v91;
            v193.size.height = v161;
            v142 = CGRectGetMinX(v193);
            v194.origin.x = p_m_editMenuFrame->origin.x;
            v194.origin.y = self->m_editMenuFrame.origin.y;
            v194.size.width = self->m_editMenuFrame.size.width;
            v194.size.height = self->m_editMenuFrame.size.height;
            MaxY = CGRectGetMaxY(v194);
            v195.origin.x = v88;
            v195.origin.y = v90;
            v195.size.width = v91;
            v195.size.height = v161;
            v90 = MaxY - CGRectGetHeight(v195);
            v162 = 1;
            v88 = v142;
          }
          else
          {
            v190.origin.x = p_m_editMenuFrame->origin.x;
            v190.origin.y = self->m_editMenuFrame.origin.y;
            v190.size.width = self->m_editMenuFrame.size.width;
            v190.size.height = self->m_editMenuFrame.size.height;
            if (CGRectGetMinY(v190) <= v115)
            {
              v162 = 1;
            }
            else
            {
              v191.origin.x = v88;
              v191.origin.y = v90;
              v191.size.width = v91;
              v191.size.height = v161;
              v88 = CGRectGetMinX(v191);
              v192.origin.x = p_m_editMenuFrame->origin.x;
              v192.origin.y = self->m_editMenuFrame.origin.y;
              v192.size.width = self->m_editMenuFrame.size.width;
              v192.size.height = self->m_editMenuFrame.size.height;
              v90 = CGRectGetMinY(v192);
            }
          }
          -[UIDictationPopoverController movePopoverViewForEditMenuFrame:](self->_dictationPopoverController, "movePopoverViewForEditMenuFrame:", p_m_editMenuFrame->origin.x, self->m_editMenuFrame.origin.y, self->m_editMenuFrame.size.width, self->m_editMenuFrame.size.height);
        }

        v18 = v165;
      }
      else
      {
        v91 = v70;
        if (a3 == 2)
        {
          -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", self->_pressAndHoldPopoverController, 1, 0);
          v18 = v165;
          v92 = -[UIPressAndHoldPopoverController initWithKeyString:]([UIPressAndHoldPopoverController alloc], "initWithKeyString:", v165);
          pressAndHoldPopoverController = self->_pressAndHoldPopoverController;
          self->_pressAndHoldPopoverController = v92;

          v94 = self->_pressAndHoldPopoverController;
          v95 = v161;
        }
        else
        {
          v95 = v161;
          if (qword_1ECD78470 != -1)
            dispatch_once(&qword_1ECD78470, &__block_literal_global_2301);
          objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "valueForPreferenceKey:", CFSTR("VerticalScrollingInEmojiPopover"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v121, "BOOLValue") & 1) != 0)
            v122 = 1;
          else
            v122 = _os_feature_enabled_impl();

          -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", self->_emojiPopoverController, 1, 0);
          v123 = [UIKeyboardEmojiPopoverController alloc];
          -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardImpl taskQueue](self, "taskQueue");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:](v123, "initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:", v124, v125, v122, v24, v88, v90, v91, v161);
          emojiPopoverController = self->_emojiPopoverController;
          self->_emojiPopoverController = v126;

          v94 = self->_emojiPopoverController;
          v18 = v165;
        }
      }
      -[UIViewController setModalPresentationStyle:](v94, "setModalPresentationStyle:", 7);
      -[UIViewController traitCollection](v94, "traitCollection");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v144, "userInterfaceIdiom"))
      {

        v145 = v162;
      }
      else
      {
        -[UIViewController traitCollection](v94, "traitCollection");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v147 = objc_msgSend(v146, "verticalSizeClass");

        v148 = v147 == 1;
        v18 = v165;
        v145 = v162;
        if (v148)
          v145 = 15;
      }
      -[UIViewController popoverPresentationController](v94, "popoverPresentationController");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardPopoverController configurePopoverPresentationController:](v94, "configurePopoverPresentationController:", v149);
      objc_msgSend(v149, "setDelegate:", self);
      objc_msgSend(v149, "setSourceView:", v24);
      objc_msgSend(v149, "setSourceRect:", v88, v90, v91, v95);
      objc_msgSend(v149, "setPermittedArrowDirections:", v145);
      objc_msgSend(v149, "setCanOverlapSourceViewRect:", v164);
      if (a3 == 1)
      {
        objc_msgSend(v149, "setPopoverLayoutMargins:", -5.0, 19.0, 10.0, 19.0);
        objc_msgSend(v149, "_setIgnoresKeyboardNotifications:", 1);
      }
      else if (a3 == 2)
      {
        objc_msgSend(v149, "setPopoverBackgroundViewClass:", objc_opt_class());
        -[UIView traitCollection](self, "traitCollection");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v150, "userInterfaceStyle") == 2)
          +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
        else
          +[UIColor whiteColor](UIColor, "whiteColor");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "setBackgroundColor:", v151);

        v18 = v165;
      }
      v167[0] = MEMORY[0x1E0C809B0];
      v167[1] = 3221225472;
      v167[2] = __128__UIKeyboardImpl__presentKeyboardPopoverWithType_keyString_popoverController_textInputView_caretRect_isVerticalText_completion___block_invoke;
      v167[3] = &unk_1E16D6748;
      v168 = v94;
      v169 = v19;
      v170 = self;
      v173 = a3;
      v171 = v149;
      v172 = v21;
      v152 = v149;
      v153 = v94;
      objc_msgSend(v169, "presentViewController:animated:completion:", v153, 1, v167);

    }
    else
    {
      v18 = v165;
      if (v21)
        v21[2](v21);
    }

  }
  else if (v21)
  {
    v21[2](v21);
  }

}

uint64_t __128__UIKeyboardImpl__presentKeyboardPopoverWithType_keyString_popoverController_textInputView_caretRect_isVerticalText_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;

  if ((objc_msgSend(*(id *)(a1 + 32), "wantsDimmingView") & 1) == 0
    && (*(_QWORD *)(a1 + 40) == *(_QWORD *)(*(_QWORD *)(a1 + 48) + 576) || *(_DWORD *)(a1 + 72) != 2))
  {
    objc_msgSend(*(id *)(a1 + 56), "dimmingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 56), "shadowView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsHitTesting:", 0);

  }
  if ((*(_DWORD *)(a1 + 72) - 1) <= 1)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemInputAssistantViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsValidation");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 744), "reloadCurrentKeyplane");
    objc_msgSend(*(id *)(a1 + 48), "_requestInputManagerSync");
  }
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  UIDictationPopoverController *dictationPopoverController;
  id v8;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;

  dictationPopoverController = self->_dictationPopoverController;
  v8 = a3;
  -[UIViewController popoverPresentationController](dictationPopoverController, "popoverPresentationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    -[UIDictationPopoverController sourceRect](self->_dictationPopoverController, "sourceRect");
    a4->origin.x = v10;
    a4->origin.y = v11;
    a4->size.width = v12;
    a4->size.height = v13;
  }
}

- (void)updateDictationPopoverLocationIfNeeded
{
  void *v3;
  int v4;
  dispatch_time_t v5;
  _QWORD block[5];

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAsyncCapableInputDelegate");

  if (v4)
  {
    v5 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__UIKeyboardImpl_updateDictationPopoverLocationIfNeeded__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[UIDictationPopoverController movePopoverViewToCurrentCareLocation](self->_dictationPopoverController, "movePopoverViewToCurrentCareLocation");
  }
}

uint64_t __56__UIKeyboardImpl_updateDictationPopoverLocationIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "movePopoverViewToCurrentCareLocation");
}

- (void)setEditMenuFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  int v10;
  CGRect *p_m_editMenuFrame;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17[1] = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
  {
    -[UIKeyboardImpl candidateController](self, "candidateController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadInlineCandidateView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v15;
    if (v15)
    {
      v10 = objc_msgSend(v15, "isHidden");
      v9 = v15;
      if (!v10)
      {

        return;
      }
    }

  }
  p_m_editMenuFrame = &self->m_editMenuFrame;
  self->m_editMenuFrame.origin.x = x;
  self->m_editMenuFrame.origin.y = y;
  self->m_editMenuFrame.size.width = width;
  self->m_editMenuFrame.size.height = height;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI", v15))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("editMenuFrame");
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", p_m_editMenuFrame->origin.x, self->m_editMenuFrame.origin.y, self->m_editMenuFrame.size.width, self->m_editMenuFrame.size.height);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_setEditMenuFrame_, v14);

    v18.origin.x = p_m_editMenuFrame->origin.x;
    v18.origin.y = self->m_editMenuFrame.origin.y;
    v18.size.width = self->m_editMenuFrame.size.width;
    v18.size.height = self->m_editMenuFrame.size.height;
    if (CGRectIsEmpty(v18))
      -[UIKeyboardImpl updateDictationPopoverLocationIfNeeded](self, "updateDictationPopoverLocationIfNeeded");
  }
  else
  {
    -[UIDictationPopoverController movePopoverViewForEditMenuFrame:](self->_dictationPopoverController, "movePopoverViewForEditMenuFrame:", p_m_editMenuFrame->origin.x, self->m_editMenuFrame.origin.y, self->m_editMenuFrame.size.width, self->m_editMenuFrame.size.height);
  }
}

- (void)updateDictationPopoverLocationForCandidateInlineView:(id)a3 yOffset:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v6 = a3;
  if (v6)
  {
    v18 = v6;
    if (objc_msgSend(v6, "isHidden"))
    {
      -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    }
    else
    {
      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textInputView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyboardSceneDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textInputView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "keyboardSceneDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "containerWindow");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containerWindow");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[UIViewController view](self->_dictationPopoverController, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "window");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "bounds");
      objc_msgSend(v13, "convertRect:fromView:", v18);
      if (v13 != v15)
        objc_msgSend(v13, "convertRect:toView:", v15);
      -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:", v16 + 0.0, v17 + a4);

    }
    v6 = v18;
  }

}

- (void)dismissEmojiPopoverBeforeCleanup:(BOOL)a3
{
  -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", self->_emojiPopoverController, a3, 0);
}

- (void)unsetEmojiPopoverToRestoreAfterRotation
{
  self->_emojiPopoverToRestoreAfterRotation = 0;
}

uint64_t __66__UIKeyboardImpl_dismissKeyboardPopover_beforeCleanup_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "cleanupKeyboardPopover:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)didPresentMemojiCard
{
  UIKeyboardEmojiPopoverController *emojiPopoverController;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  emojiPopoverController = self->_emojiPopoverController;
  if (emojiPopoverController)
  {
    -[UIViewController popoverPresentationController](emojiPopoverController, "popoverPresentationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __38__UIKeyboardImpl_didPresentMemojiCard__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v7 = v4;
    v5 = v4;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v6, 0.2);

  }
}

uint64_t __38__UIKeyboardImpl_didPresentMemojiCard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)didDismissMemojiCard
{
  if (self->_emojiPopoverController)
    -[UIKeyboardImpl dismissEmojiPopoverBeforeCleanup:](self, "dismissEmojiPopoverBeforeCleanup:", 0);
}

- (void)dismissCursorAccessory
{
  id v2;

  -[UIKeyboardImpl dismissDictationPopoverAndCancelDictation](self, "dismissDictationPopoverAndCancelDictation");
  +[UIInputSwitcher activeInstance](UIInputSwitcher, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideSwitcherIfNeeded");

}

- (BOOL)hasLanguageIndicator
{
  return self->m_languageIndicator != 0;
}

- (id)languageIndicator
{
  return self->m_languageIndicator;
}

- (void)updateInputModeIndicatorOnSingleKeyOnly:(BOOL)a3 preserveIfPossible:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
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
  UIView **p_m_languageIndicator;
  void *m_layout;
  UIView *v22;
  id v23;
  void *v24;
  void *v25;
  UIView *v26;
  UIView *v27;
  UIView *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *(*v32)(uint64_t);
  void *v33;
  UIView *v34;
  UIKeyboardImpl *v35;
  _QWORD v36[4];
  id v37;
  UIKeyboardImpl *v38;
  CGRect v39;
  CGRect v40;

  v4 = a4;
  v5 = a3;
  self->m_showInputModeIndicator = 0;
  if (!-[UIKeyboardLayout shouldShowIndicator](self->m_layout, "shouldShowIndicator")
    || -[UIKeyboardImpl isTrackpadMode](self, "isTrackpadMode")
    || v5)
  {
    -[UIKeyboardImpl clearLanguageIndicator](self, "clearLanguageIndicator");
  }
  else
  {
    -[UIKeyboardLayout activationIndicatorView](self->m_layout, "activationIndicatorView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_7;
    -[UIView frame](self->m_languageIndicator, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v7, "frame");
    v40.origin.x = v16;
    v40.origin.y = v17;
    v40.size.width = v18;
    v40.size.height = v19;
    v39.origin.x = v9;
    v39.origin.y = v11;
    v39.size.width = v13;
    v39.size.height = v15;
    if (!CGRectEqualToRect(v39, v40))
    {
LABEL_7:
      -[UIKeyboardImpl clearLanguageIndicator](self, "clearLanguageIndicator");
      p_m_languageIndicator = &self->m_languageIndicator;
      objc_storeStrong((id *)&self->m_languageIndicator, v7);
      m_layout = self->m_layout;
      if (!m_layout)
        m_layout = self;
      v22 = *p_m_languageIndicator;
      v23 = m_layout;
      -[UIView setAutoresizingMask:](v22, "setAutoresizingMask:", 8);
      objc_msgSend(v23, "addSubview:", *p_m_languageIndicator);

      -[UIView subviews](*p_m_languageIndicator, "subviews");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = *p_m_languageIndicator;

        v25 = v26;
      }
      -[UIKeyboardLayout setHideKeysUnderIndicator:](self->m_layout, "setHideKeysUnderIndicator:", 1);
      v27 = *p_m_languageIndicator;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke;
      v36[3] = &unk_1E16B1B50;
      v37 = v25;
      v38 = self;
      v30 = MEMORY[0x1E0C809B0];
      v31 = 3221225472;
      v32 = __77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke_2;
      v33 = &unk_1E16B2218;
      v34 = v27;
      v35 = self;
      v28 = v27;
      v29 = v25;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v36, &v30, 0.25, 0.75);
      -[UIKeyboardLayout fadeActivationIndicatorWithDuration:withDelay:](self->m_layout, "fadeActivationIndicatorWithDuration:withDelay:", 0.25, 0.75, v30, v31, v32, v33);

    }
  }
}

uint64_t __77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 744), "setHideKeysUnderIndicator:", 0);
}

_QWORD *__77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke_2(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[52])
    return (_QWORD *)objc_msgSend(result, "clearLanguageIndicator");
  return result;
}

- (void)updateInputModeIndicatorOnSingleKeyOnly:(BOOL)a3
{
  -[UIKeyboardImpl updateInputModeIndicatorOnSingleKeyOnly:preserveIfPossible:](self, "updateInputModeIndicatorOnSingleKeyOnly:preserveIfPossible:", a3, 0);
}

- (BOOL)shouldShowInternationalKeyIntroduction
{
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  if (-[UIKeyboardLayout idiom](self->m_layout, "idiom") == 3)
    return 0;
  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    return 0;
  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSecureTextEntry");

  if ((v4 & 1) != 0)
    return 0;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "keyboardType");
    if (v6 <= 0xB && ((1 << v6) & 0x930) != 0 || v6 == 127)
    {

      return 0;
    }

  }
  v8 = (id)UIKeyboardActiveUserSelectableInputModes;
  v9 = objc_msgSend(v8, "count");

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "normalizedEnabledInputModeIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", CFSTR("emoji"));

  if (v12
    && (-[UIKeyboardImpl showsDedicatedEmojiKeyAlongsideGlobeButton](self, "showsDedicatedEmojiKeyAlongsideGlobeButton")
     || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
     && -[UIKeyboardImpl globeKeyDisplaysAsEmojiKey](self, "globeKeyDisplaysAsEmojiKey")))
  {
    --v9;
  }
  return v9 > 2;
}

- (CGRect)keyboardIntroductionFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomEdgeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "systemInputAssistantViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0.0;
  if ((objc_msgSend(v14, "shouldBeShownForInputDelegate:inputViews:", 0, 0) & 1) == 0)
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hidePrediction");

    if ((v17 & 1) == 0)
    {
      -[UIView traitCollection](self, "traitCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferredHeightForTraitCollection:", v18);
      v15 = v19 + 0.0;

    }
  }

  v20 = v6;
  v21 = v8 - v15;
  v22 = v10 + 0.0;
  v23 = v12 + v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)showInternationalKeyIntroductionIfNeededWithPreviousInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UIKeyboardGlobeKeyIntroductionView *v17;
  UIKeyboardGlobeKeyIntroductionView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id location;

  v4 = a3;
  if (-[UIKeyboardImpl shouldShowInternationalKeyIntroduction](self, "shouldShowInternationalKeyIntroduction"))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "oneTimeActionCompleted:", *MEMORY[0x1E0DBEA60]);

    if ((v7 & 1) == 0)
    {
      -[UIKeyboardImpl keyboardIntroductionFrame](self, "keyboardIntroductionFrame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[UIKeyboardImpl internationalKeyIntroductionView](self, "internationalKeyIntroductionView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_initWeak(&location, self);
        v17 = [UIKeyboardGlobeKeyIntroductionView alloc];
        v23 = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = __80__UIKeyboardImpl_showInternationalKeyIntroductionIfNeededWithPreviousInputMode___block_invoke;
        v26 = &unk_1E16B3F40;
        objc_copyWeak(&v27, &location);
        v18 = -[UIKeyboardGlobeKeyIntroductionView initWithFrame:completion:](v17, "initWithFrame:completion:", &v23, v9, v11, v13, v15);
        -[UIKeyboardImpl setInternationalKeyIntroductionView:](self, "setInternationalKeyIntroductionView:", v18, v23, v24, v25, v26);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      -[UIKeyboardImpl internationalKeyIntroductionView](self, "internationalKeyIntroductionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFrame:", v9, v11, v13, v15);

      -[UIView _rootInputWindowController](self, "_rootInputWindowController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bottomEdgeView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardImpl internationalKeyIntroductionView](self, "internationalKeyIntroductionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

    }
  }

}

void __80__UIKeyboardImpl_showInternationalKeyIntroductionIfNeededWithPreviousInputMode___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hideInternationalKeyIntroductionIfNeeded");

}

- (BOOL)shouldShowModelessInputTip
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v2 = +[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive");
  if (v2)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "oneTimeActionCompleted:", *MEMORY[0x1E0DBE460]))
    {

LABEL_6:
      LOBYTE(v2) = 0;
      return v2;
    }
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForPreferenceKey:", CFSTR("DictationCommandTipsEnabled"));

    if (!v6)
      goto LABEL_6;
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldSuppressSoftwareKeyboard");

    LOBYTE(v2) = v8 ^ 1;
  }
  return v2;
}

- (void)setInputModeToNextInPreferredListWithExecutionContext:(id)a3
{
  -[_UIKeyboardStateManager setInputModeToNextInPreferredListWithExecutionContext:](self->_keyboardStateManager, "setInputModeToNextInPreferredListWithExecutionContext:", a3);
}

- (void)_updateSoundPreheating
{
  id v3;

  -[UIKeyboardImpl window](self, "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl _updateSoundPreheatingForWindow:](self, "_updateSoundPreheatingForWindow:", v3);

}

- (void)prepareLayoutForInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIKeyboardEmojiPopoverController *emojiPopoverController;
  _QWORD v11[5];

  if (self->m_isRotating)
    -[UIKeyboardImpl updateLayoutToCurrentInterfaceOrientation](self, "updateLayoutToCurrentInterfaceOrientation");
  self->m_isRotating = 1;
  -[UIKeyboardImpl hideDictationMenuIfNeeded:](self, "hideDictationMenuIfNeeded:", 0);
  -[UIKeyboardImpl updateDictationIgnoreKeyboardDidHideNotification](self, "updateDictationIgnoreKeyboardDidHideNotification");
  if (+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled")
    && (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
     || !+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")))
  {
    -[UIKeyboardImpl updateIdleDetection:](self, "updateIdleDetection:", 8);
  }
  if ((unint64_t)(a3 - 3) < 2 != (unint64_t)(-[UIKeyboardLayout orientation](self->m_layout, "orientation")- 3) < 2|| +[UIKeyboard resizable](UIKeyboard, "resizable"))
  {
    self->m_preRotateShift = -[_UIKeyboardStateManager shifted](self->_keyboardStateManager, "shifted");
    self->m_preRotateShiftLocked = -[_UIKeyboardStateManager shiftLocked](self->_keyboardStateManager, "shiftLocked");
    -[UIKeyboardImpl acceptHandwritingCandidate](self, "acceptHandwritingCandidate");
    -[UIKeyboardImpl prepareForGeometryChange](self, "prepareForGeometryChange");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIKeyboardLayout willRotate:](self->m_layout, "willRotate:", a3);
    -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKeyboardImpl candidateController](self, "candidateController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "barIsExtended"))
      {
        -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setUIKeyboardCandidateListDelegate:", 0);

        objc_msgSend(v6, "collapse");
      }

    }
    if (-[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection"))
    {
      -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "slottedCandidatesCount");

      if (v9)
        -[UIKeyboardImpl setCandidates:](self, "setCandidates:", 0);
    }
    emojiPopoverController = self->_emojiPopoverController;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__UIKeyboardImpl_prepareLayoutForInterfaceOrientation___block_invoke;
    v11[3] = &unk_1E16B3FD8;
    v11[4] = self;
    -[UIKeyboardImpl dismissKeyboardPopover:beforeCleanup:completion:](self, "dismissKeyboardPopover:beforeCleanup:completion:", emojiPopoverController, 0, v11);
    if (-[UIKeyboardImpl isDictationPopoverPresented](self, "isDictationPopoverPresented"))
      -[UIKeyboardImpl dismissDictationPopoverAndCancelDictation](self, "dismissDictationPopoverAndCancelDictation");
    if (self->m_presentingKeyboardMenuType == 2
      && !-[UIKeyboardImpl isDictationMenuPresented](self, "isDictationMenuPresented"))
    {
      self->m_presentingKeyboardMenuType = 0;
    }
    -[_UIKeyboardStateManager setKeyboardDelegateStateNeedsRefresh:](self->_keyboardStateManager, "setKeyboardDelegateStateNeedsRefresh:", 1);
  }
}

uint64_t __55__UIKeyboardImpl_prepareLayoutForInterfaceOrientation___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 600) = a2;
  return result;
}

- (void)updateLayoutToCurrentInterfaceOrientation
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout didRotate](self->m_layout, "didRotate");
  if (self->m_preRotateShiftLocked)
    -[UIKeyboardImpl setShiftLocked:](self, "setShiftLocked:", 1);
  else
    -[UIKeyboardImpl setShift:](self, "setShift:", self->m_preRotateShift);
  -[UIKeyboardImpl updateStylingTraitsIfNeeded](self, "updateStylingTraitsIfNeeded");
  self->m_isRotating = 0;
  if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
    -[UIKeyboardImpl showDictationMenuIfNeeded](self, "showDictationMenuIfNeeded");
  -[UIKeyboardImpl syncInputManagerToKeyboardState](self, "syncInputManagerToKeyboardState");
}

- (BOOL)isRotating
{
  return self->m_isRotating;
}

- (void)finishLayoutToCurrentInterfaceOrientation
{
  -[UIKeyboardImpl geometryChangeDone:](self, "geometryChangeDone:", 1);
  if (self->_emojiPopoverToRestoreAfterRotation)
  {
    if (-[UIKeyboardImpl isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"))
      -[UIKeyboardImpl presentKeyboardPopoverWithType:keyString:completion:](self, "presentKeyboardPopoverWithType:keyString:completion:", 0, 0, 0);
    self->_emojiPopoverToRestoreAfterRotation = 0;
  }
  if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
  {
    if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
    {
      -[UIKeyboardImpl presentDictationMenu](self, "presentDictationMenu");
    }
    else if (self->m_presentingKeyboardMenuType == 2)
    {
      -[UIKeyboardImpl presentKeyboardMenu:](self, "presentKeyboardMenu:", 2);
    }
  }
}

- (void)setCorrectionLearningAllowed:(BOOL)a3
{
  -[_UIKeyboardStateManager setCorrectionLearningAllowed:](self->_keyboardStateManager, "setCorrectionLearningAllowed:", a3);
}

- (void)addSupplementalLexicon:(id)a3
{
  -[_UIKeyboardStateManager addSupplementalLexicon:](self->_keyboardStateManager, "addSupplementalLexicon:", a3);
}

- (void)removeSupplementalLexicon:(id)a3
{
  -[_UIKeyboardStateManager removeSupplementalLexicon:](self->_keyboardStateManager, "removeSupplementalLexicon:", a3);
}

- (BOOL)delegateRequiresKeyEvents
{
  return -[_UIKeyboardStateManager delegateRequiresKeyEvents](self->_keyboardStateManager, "delegateRequiresKeyEvents");
}

- (void)_postInputResponderCapabilitiesChangedNotificationWithOutput:(id)a3 selectionChanged:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("UITextInputResponderCapabilitiesChangedKeyboardOutputKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("UITextInputResponderCapabilitiesChangedSelectionDidChangeKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("UITextInputResponderCapabilitiesChangedNotification"), 0, v5);

}

- (void)postInputResponderCapabilitiesChangedNotification
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSelection");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "selectedRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v7, "selectedRange");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "_isRanged"))
        v6 = objc_msgSend(v7, "isCommitting") ^ 1;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  -[UIKeyboardImpl _postInputResponderCapabilitiesChangedNotificationWithOutput:selectionChanged:](self, "_postInputResponderCapabilitiesChangedNotificationWithOutput:selectionChanged:", 0, v6);

}

- (id)asyncCapableInputDelegate
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asyncCapableInputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasAsyncCapableInputDelegate
{
  void *v2;
  char v3;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAsyncCapableInputDelegate");

  return v3;
}

- (void)dismissFloatingKeyboardFromPencilKitIfNeeded
{
  if (!-[UIKeyboardImpl _shouldSuppressSoftwareKeyboard](self, "_shouldSuppressSoftwareKeyboard"))
    +[UIAssistantBarButtonItemProvider dismissFloatingKeyboardFromPencilKitIfNeeded](UIAssistantBarButtonItemProvider, "dismissFloatingKeyboardFromPencilKitIfNeeded");
}

- (void)setDelegate:(id)a3
{
  if (self->m_initializationDone)
    -[UIKeyboardImpl setDelegate:force:](self, "setDelegate:force:", a3, 0);
}

- (void)setDelegate:(id)a3 force:(BOOL)a4
{
  -[UIKeyboardImpl setDelegate:force:delayEndInputSession:](self, "setDelegate:force:delayEndInputSession:", a3, a4, 0);
}

- (void)updateDictationButtonForDelegate:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;

  v7 = a3;
  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isFloatingAssistantView"))
    goto LABEL_4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemInputAssistantViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInputAssistantButtonItemsForResponder:", v7);
LABEL_4:

  }
}

- (id)didTeardownExistingDelegate
{
  return -[_UIKeyboardStateManager didTeardownExistingDelegate](self->_keyboardStateManager, "didTeardownExistingDelegate");
}

- (void)setDidTeardownExistingDelegate:(id)a3
{
  -[_UIKeyboardStateManager setDidTeardownExistingDelegate:](self->_keyboardStateManager, "setDidTeardownExistingDelegate:", a3);
}

- (id)willSetupNewDelegate
{
  return -[_UIKeyboardStateManager willSetupNewDelegate](self->_keyboardStateManager, "willSetupNewDelegate");
}

- (void)setWillSetupNewDelegate:(id)a3
{
  -[_UIKeyboardStateManager setWillSetupNewDelegate:](self->_keyboardStateManager, "setWillSetupNewDelegate:", a3);
}

- (BOOL)isSettingDelegate
{
  return -[_UIKeyboardStateManager isSettingDelegate](self->_keyboardStateManager, "isSettingDelegate");
}

- (void)prewarmEmojiKeyboardIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  _UIAssertion *v6;
  _UIAssertion *emojiKeyboardPrewarmingAssertion;
  id v8;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedEnabledInputModeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("emoji"));

  if (v5)
  {
    if (!self->_emojiKeyboardPrewarmingAssertion)
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "vendEmojiKeyboardPrewarmingAssertionForReason:", CFSTR("Emoji keyboard"));
      v6 = (_UIAssertion *)objc_claimAutoreleasedReturnValue();
      emojiKeyboardPrewarmingAssertion = self->_emojiKeyboardPrewarmingAssertion;
      self->_emojiKeyboardPrewarmingAssertion = v6;

    }
  }
}

- (void)releaseEmojiKeyboardPrewarmingAssertion
{
  _UIAssertion *emojiKeyboardPrewarmingAssertion;
  _UIAssertion *v4;

  emojiKeyboardPrewarmingAssertion = self->_emojiKeyboardPrewarmingAssertion;
  if (emojiKeyboardPrewarmingAssertion)
  {
    -[_UIAssertion _invalidate](emojiKeyboardPrewarmingAssertion, "_invalidate");
    v4 = self->_emojiKeyboardPrewarmingAssertion;
    self->_emojiKeyboardPrewarmingAssertion = 0;

  }
}

- (void)setRemoteDelegateSupportsImagePaste:(BOOL)a3
{
  -[_UIKeyboardStateManager setRemoteDelegateSupportsImagePaste:](self->_keyboardStateManager, "setRemoteDelegateSupportsImagePaste:", a3);
}

- (BOOL)autocorrectSpellingEnabled
{
  return -[_UIKeyboardStateManager autocorrectSpellingEnabled](self->_keyboardStateManager, "autocorrectSpellingEnabled");
}

- (void)textWillChange:(id)a3
{
  -[_UIKeyboardStateManager textWillChange:](self->_keyboardStateManager, "textWillChange:", a3);
}

- (void)textChanged:(id)a3
{
  -[_UIKeyboardStateManager textChanged:](self->_keyboardStateManager, "textChanged:", a3);
}

- (void)textSuggestionDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UIKeyboardImpl taskQueue](self, "taskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__UIKeyboardImpl_textSuggestionDidChange___block_invoke;
  v7[3] = &unk_1E16BB0D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addTask:", v7);

}

void __42__UIKeyboardImpl_textSuggestionDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "textDidChange:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

- (void)textDidChange:(id)a3
{
  -[_UIKeyboardStateManager textDidChange:](self->_keyboardStateManager, "textDidChange:", a3);
}

- (void)enable
{
  -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (void)insertCustomTextSuggestion:(id)a3
{
  -[_UIKeyboardStateManager insertCustomTextSuggestion:](self->_keyboardStateManager, "insertCustomTextSuggestion:", a3);
}

- (void)insertSticker:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    && (-[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession"),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    _UIStickerCreateTextInputPayloadFromSticker(v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "textOperations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCustomInfo:", v6);

      objc_msgSend(v5, "textOperations");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCustomInfoType:", 0x1E1750340);

      objc_msgSend(v5, "flushOperations");
    }

  }
  else
  {
    +[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "supportedPayloadIds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", CFSTR("com.apple.messages.stageSticker"));

    if ((objc_msgSend(v16, "isAnimated") & 1) != 0)
      v12 = 1;
    else
      v12 = objc_msgSend(v16, "hasLiveEffect");
    v13 = v11 & v12 ^ 1;
    if (-[UIKeyboardImpl canInsertAdaptiveImageGlyph](self, "canInsertAdaptiveImageGlyph")
      && v13
      && (_UIStickerCreateAdaptiveImageGlyphFromSticker(v16), (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v5 = (void *)v14;
      -[UIKeyboardImpl insertAdaptiveImageGlyph:](self, "insertAdaptiveImageGlyph:", v14);
    }
    else
    {
      if ((-[UIKeyboardImpl canInsertEmojiImageTextAttachment](self, "canInsertEmojiImageTextAttachment") & v13) != 1
        || (_UIStickerCreateEmojiTextAttachmentFromSticker(v16), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[UIKeyboardImpl _insertStickerAsNonTextAttachment:](self, "_insertStickerAsNonTextAttachment:", v16);
        goto LABEL_18;
      }
      v5 = (void *)v15;
      -[UIKeyboardImpl insertEmojiImageTextAttachment:](self, "insertEmojiImageTextAttachment:", v15);
    }
  }

LABEL_18:
}

- (void)_insertStickerAsNonTextAttachment:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  +[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedPayloadIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.messages.stageSticker"));

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "keyboardWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "scale");
      v12 = v11;
    }
    else
    {
      v12 = 1.0;
    }
    objc_msgSend(v18, "externalURI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "representations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bakedInRep");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _UIStickerItemProviderWithMetadata(v13, v14, v15, 1, v16, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateRespectingForwardingDelegate:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_insertItemFromProvider:completionHandler:", v8, 0);
    goto LABEL_8;
  }
  _UIStickerCreateTextInputPayloadFromSticker(v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[UITextInputPayloadController sharedInstance](UITextInputPayloadController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "payloadDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handlePayload:withPayloadId:", v7, CFSTR("com.apple.messages.stageSticker"));
LABEL_8:

  }
}

- (void)insertAdaptiveImageGlyph:(id)a3
{
  -[_UIKeyboardStateManager insertAdaptiveImageGlyph:](self->_keyboardStateManager, "insertAdaptiveImageGlyph:", a3);
}

- (void)insertEmojiImageTextAttachment:(id)a3
{
  -[_UIKeyboardStateManager insertEmojiImageTextAttachment:](self->_keyboardStateManager, "insertEmojiImageTextAttachment:", a3);
}

- (void)handleWebViewCredentialsSaveForWebsiteURL:(id)a3 user:(id)a4 password:(id)a5 passwordIsAutoGenerated:(BOOL)a6
{
  -[_UIKeyboardStateManager handleWebViewCredentialsSaveForWebsiteURL:user:password:passwordIsAutoGenerated:](self->_keyboardStateManager, "handleWebViewCredentialsSaveForWebsiteURL:user:password:passwordIsAutoGenerated:", a3, a4, a5, a6);
}

- (id)keyplaneView
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKeyboardLayout currentKeyplaneView](self->m_layout, "currentKeyplaneView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)prepareForFloatingTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (!a3 && -[UIKeyboardImpl isUsingDictationLayout](self, "isUsingDictationLayout"))
  {
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setState:", objc_msgSend(v6, "state"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIKeyboardLayout prepareForFloatingTransition:](self->m_layout, "prepareForFloatingTransition:", v3);
  if (v3)
  {
    -[UIKeyboardImpl clearLanguageIndicator](self, "clearLanguageIndicator");
  }
  else
  {
    -[UIKeyboardImpl forceShiftUpdate](self, "forceShiftUpdate");
    -[UIKeyboardImpl setCaretBlinks:](self, "setCaretBlinks:", 1);
  }
}

- (BOOL)isSyncingDictationLanguageForInputModeSwitch
{
  return -[_UIKeyboardStateManager syncingDictationLanguageForInputModeSwitch](self->_keyboardStateManager, "syncingDictationLanguageForInputModeSwitch");
}

- (void)adjustCapsLockDelayOverride
{
  -[_UIKeyboardStateManager adjustCapsLockDelayOverride](self->_keyboardStateManager, "adjustCapsLockDelayOverride");
}

- (void)removeCapsLockDelayOverride
{
  -[_UIKeyboardStateManager removeCapsLockDelayOverride](self->_keyboardStateManager, "removeCapsLockDelayOverride");
}

- (BOOL)hasCursorAssertion
{
  void *v2;
  BOOL v3;

  -[UIKeyboardImpl cursorAssertion](self, "cursorAssertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)assertCursorForForSelectionChange
{
  void *v3;
  id v4;

  -[_UIKeyboardStateManager _activeAssertionController](self->_keyboardStateManager, "_activeAssertionController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nonBlinkingAssertionWithReason:", CFSTR("UIKeyboardImpl selection change"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl setCursorAssertion:](self, "setCursorAssertion:", v3);

}

- (void)clearCursorAssertion
{
  void *v3;
  void *v4;

  -[UIKeyboardImpl cursorAssertion](self, "cursorAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardImpl cursorAssertion](self, "cursorAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[UIKeyboardImpl setCursorAssertion:](self, "setCursorAssertion:", 0);
  }
}

- (void)performKeyboardOutputAsInputViewControllerOutput:(id)a3
{
  -[_UIKeyboardStateManager performKeyboardOutputAsInputViewControllerOutput:](self->_keyboardStateManager, "performKeyboardOutputAsInputViewControllerOutput:", a3);
}

- (id)physicalKeyboardEventWithInput:(id)a3 inputFlags:(int)a4
{
  void *v5;

  +[UIPhysicalKeyboardEvent _eventWithInput:inputFlags:](UIPhysicalKeyboardEvent, "_eventWithInput:inputFlags:", a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSource:", -[_UIKeyboardStateManager textInputSource](self->_keyboardStateManager, "textInputSource"));
  return v5;
}

- (void)optOutASPInTextField
{
  void *v3;
  id v4;

  -[_UIKeyboardStateManager autofillController](self->_keyboardStateManager, "autofillController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didOptOutOfAutofillSignup");

  -[_UIKeyboardStateManager autofillController](self->_keyboardStateManager, "autofillController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optOutASPInTextField");

}

- (void)performTextOperationActionSelector:(SEL)a3
{
  -[_UIKeyboardStateManager performTextOperationActionSelector:](self->_keyboardStateManager, "performTextOperationActionSelector:", a3);
}

- (void)documentStateDidChange
{
  id v3;

  if (getAFUIPanelClass())
  {
    if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone](UIKeyboard, "useAutoFillUIRTIInterfaceForIphone"))
    {
      -[_UIKeyboardStateManager _rtiDocumentStateForAutoFillPopover](self->_keyboardStateManager, "_rtiDocumentStateForAutoFillPopover");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[AFUIPanel_Staging documentStateChanged:](self->_autoFillPanel, "documentStateChanged:", v3);

    }
  }
}

- (void)didClearText
{
  -[_UIKeyboardStateManager didClearText](self->_keyboardStateManager, "didClearText");
}

- (BOOL)callShouldInsertText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyInputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[UIKeyboardImpl callShouldInsertText:onDelegate:](self, "callShouldInsertText:onDelegate:", v4, v6);
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyInputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6 == v9 && v7;
  return v10;
}

- (BOOL)insertTextIfShould:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;

  v4 = a3;
  v5 = -[UIKeyboardImpl callShouldInsertText:](self, "callShouldInsertText:", v4);
  if (v5)
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertText:", v4);

  }
  return v5;
}

- (void)performSendAction
{
  id v2;

  +[UIPhysicalKeyboardEvent _eventWithInput:inputFlags:](UIPhysicalKeyboardEvent, "_eventWithInput:inputFlags:", CFSTR("\r"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  mach_absolute_time();
  objc_msgSend(v2, "_setHIDEvent:keyboard:", IOHIDEventCreateKeyboardEvent(), objc_msgSend((id)UIApp, "_hardwareKeyboard"));
  objc_msgSend((id)UIApp, "_handleKeyCommandForKeyboardEvent:allowsRepeat:", v2, 0);

}

- (BOOL)callShouldDeleteWithWordCountForRapidDelete:(int)a3 characterCountForRapidDelete:(int)a4
{
  return -[_UIKeyboardStateManager callShouldDeleteWithWordCountForRapidDelete:characterCountForRapidDelete:](self->_keyboardStateManager, "callShouldDeleteWithWordCountForRapidDelete:characterCountForRapidDelete:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (void)textFrameChanged:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v4 = a3;
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_textSelectingContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
    return;
  -[UIView superview](self->m_autocorrectPrompt, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView window](self->m_autocorrectPrompt, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    -[UIView window](self->m_autocorrectPrompt, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_isTextEffectsWindow");

    if ((v10 & 1) != 0)
      goto LABEL_7;
  }
  else
  {

  }
  -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_8:

    goto LABEL_9;
  }
  v13 = (void *)v12;
  -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_7:
    -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "autocorrection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl updateAutocorrectPrompt:](self, "updateAutocorrectPrompt:", v16);

    goto LABEL_8;
  }
LABEL_9:
  -[UIKeyboardImpl candidateController](self, "candidateController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "inlineCandidateView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "superview");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  v19 = v22;
  if (v22)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transformedContainerView");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v19 = v22;
    if (v22 == v21)
    {
      -[UIKeyboardImpl updateTextCandidateView](self, "updateTextCandidateView");
      v19 = v22;
    }
  }

}

- (BOOL)shouldAllowRepeatEvent:(id)a3
{
  return -[_UIKeyboardStateManager shouldAllowRepeatEvent:](self->_keyboardStateManager, "shouldAllowRepeatEvent:", a3);
}

- (id)_targetForResponderCommand:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_responderForEditing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _UIResponderTargetForAction(v5, a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_canHandleResponderCommand:(SEL)a3
{
  void *v4;

  -[UIKeyboardImpl _targetForResponderCommand:](self, "_targetForResponderCommand:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "canPerformAction:withSender:", a3, 0);

  return (char)a3;
}

- (BOOL)_cancelOperation:(BOOL)a3 testOnly:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  if (-[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented"))
  {
    -[UIKeyboardImpl dismissEmojiPopoverBeforeCleanup:](self, "dismissEmojiPopoverBeforeCleanup:", 0);
LABEL_19:
    LOBYTE(v23) = 1;
    return v23;
  }
  -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible");

    if (!-[UIKeyboardImpl liveConversionEnabled](self, "liveConversionEnabled"))
    {
      if (!v9)
      {
        -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "hasCandidates") & 1) != 0)
        {
          -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hasCandidates");

          if (v12)
          {
            -[UIKeyboardImpl keyboardState](self, "keyboardState");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "inputForMarkedText");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "length");

            if (!v15)
            {
              -[UIKeyboardImpl clearInput](self, "clearInput");
              -[UIKeyboardImpl removeAutocorrectPromptAndCandidateList](self, "removeAutocorrectPromptAndCandidateList");
              goto LABEL_19;
            }
            -[UIKeyboardImpl _markedText](self, "_markedText");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "callShouldReplaceExtendedRange:withText:includeMarkedText:", objc_msgSend(v16, "length"), &stru_1E16EDF20, 1);

            if (v18)
            {
              -[UIKeyboardImpl clearInput](self, "clearInput");
              -[UIKeyboardImpl unmarkText:](self, "unmarkText:", &stru_1E16EDF20);
              -[UIKeyboardImpl updateReturnKey](self, "updateReturnKey");
            }
            goto LABEL_15;
          }
        }
        else
        {

        }
      }
      goto LABEL_17;
    }
  }
  else if (!-[UIKeyboardImpl liveConversionEnabled](self, "liveConversionEnabled"))
  {
    goto LABEL_17;
  }
  -[UIKeyboardImpl keyboardState](self, "keyboardState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inputForMarkedText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v21)
  {
    -[UIKeyboardImpl keyboardState](self, "keyboardState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUserSelectedCurrentCandidate:", 0);

    if (a4)
      goto LABEL_19;
    -[UIKeyboardImpl taskQueue](self, "taskQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke;
    v28[3] = &unk_1E16BAF98;
    v28[4] = self;
    objc_msgSend(v16, "performSingleTask:", v28);
LABEL_15:

    goto LABEL_19;
  }
LABEL_17:
  if (-[UIKeyboardImpl hasAutocorrectPrompt](self, "hasAutocorrectPrompt"))
  {
    -[UIKeyboardImpl fadeAutocorrectPrompt](self, "fadeAutocorrectPrompt");
    goto LABEL_19;
  }
  if (a3
    || (-[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder"),
        (v25 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    LOBYTE(v23) = 0;
  }
  else
  {
    v26 = (void *)v25;
    v23 = -[UIKeyboardImpl _canHandleResponderCommand:](self, "_canHandleResponderCommand:", sel__cancelOperation_);

    if (v23 && !a4)
    {
      -[UIKeyboardImpl _targetForResponderCommand:](self, "_targetForResponderCommand:", sel__cancelOperation_);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_cancelOperation:", 0);

    }
  }
  return v23;
}

void __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (objc_class *)MEMORY[0x1E0DBDBF8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setString:", CFSTR("\x1B"));
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke_2;
  v8[3] = &unk_1E16BAF98;
  v8[4] = v6;
  objc_msgSend(v4, "childWithContinuation:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "handleKeyboardInput:executionContext:", v5, v7);
}

void __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "generateCandidates");
  if (objc_msgSend(*(id *)(a1 + 32), "delayedCandidateList"))
  {
    objc_msgSend(*(id *)(a1 + 32), "candidateController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inlineCandidateView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "removeCandidateList");
  }
  objc_msgSend(v5, "returnExecutionToParent");

}

- (BOOL)handleKeyCommand:(id)a3 repeatOkay:(BOOL *)a4 beforePublicKeyCommands:(BOOL)a5
{
  return -[_UIKeyboardStateManager handleKeyCommand:repeatOkay:beforePublicKeyCommands:](self->_keyboardStateManager, "handleKeyCommand:repeatOkay:beforePublicKeyCommands:", a3, a4, a5);
}

- (BOOL)inputModeSwitcherVisible
{
  void *v4;
  char v5;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    return self->m_inputModeSwitcherVisible;
  +[UIInputSwitcher sharedInstance](UIInputSwitcher, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isVisible");

  return v5;
}

- (void)setInputModeSwitcherVisibleInRemote:(BOOL)a3
{
  self->m_inputModeSwitcherVisible = a3;
}

- (void)handleEmojiPopoverKeyCommand
{
  -[_UIKeyboardStateManager handleEmojiPopoverKeyCommand](self->_keyboardStateManager, "handleEmojiPopoverKeyCommand");
}

- (void)dismissKeyboardFeedbackAssistantViewController
{
  void *v3;

  -[UIKeyboardImpl keyboardFeedbackAssistantViewController](self, "keyboardFeedbackAssistantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[UIKeyboardImpl setKeyboardFeedbackAssistantViewController:](self, "setKeyboardFeedbackAssistantViewController:", 0);
}

- (void)updateLayoutIfNeeded
{
  if (!self->m_layout)
    -[UIKeyboardImpl updateLayout](self, "updateLayout");
}

- (void)releaseSuppressUpdateCandidateView
{
  self->m_suppressUpdateCandidateView = 0;
}

- (void)prepareForGeometryChange
{
  -[UIKeyboardImpl setGeometryIsChanging:](self, "setGeometryIsChanging:", 1);
  -[UIKeyboardImpl updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  -[UIKeyboardImpl removeAutocorrectPrompt](self, "removeAutocorrectPrompt");
  self->m_originalOrientation = -[UIKeyboardLayout orientation](self->m_layout, "orientation");
  self->m_suppressUpdateCandidateView = 1;
  -[UIKeyboardImpl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_releaseSuppressUpdateCandidateView, 0, 0.5);
}

- (void)geometryChangeDone:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t m_originalOrientation;

  self->m_suppressUpdateCandidateView = 0;
  if (!a3)
    goto LABEL_15;
  -[UIKeyboardImpl clearLongPressTimer](self, "clearLongPressTimer");
  if (!-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_15;
  }
  -[UIKeyboardImpl updateCandidateDisplay](self, "updateCandidateDisplay");
  if (-[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible")
    && -[_UIKeyboardStateManager predictionType](self->_keyboardStateManager, "predictionType"))
  {
    -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsAutocorrection");

  }
  if (-[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection"))
  {
    -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "slottedCandidatesCount"))
    {

LABEL_11:
      -[UIKeyboardImpl generateCandidates](self, "generateCandidates");
      goto LABEL_12;
    }
    -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_11;
  }
LABEL_12:
  m_originalOrientation = self->m_originalOrientation;
  if (m_originalOrientation == -[UIKeyboardLayout orientation](self->m_layout, "orientation")
    && (unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") >= 2)
  {
    -[UIKeyboardImpl updateInputModeIndicatorOnSingleKeyOnly:](self, "updateInputModeIndicatorOnSingleKeyOnly:", 1);
  }
LABEL_15:
  -[UIKeyboardImpl setGeometryIsChanging:](self, "setGeometryIsChanging:", 0);
}

- (CGRect)subtractKeyboardFrameFromRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  void *v20;
  char v21;
  UIKeyboardImpl *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat rect1;
  double v40;
  double v41;
  CGFloat v42;
  CGFloat v43;
  CGRect v44;
  CGRect result;
  CGRect v46;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[UIKeyboardImpl window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transformedContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "convertRect:fromView:", v9, x, y, width, height);
    v14 = v13;
    v41 = v15;
    rect1 = v16;
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v43 = *MEMORY[0x1E0C9D648];
    v40 = v19;
    if (!+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
    {
      +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isUndocked");

      if ((v21 & 1) == 0)
      {
        v22 = self;
        -[UIKeyboardImpl window](v22, "window");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "window");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 != v24)
        {
          objc_msgSend(v12, "window");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "rootViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "inputViewSet");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "inputView");
          v28 = objc_claimAutoreleasedReturnValue();

          v22 = (UIKeyboardImpl *)v28;
        }
        -[UIView bounds](v22, "bounds");
        objc_msgSend(v12, "convertRect:fromView:", v22);
        v42 = v30;
        v43 = v29;
        v17 = v31;
        v18 = v32;

      }
    }
    v33 = height;
    v44.origin.x = v14;
    v44.origin.y = v41;
    v44.size.width = rect1;
    v44.size.height = v40;
    v46.size.width = v42;
    v46.origin.x = v43;
    v46.origin.y = v17;
    v46.size.height = v18;
    if (CGRectIntersectsRect(v44, v46))
    {
      v34 = v41 + v40 - v17;
      if (v34 > 0.0)
      {
        height = height - v34;
        if (v33 - v34 < 0.0)
          height = 0.0;
      }
    }

  }
  v35 = x;
  v36 = y;
  v37 = width;
  v38 = height;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (BOOL)currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:(BOOL)a3
{
  return -[_UIKeyboardStateManager currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:](self->_keyboardStateManager, "currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:", a3);
}

- (BOOL)receivedCandidatesInCurrentInputMode
{
  return -[_UIKeyboardStateManager receivedCandidatesInCurrentInputMode](self->_keyboardStateManager, "receivedCandidatesInCurrentInputMode");
}

- (void)setReceivedCandidatesInCurrentInputMode:(BOOL)a3
{
  -[_UIKeyboardStateManager setReceivedCandidatesInCurrentInputMode:](self->_keyboardStateManager, "setReceivedCandidatesInCurrentInputMode:", a3);
}

- (double)timestampOfLastTouchesEnded
{
  double result;

  -[UIKeyboardLayout timestampOfLastTouchesEnded](self->m_layout, "timestampOfLastTouchesEnded");
  return result;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  _BOOL8 v8;
  void *v10;
  int v11;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  UIKeyboardLayout *m_layout;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3;
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && !self->m_isRotating)
  {
    -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSecureTextEntry");

    if ((v14 & 1) != 0)
      goto LABEL_7;
    if (-[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection"))
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        -[UIKeyboardImpl candidateController](self, "candidateController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "activeCandidateViewType");

        if ((v16 & 2) != 0)
        {
          -[UIKeyboardImpl candidateController](self, "candidateController");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "barIsExtended");

          if ((v18 & 1) != 0)
            goto LABEL_7;
        }
      }
    }
    if (!-[UIKeyboardImpl keyboardLayoutIsInAnotherProcess](self, "keyboardLayoutIsInAnotherProcess"))
    {
      m_layout = self->m_layout;
      if (!m_layout
        || !-[UIKeyboardLayout shouldAllowSelectionGestures:atPoint:toBegin:](m_layout, "shouldAllowSelectionGestures:atPoint:toBegin:", v8, v5, x, y))
      {
LABEL_7:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isTransitioningBetweenFloatingStates") ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)setTwoFingerTapTimestamp:(double)a3
{
  -[UIKeyboardLayout setTwoFingerTapTimestamp:](self->m_layout, "setTwoFingerTapTimestamp:", a3);
}

- (void)_updateExternalDeviceInputSetting
{
  id v3;

  -[UIKeyboardImpl window](self, "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl _updateExternalDeviceInputSettingForWindow:](self, "_updateExternalDeviceInputSettingForWindow:", v3);

}

- (void)updateInputAssistantButtonItems
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemInputAssistantViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInputAssistantButtonItemsForResponder:", v4);

}

- (unint64_t)_clipCornersOfView:(id)a3
{
  id v4;
  _BOOL4 v5;
  unint64_t v6;
  _BOOL4 v7;
  double v8;
  void *v9;
  BOOL v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MaxY;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_super v35;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v4 = a3;
  v5 = -[UIKeyboardImpl splitTransitionInProgress](self, "splitTransitionInProgress");
  if (v4)
  {
    if (-[UIKeyboardImpl centerFilled](self, "centerFilled"))
    {
      v6 = 0;
      goto LABEL_20;
    }
    -[UIView bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v4, "bounds");
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v4);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    MaxY = CGRectGetMaxY(v39);
    v40.origin.x = v20;
    v40.origin.y = v22;
    v40.size.width = v24;
    v40.size.height = v26;
    if (MaxY == CGRectGetMaxY(v40))
      v28 = 12;
    else
      v28 = 0;
    if (-[UIKeyboardImpl shouldShowCandidateBar](self, "shouldShowCandidateBar"))
      v29 = v28;
    else
      v29 = v28 | 3;
    -[UIKeyboardImpl window](self, "window");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v33, "_clipCornersOfView:", v4);

        goto LABEL_19;
      }
    }
    v35.receiver = self;
    v35.super_class = (Class)UIKeyboardImpl;
    v31 = -[UIView _clipCornersOfView:](&v35, sel__clipCornersOfView_, v4);
LABEL_19:
    v6 = v31 & v29;
    goto LABEL_20;
  }
  v7 = v5;
  v36.receiver = self;
  v36.super_class = (Class)UIKeyboardImpl;
  v6 = -[UIView _clipCornersOfView:](&v36, sel__clipCornersOfView_, 0);
  if (v7)
  {
    -[UIView frame](self, "frame");
    v8 = CGRectGetMaxY(v37);
    -[UIView superview](self, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = v8 == CGRectGetMaxY(v38);

    if (v10)
      v6 |= 0xCuLL;
  }
LABEL_20:

  return v6;
}

- (void)_configureMarkedTextAttributesForConversion:(id)a3 selectedRange:(_NSRange)a4 highlightRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  length = a5.length;
  location = a5.location;
  v7 = a4.length;
  v8 = a4.location;
  v20 = a3;
  v10 = objc_msgSend(v20, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
  {
    objc_msgSend(v20, "beginEditing");
    v12 = *(_QWORD *)off_1E1679240;
    objc_msgSend(v20, "addAttribute:value:range:", *(_QWORD *)off_1E1679240, &unk_1E1A98E50, 0, v10);
    if (length)
      objc_msgSend(v20, "addAttribute:value:range:", v12, &unk_1E1A98E68, location, length);
    objc_msgSend(v11, "addObject:", v12);
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tintColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = *(_QWORD *)off_1E1679238;
      objc_msgSend(v20, "addAttribute:value:range:", *(_QWORD *)off_1E1679238, v14, 0, v10);
      objc_msgSend(v11, "addObject:", v15);
    }
    v16 = v20;
    if (v7)
    {
      v17 = objc_msgSend(v20, "length");
      v16 = v20;
      if (v8 + v7 <= v17)
      {
        objc_msgSend(v20, "addAttribute:value:range:", CFSTR("NSMarkedTextSelectionAttributeName"), MEMORY[0x1E0C9AAB0], v8, v7);
        objc_msgSend(v11, "addObject:", CFSTR("NSMarkedTextSelectionAttributeName"));
        v16 = v20;
      }
    }
    objc_msgSend(v16, "endEditing");

  }
  else
  {
    v18 = *(_QWORD *)off_1E1678C50;
    +[UIColor _markedTextBackgroundColor](UIColor, "_markedTextBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttribute:value:range:", v18, v19, 0, v10);

    objc_msgSend(v11, "addObject:", v18);
  }
  objc_msgSend(v20, "addAttribute:value:range:", 0x1E177AF00, v11, 0, v10);

}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 searchString:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 1;
  -[_UIKeyboardStateManager _setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:](self->_keyboardStateManager, "_setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:", a3, a4.location, a4.length, a5, 0, a6, v6);
}

- (void)setInlineCompletionAsMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 searchString:(id)a6
{
  -[_UIKeyboardStateManager setInlineCompletionAsMarkedText:selectedRange:inputString:searchString:](self->_keyboardStateManager, "setInlineCompletionAsMarkedText:selectedRange:inputString:searchString:", a3, a4.location, a4.length, a5, a6);
}

- (unsigned)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 lastInputString:(id)a6 searchString:(id)a7 compareAttributes:(BOOL)a8
{
  return -[_UIKeyboardStateManager _setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:](self->_keyboardStateManager, "_setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:", a3, a4.location, a4.length, a5, a6, a7);
}

- (BOOL)hasEditableMarkedText
{
  return -[_UIKeyboardStateManager hasEditableMarkedText](self->_keyboardStateManager, "hasEditableMarkedText");
}

- (BOOL)hasInlineCompletionAsMarkedText
{
  return -[_UIKeyboardStateManager hasInlineCompletionAsMarkedText](self->_keyboardStateManager, "hasInlineCompletionAsMarkedText");
}

- (id)inputForMarkedText
{
  return -[_UIKeyboardStateManager inputForMarkedText](self->_keyboardStateManager, "inputForMarkedText");
}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 completion:(id)a6
{
  -[_UIKeyboardStateManager smartSelectionForTextInDocument:inRange:options:completion:](self->_keyboardStateManager, "smartSelectionForTextInDocument:inRange:options:completion:", a3, a4.location, a4.length, a5, a6);
}

- (id)markedTextOverlay
{
  UIView *m_markedTextOverlay;
  UIView *v4;
  UIView *v5;
  UIView *v6;

  m_markedTextOverlay = self->m_markedTextOverlay;
  if (!m_markedTextOverlay)
  {
    v4 = [UIView alloc];
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->m_markedTextOverlay;
    self->m_markedTextOverlay = v5;

    m_markedTextOverlay = self->m_markedTextOverlay;
  }
  return m_markedTextOverlay;
}

- (id)searchStringForMarkedText
{
  return -[_UIKeyboardStateManager searchStringForMarkedText](self->_keyboardStateManager, "searchStringForMarkedText");
}

- (id)inputStringFromPhraseBoundary
{
  return -[_UIKeyboardStateManager inputStringFromPhraseBoundary](self->_keyboardStateManager, "inputStringFromPhraseBoundary");
}

- (BOOL)cursorIsAtEndOfMarkedText
{
  return -[_UIKeyboardStateManager cursorIsAtEndOfMarkedText](self->_keyboardStateManager, "cursorIsAtEndOfMarkedText");
}

- (void)syncDocumentStateToInputDelegate
{
  -[_UIKeyboardStateManager syncDocumentStateToInputDelegate](self->_keyboardStateManager, "syncDocumentStateToInputDelegate");
}

- (void)selectionWillChange:(id)a3
{
  -[_UIKeyboardStateManager selectionWillChange:](self->_keyboardStateManager, "selectionWillChange:", a3);
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  -[_UIKeyboardStateManager setSelectionWithPoint:](self->_keyboardStateManager, "setSelectionWithPoint:", a3.x, a3.y);
}

- (void)updateForChangedSelection
{
  -[_UIKeyboardStateManager updateForChangedSelection](self->_keyboardStateManager, "updateForChangedSelection");
}

- (void)selectionDidChange:(id)a3
{
  -[_UIKeyboardStateManager selectionDidChange:](self->_keyboardStateManager, "selectionDidChange:", a3);
}

- (void)deleteHandwritingStrokesAtIndexes:(id)a3
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIKeyboardLayout deleteHandwritingStrokesAtIndexes:](self->m_layout, "deleteHandwritingStrokesAtIndexes:", v4);

}

- (void)showSelectionCommands
{
  id v2;

  -[UIKeyboardImpl _editMenuAssistant](self, "_editMenuAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showSelectionCommands");

}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  -[_UIKeyboardStateManager acceptingCandidateWithTrigger:](self->_keyboardStateManager, "acceptingCandidateWithTrigger:", a3);
}

- (void)syncInputManagerToKeyboardState
{
  -[_UIKeyboardStateManager syncInputManagerToKeyboardState](self->_keyboardStateManager, "syncInputManagerToKeyboardState");
}

- (void)setLabel:(id)a3 forKey:(id)a4
{
  id v6;
  int v7;
  UIKeyboardLayout *m_layout;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(v9, "isEqualToString:", CFSTR("UI-Nothing"));
  m_layout = self->m_layout;
  if (v7)
    -[UIKeyboardLayout restoreDefaultsForKey:](m_layout, "restoreDefaultsForKey:", v6);
  else
    -[UIKeyboardLayout setLabel:forKey:](m_layout, "setLabel:forKey:", v9, v6);

}

- (void)handleKeyboardInput:(id)a3 executionContext:(id)a4
{
  -[_UIKeyboardStateManager handleKeyboardInput:executionContext:](self->_keyboardStateManager, "handleKeyboardInput:executionContext:", a3, a4);
}

- (void)insertDictationResult:(id)a3
{
  -[_UIKeyboardStateManager insertDictationResult:](self->_keyboardStateManager, "insertDictationResult:", a3);
}

- (void)handleRemoteIndirectGestureWithState:(id)a3
{
  -[_UIKeyboardStateManager handleRemoteIndirectGestureWithState:](self->_keyboardStateManager, "handleRemoteIndirectGestureWithState:", a3);
}

- (void)performKeyboardOutput:(id)a3
{
  -[_UIKeyboardStateManager performKeyboardOutput:](self->_keyboardStateManager, "performKeyboardOutput:", a3);
}

- (BOOL)performKeyboardEvent:(id)a3
{
  return -[_UIKeyboardStateManager performKeyboardEvent:](self->_keyboardStateManager, "performKeyboardEvent:", a3);
}

- (void)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4
{
  -[UIKeyboardImpl performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:](self, "performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:", a3, a4, 1);
}

- (BOOL)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4 forwardToRemoteInputSource:(BOOL)a5
{
  return -[_UIKeyboardStateManager performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:](self->_keyboardStateManager, "performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:", a3, a4, a5);
}

- (void)_dispatchInsertionPointExitedRangeWithSupplementalCandidate
{
  -[_UIKeyboardStateManager _dispatchInsertionPointExitedRangeWithSupplementalCandidate](self->_keyboardStateManager, "_dispatchInsertionPointExitedRangeWithSupplementalCandidate");
}

- (void)skipHitTestForTouchEvent:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardImpl skipHitTestForTouchEvents:](self, "skipHitTestForTouchEvents:", v6, v7, v8);
  }
}

- (void)skipHitTestForTouchEvents:(id)a3
{
  -[_UIKeyboardStateManager skipHitTestForTouchEvents:](self->_keyboardStateManager, "skipHitTestForTouchEvents:", a3);
}

- (void)skipHitTestForTouchEvent:(id)a3 delayed:(BOOL)a4
{
  -[_UIKeyboardStateManager skipHitTestForTouchEvent:delayed:](self->_keyboardStateManager, "skipHitTestForTouchEvent:delayed:", a3, a4);
}

- (void)performHitTestForTouchEvent:(id)a3 executionContextPassingNSNumber:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardImpl performHitTestForTouchEvents:executionContextPassingNSNumber:](self, "performHitTestForTouchEvents:executionContextPassingNSNumber:", v9, v7, v10, v11);
}

- (void)performHitTestForTouchEvents:(id)a3 executionContextPassingNSNumber:(id)a4
{
  -[_UIKeyboardStateManager performHitTestForTouchEvents:executionContextPassingNSNumber:](self->_keyboardStateManager, "performHitTestForTouchEvents:executionContextPassingNSNumber:", a3, a4);
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 executionContext:(id)a5
{
  -[_UIKeyboardStateManager adjustPhraseBoundaryInForwardDirection:granularity:executionContext:](self->_keyboardStateManager, "adjustPhraseBoundaryInForwardDirection:granularity:executionContext:", a3, *(_QWORD *)&a4, a5);
}

- (void)removeAllDynamicDictionaries
{
  -[_UIKeyboardStateManager removeAllDynamicDictionaries](self->_keyboardStateManager, "removeAllDynamicDictionaries");
}

+ (id)uniqueNumberPadInputModesFromInputModes:(id)a3 forKeyboardType:(int64_t)a4
{
  id v5;
  int v6;
  char v7;
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  int v31;
  __CFString *v32;
  BOOL v33;
  int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  int64_t v57;
  id v58;
  __CFString *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  id obj;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v6 = !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  else
    LOBYTE(v6) = 0;
  if (!objc_msgSend(v5, "count") || (a4 > 0xB || ((1 << a4) & 0x930) == 0) && (_DWORD)a4 != 127)
    goto LABEL_11;
  v7 = v6 ^ 1;
  if (a4 == 127)
    v7 = 1;
  if ((v7 & 1) == 0)
  {
LABEL_11:
    v8 = v5;
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    v68 = (void *)v12;
    objc_msgSend(v13, "setLocale:", v12);
    objc_msgSend(v13, "setNumberStyle:", 0);
    v66 = v13;
    objc_msgSend(v13, "stringFromNumber:", &unk_1E1A98E80);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isInHardwareKeyboardMode");

    if (v16)
    {
      BKSHIDServicesGetHardwareKeyboardLanguage();
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      UIKeyboardGetInputModesSupportingHardwareKeyboard();
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = &stru_1E16EDF20;
      v61 = (void *)MEMORY[0x1E0C9AA60];
    }
    v64 = (void *)v14;
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v58 = v5;
    v17 = v5;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    obj = v17;
    if (v18)
    {
      v19 = v18;
      v57 = a4;
      v62 = 0;
      v20 = 0;
      v21 = *(_QWORD *)v78;
      v22 = v61;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v78 != v21)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          if ((objc_msgSend(v24, "isExtensionInputMode", v57) & 1) != 0)
            __74__UIKeyboardImpl_uniqueNumberPadInputModesFromInputModes_forKeyboardType___block_invoke(v24);
          else
            objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v25, v68))
          {
            if (!v20)
              goto LABEL_32;
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "currentInputMode");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v24, "isEqual:", v27);

            v22 = v61;
            if (v28)
            {
LABEL_32:
              v29 = v24;

              v20 = v29;
            }
          }
          if (v16)
          {
            if (objc_msgSend(v22, "count"))
            {
              objc_msgSend(v24, "normalizedIdentifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v22, "containsObject:", v30);

              if (v31)
              {
                v32 = CFSTR("Automatic");

                v62 = v32;
              }
            }
          }

        }
        v17 = obj;
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
      }
      while (v19);

      v33 = v20 == 0;
      if (v57 == 127 && v20)
      {
        v34 = 0;
        goto LABEL_65;
      }
    }
    else
    {

      v20 = 0;
      v62 = 0;
      v33 = 1;
    }
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v35 = v17;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
    if (v36)
    {
      v37 = v36;
      v63 = 0;
      v38 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v74 != v38)
            objc_enumerationMutation(v35);
          v40 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
          if (v40 != v20)
          {
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * j), "isExtensionInputMode") & 1) != 0)
              __74__UIKeyboardImpl_uniqueNumberPadInputModesFromInputModes_forKeyboardType___block_invoke(v40);
            else
              objc_msgSend(v40, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            UIKeyboardInputModeGetNumericLocale(v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "setLocale:", v42);

            objc_msgSend(v66, "stringFromNumber:", &unk_1E1A98E80);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v43;
            if ((v33 || (objc_msgSend(v43, "isEqualToString:", v60) & 1) == 0)
              && (objc_msgSend(v64, "containsObject:", v44) & 1) == 0)
            {
              objc_msgSend(v65, "addObject:", v40);
              objc_msgSend(v64, "addObject:", v44);
              v63 = v63 & 1 | ((objc_msgSend(v40, "isExtensionInputMode") & 1) == 0);
            }

          }
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      }
      while (v37);
    }
    else
    {
      v63 = 0;
    }

    if (v33)
    {
      v20 = 0;
      v5 = v58;
      v45 = v64;
      if ((v63 & 1) != 0)
        goto LABEL_81;
      goto LABEL_68;
    }
    v34 = v63 & 1;
LABEL_65:
    if (v62)
    {
      objc_msgSend(v20, "identifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      UIKeyboardInputModeWithNewHWLayout((uint64_t)v46, v62);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v47);
      v48 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v48;
    }
    v5 = v58;
    v45 = v64;
    objc_msgSend(v65, "insertObject:atIndex:", v20, 0);
    if (((v34 | objc_msgSend(v20, "isExtensionInputMode") ^ 1) & 1) != 0)
      goto LABEL_81;
LABEL_68:
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v49 = obj;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    if (v50)
    {
      v51 = v50;
      v52 = 0;
      v53 = *(_QWORD *)v70;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v70 != v53)
            objc_enumerationMutation(v49);
          v55 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * k);
          if ((objc_msgSend(v55, "isExtensionInputMode") & 1) == 0)
          {
            objc_msgSend(v65, "addObject:", v55);
            v52 = 1;
          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      }
      while (v51);

      if ((v52 & 1) != 0)
        goto LABEL_81;
    }
    else
    {

    }
    +[UIKeyboardInputMode intlInputMode](UIKeyboardInputMode, "intlInputMode");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addObject:", v56);

LABEL_81:
    v8 = v65;

    goto LABEL_12;
  }
  objc_msgSend(v5, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isExtensionInputMode"))
  {
    +[UIKeyboardInputMode intlInputMode](UIKeyboardInputMode, "intlInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v5;
  }

LABEL_12:
  return v8;
}

id __74__UIKeyboardImpl_uniqueNumberPadInputModesFromInputModes_forKeyboardType___block_invoke(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "primaryLanguage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetDefaultInputModesForLanguage();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultEnabledInputModesForCurrentLocale:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)recomputeActiveInputModesWithExtensions:(BOOL)a3
{
  _BOOL8 v3;
  _UIKeyboardStateManager *keyboardStateManager;
  id v5;

  v3 = a3;
  keyboardStateManager = self->_keyboardStateManager;
  -[_UIKeyboardStateManager textInputTraits](keyboardStateManager, "textInputTraits");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardStateManager recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:](keyboardStateManager, "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", v3, objc_msgSend(v5, "acceptsInitialEmojiKeyboard"));

}

- (void)setRestoresToEmojiInputMode
{
  -[_UIKeyboardStateManager setRestoresToEmojiInputMode](self->_keyboardStateManager, "setRestoresToEmojiInputMode");
}

- (BOOL)editingTraitsMarkedDirty
{
  return -[_UIKeyboardStateManager editingTraitsMarkedDirty](self->_keyboardStateManager, "editingTraitsMarkedDirty");
}

- (void)setEditingTraitsMarkedDirty:(BOOL)a3
{
  -[_UIKeyboardStateManager setEditingTraitsMarkedDirty:](self->_keyboardStateManager, "setEditingTraitsMarkedDirty:", a3);
}

- (void)cutOperation
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canPerformAction:withSender:", sel_cut_, v4);

  if (v5)
  {
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cut:", v6);

  }
}

- (void)copyOperation
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canPerformAction:withSender:", sel_copy_, v4);

  if (v5)
  {
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "copy:", v6);

  }
}

- (void)pasteOperation
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "canPerformAction:withSender:", sel_paste_, v4);

  if (v5)
  {
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "paste:", v6);

  }
}

- (BOOL)canPasteImage
{
  return -[_UIKeyboardStateManager canPasteImage](self->_keyboardStateManager, "canPasteImage");
}

- (BOOL)canInsertAdaptiveImageGlyph
{
  return -[_UIKeyboardStateManager canInsertAdaptiveImageGlyph](self->_keyboardStateManager, "canInsertAdaptiveImageGlyph");
}

- (BOOL)canInsertEmojiImageTextAttachment
{
  return -[_UIKeyboardStateManager canInsertEmojiImageTextAttachment](self->_keyboardStateManager, "canInsertEmojiImageTextAttachment");
}

- (BOOL)nextInputWouldStartSentence
{
  return -[_UIKeyboardStateManager nextInputWouldStartSentence](self->_keyboardStateManager, "nextInputWouldStartSentence");
}

- (void)toggleShift
{
  -[UIKeyboardImpl setShift:autoshift:](self, "setShift:autoshift:", -[_UIKeyboardStateManager shifted](self->_keyboardStateManager, "shifted") ^ 1, 0);
}

- (void)setShiftLocked:(BOOL)a3
{
  -[_UIKeyboardStateManager setShiftLocked:](self->_keyboardStateManager, "setShiftLocked:", a3);
}

- (void)setShiftLockedForced:(BOOL)a3
{
  -[_UIKeyboardStateManager setShiftLockedForced:](self->_keyboardStateManager, "setShiftLockedForced:", a3);
}

- (void)setShiftStatesNeededInDestination:(BOOL)a3 autoShifted:(BOOL)a4 shiftLocked:(BOOL)a5
{
  -[_UIKeyboardStateManager setShiftStatesNeededInDestination:autoShifted:shiftLocked:](self->_keyboardStateManager, "setShiftStatesNeededInDestination:autoShifted:shiftLocked:", a3, a4, a5);
}

- (void)updateShiftStateAfterAsyncSelectionChange
{
  -[_UIKeyboardStateManager updateShiftStateAfterAsyncSelectionChange](self->_keyboardStateManager, "updateShiftStateAfterAsyncSelectionChange");
}

- (BOOL)shiftLockedEnabled
{
  return -[_UIKeyboardStateManager shiftLockedEnabled](self->_keyboardStateManager, "shiftLockedEnabled");
}

- (BOOL)isCapsLockASCIIToggle
{
  return -[_UIKeyboardStateManager isCapsLockASCIIToggle](self->_keyboardStateManager, "isCapsLockASCIIToggle");
}

- (BOOL)isCapsLockSwitchEnabled
{
  return -[_UIKeyboardStateManager isCapsLockSwitchEnabled](self->_keyboardStateManager, "isCapsLockSwitchEnabled");
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  return -[_UIKeyboardStateManager capsLockKeyHasLanguageSwitchLabel](self->_keyboardStateManager, "capsLockKeyHasLanguageSwitchLabel");
}

- (void)forceShiftUpdate
{
  -[_UIKeyboardStateManager forceShiftUpdate](self->_keyboardStateManager, "forceShiftUpdate");
}

- (void)forceShiftUpdateIfKeyboardStateChanged
{
  -[_UIKeyboardStateManager forceShiftUpdateIfKeyboardStateChanged](self->_keyboardStateManager, "forceShiftUpdateIfKeyboardStateChanged");
}

- (BOOL)shouldSkipCandidateSelection
{
  return -[_UIKeyboardStateManager shouldSkipCandidateSelection](self->_keyboardStateManager, "shouldSkipCandidateSelection");
}

- (void)setKeyboardState:(id)a3
{
  -[_UIKeyboardStateManager setKeyboardState:](self->_keyboardStateManager, "setKeyboardState:", a3);
}

- (void)updateShowCandidateBar
{
  -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", -[UIKeyboardImpl shouldShowCandidateBar](self, "shouldShowCandidateBar"));
}

- (BOOL)usesContinuousPathProgressiveCandidates
{
  return -[_UIKeyboardStateManager usesContinuousPathProgressiveCandidates](self->_keyboardStateManager, "usesContinuousPathProgressiveCandidates");
}

- (BOOL)continuousPathUnderway
{
  void *v2;
  char v3;

  -[UIKeyboardImpl _layout](self, "_layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveContinuousPathInput");

  return v3;
}

- (BOOL)suppliesCompletions
{
  return -[_UIKeyboardStateManager suppliesCompletions](self->_keyboardStateManager, "suppliesCompletions");
}

- (BOOL)supportsNumberKeySelection
{
  return -[_UIKeyboardStateManager supportsNumberKeySelection](self->_keyboardStateManager, "supportsNumberKeySelection");
}

- (BOOL)shouldUsePinyinStyleRowNavigation
{
  return -[_UIKeyboardStateManager shouldUsePinyinStyleRowNavigation](self->_keyboardStateManager, "shouldUsePinyinStyleRowNavigation");
}

- (void)playDeleteKeyFeedbackIfNecessaryRepeat:(BOOL)a3 rapid:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  -[_UIKeyboardStateManager autoDeleteTask](self->_keyboardStateManager, "autoDeleteTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[UIKeyboardLayout idiom](self->m_layout, "idiom") == 3)
    {
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_playSystemSound:", 1123);

    }
    else
    {
      -[UIKeyboardImpl playDeleteKeyFeedbackRepeat:rapid:](self, "playDeleteKeyFeedbackRepeat:rapid:", v5, v4);
    }
  }
}

- (void)playDeleteKeyFeedbackRepeat:(BOOL)a3 rapid:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  double MidX;
  double MidY;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  CGRect v15;
  CGRect v16;

  v4 = a4;
  v5 = a3;
  -[UIKeyboardLayout currentKeyplane](self->m_layout, "currentKeyplane");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "frame");
  MidX = CGRectGetMidX(v15);
  objc_msgSend(v14, "frame");
  MidY = CGRectGetMidY(v16);
  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSecureTextEntry");

  v12 = 4;
  if (v4)
    v12 = 5;
  if (!v5)
    v12 = 3;
  if (v11)
    v13 = 1;
  else
    v13 = v12;
  -[_UIKBFeedbackGenerating actionOccurred:atLocation:](self->m_feedbackGenerator, "actionOccurred:atLocation:", v13, MidX, MidY);

}

- (void)handleDeleteWithExecutionContext:(id)a3
{
  -[_UIKeyboardStateManager handleDeleteWithExecutionContext:](self->_keyboardStateManager, "handleDeleteWithExecutionContext:", a3);
}

- (void)completeDelete
{
  -[UIKeyboardImpl generateCandidates](self, "generateCandidates");
  -[UIKeyboardImpl updateCandidateDisplay](self, "updateCandidateDisplay");
  -[UIKeyboardImpl updateReturnKey](self, "updateReturnKey");
  -[UIKeyboardImpl updateNoContentViews](self, "updateNoContentViews");
}

- (BOOL)shouldUseAdaptiveDelete
{
  return -[_UIKeyboardStateManager shouldUseAdaptiveDelete](self->_keyboardStateManager, "shouldUseAdaptiveDelete");
}

- (void)handleDeleteWordWithExecutionContext:(id)a3
{
  -[_UIKeyboardStateManager handleDeleteWordWithExecutionContext:](self->_keyboardStateManager, "handleDeleteWordWithExecutionContext:", a3);
}

- (void)handleDelete
{
  -[_UIKeyboardStateManager handleDelete](self->_keyboardStateManager, "handleDelete");
}

- (BOOL)canHandleDelete
{
  return -[_UIKeyboardStateManager canHandleDelete](self->_keyboardStateManager, "canHandleDelete");
}

- (void)handleClearWithInsertBeforeAdvance:(id)a3
{
  -[_UIKeyboardStateManager handleClearWithInsertBeforeAdvance:](self->_keyboardStateManager, "handleClearWithInsertBeforeAdvance:", a3);
}

- (void)handleClear
{
  -[_UIKeyboardStateManager handleClear](self->_keyboardStateManager, "handleClear");
}

- (BOOL)handleTabWithShift:(BOOL)a3
{
  return -[UIKeyboardImpl handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:](self, "handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:", a3, 0, 0, 0);
}

- (BOOL)handleMoveResponderWithShift:(BOOL)a3
{
  return -[UIKeyboardImpl handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:](self, "handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:", a3, 0, 1, 0);
}

- (BOOL)handleTabWithShift:(BOOL)a3 beforePublicKeyCommands:(BOOL)a4
{
  return -[UIKeyboardImpl handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:](self, "handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:", a3, a4, 0, 0);
}

- (void)becomeFirstResponderAndMakeVisible:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (a3)
    objc_msgSend(v5, "_previousKeyResponder");
  else
    objc_msgSend(v5, "_nextKeyResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UIKeyboardImpl delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardStateManager setTraitsForPreviousDelegate:](self->_keyboardStateManager, "setTraitsForPreviousDelegate:", v8);

      objc_msgSend(v6, "_becomeFirstResponderAndMakeVisible");
      -[_UIKeyboardStateManager setTraitsForPreviousDelegate:](self->_keyboardStateManager, "setTraitsForPreviousDelegate:", 0);
    }
  }

}

- (BOOL)handleTabWithShift:(BOOL)a3 beforePublicKeyCommands:(BOOL)a4 isMoveAction:(BOOL)a5 testOnly:(BOOL)a6
{
  return -[_UIKeyboardStateManager handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:](self->_keyboardStateManager, "handleTabWithShift:beforePublicKeyCommands:isMoveAction:testOnly:", a3, a4, a5, a6);
}

- (BOOL)acceptInputString:(id)a3
{
  return -[_UIKeyboardStateManager acceptInputString:](self->_keyboardStateManager, "acceptInputString:", a3);
}

- (void)setPreviousGlobeKeyEvent:(id)a3
{
  -[_UIKeyboardStateManager setPreviousGlobeKeyEvent:](self->_keyboardStateManager, "setPreviousGlobeKeyEvent:", a3);
}

- (void)updateKeyboardStateForReplacingText:(id)a3 withText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[UIKeyboardImpl documentState](self, "documentState");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentStateAfterReplacingText:withText:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardImpl setDocumentState:](self, "setDocumentState:", v8);
}

- (void)updateKeyboardStateForInsertion:(id)a3
{
  -[_UIKeyboardStateManager updateKeyboardStateForInsertion:](self->_keyboardStateManager, "updateKeyboardStateForInsertion:", a3);
}

- (void)moveCursorByAmount:(int64_t)a3
{
  id v4;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_moveCurrentSelection:", a3);

}

- (void)deleteBackwardAndNotify:(BOOL)a3
{
  -[UIKeyboardImpl deleteBackwardAndNotifyAtEnd:deletionCount:reinsertTextInLoop:](self, "deleteBackwardAndNotifyAtEnd:deletionCount:reinsertTextInLoop:", a3, 1, 0);
}

- (void)deleteBackwardAndNotifyAtEnd:(BOOL)a3 deletionCount:(unint64_t)a4 reinsertTextInLoop:(BOOL)a5
{
  -[_UIKeyboardStateManager deleteBackwardAndNotifyAtEnd:deletionCount:reinsertTextInLoop:](self->_keyboardStateManager, "deleteBackwardAndNotifyAtEnd:deletionCount:reinsertTextInLoop:", a3, a4, a5);
}

- (void)updateKeyboardStateForDeletion
{
  -[_UIKeyboardStateManager updateKeyboardStateForDeletion](self->_keyboardStateManager, "updateKeyboardStateForDeletion");
}

- (BOOL)deleteForwardAndNotify:(BOOL)a3
{
  return -[UIKeyboardImpl deleteForwardAndNotify:producedByDeleteInput:](self, "deleteForwardAndNotify:producedByDeleteInput:", a3, 0);
}

- (BOOL)deleteForwardAndNotify:(BOOL)a3 producedByDeleteInput:(BOOL)a4
{
  return -[_UIKeyboardStateManager deleteForwardAndNotify:producedByDeleteInput:](self->_keyboardStateManager, "deleteForwardAndNotify:producedByDeleteInput:", a3, a4);
}

- (void)deleteBackward
{
  -[UIKeyboardImpl deleteBackwardAndNotify:](self, "deleteBackwardAndNotify:", 1);
}

- (BOOL)isCallingInputDelegate
{
  return -[_UIKeyboardStateManager isCallingInputDelegate](self->_keyboardStateManager, "isCallingInputDelegate");
}

- (BOOL)_handleKeyInputMethodCommandForEvent:(id)a3 canHandleAppKeyCommand:(BOOL)a4
{
  return -[_UIKeyboardStateManager _handleKeyInputMethodCommandForEvent:canHandleAppKeyCommand:](self->_keyboardStateManager, "_handleKeyInputMethodCommandForEvent:canHandleAppKeyCommand:", a3, a4);
}

- (BOOL)handleKeyInputMethodCommandForCurrentEvent
{
  return -[_UIKeyboardStateManager handleKeyInputMethodCommandForCurrentEvent](self->_keyboardStateManager, "handleKeyInputMethodCommandForCurrentEvent");
}

- (BOOL)handleKeyTextCommandForCurrentEvent
{
  return -[_UIKeyboardStateManager handleKeyTextCommandForCurrentEvent](self->_keyboardStateManager, "handleKeyTextCommandForCurrentEvent");
}

- (BOOL)handleKeyAppCommandForCurrentEvent
{
  return -[_UIKeyboardStateManager handleKeyAppCommandForCurrentEvent](self->_keyboardStateManager, "handleKeyAppCommandForCurrentEvent");
}

- (void)addInputString:(id)a3
{
  -[UIKeyboardImpl addInputString:withFlags:](self, "addInputString:withFlags:", a3, 0);
}

- (void)addInputString:(id)a3 fromVariantKey:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 2;
  else
    v4 = 0;
  -[UIKeyboardImpl addInputString:withFlags:](self, "addInputString:withFlags:", a3, v4);
}

- (void)addInputString:(id)a3 withFlags:(unint64_t)a4
{
  -[_UIKeyboardStateManager addInputString:withFlags:](self->_keyboardStateManager, "addInputString:withFlags:", a3, a4);
}

- (void)addInputString:(id)a3 withFlags:(unint64_t)a4 withInputManagerHint:(id)a5
{
  -[_UIKeyboardStateManager addInputString:withFlags:withInputManagerHint:](self->_keyboardStateManager, "addInputString:withFlags:withInputManagerHint:", a3, a4, a5);
}

- (void)_addInputString:(id)a3 withFlags:(unint64_t)a4 withInputManagerHint:(id)a5 withInputSource:(int64_t)a6
{
  -[_UIKeyboardStateManager _addInputString:withFlags:withInputManagerHint:withInputSource:](self->_keyboardStateManager, "_addInputString:withFlags:withInputManagerHint:withInputSource:", a3, a4, a5, a6);
}

- (void)syncInputManagerToAcceptedAutocorrection:(id)a3 forInput:(id)a4
{
  -[_UIKeyboardStateManager syncInputManagerToAcceptedAutocorrection:forInput:](self->_keyboardStateManager, "syncInputManagerToAcceptedAutocorrection:forInput:", a3, a4);
}

- (void)insertedEmojiFromPopover:(id)a3 selectionMethod:(id)a4
{
  -[_UIKeyboardStateManager insertedEmojiFromPopover:selectionMethod:](self->_keyboardStateManager, "insertedEmojiFromPopover:selectionMethod:", a3, a4);
}

- (void)insertedAccentVariantFromPopover:(id)a3
{
  -[_UIKeyboardStateManager insertedAccentVariantFromPopover:](self->_keyboardStateManager, "insertedAccentVariantFromPopover:", a3);
}

- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4
{
  -[_UIKeyboardStateManager emojiSearchWillInsertEmoji:forSearchQuery:](self->_keyboardStateManager, "emojiSearchWillInsertEmoji:forSearchQuery:", a3, a4);
}

- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4 selectionMethod:(id)a5 inputType:(id)a6
{
  -[_UIKeyboardStateManager emojiSearchWillInsertEmoji:forSearchQuery:selectionMethod:inputType:](self->_keyboardStateManager, "emojiSearchWillInsertEmoji:forSearchQuery:selectionMethod:inputType:", a3, a4, a5, a6);
}

- (void)updateDocumentViewsAfterKeyboardOutput:(id)a3
{
  -[_UIKeyboardStateManager updateDocumentViewsAfterKeyboardOutput:](self->_keyboardStateManager, "updateDocumentViewsAfterKeyboardOutput:", a3);
}

- (void)didChangePhraseBoundary
{
  -[_UIKeyboardStateManager didChangePhraseBoundary](self->_keyboardStateManager, "didChangePhraseBoundary");
}

- (unint64_t)phraseBoundary
{
  return -[_UIKeyboardStateManager phraseBoundary](self->_keyboardStateManager, "phraseBoundary");
}

- (void)adjustSegmentSize:(int64_t)a3
{
  -[_UIKeyboardStateManager adjustSegmentSize:](self->_keyboardStateManager, "adjustSegmentSize:", a3);
}

- (void)movePhraseBoundaryToDirection:(int64_t)a3 granularity:(int64_t)a4
{
  void *v7;
  _QWORD v8[7];

  if (-[UIKeyboardImpl hasEditableMarkedText](self, "hasEditableMarkedText"))
  {
    if (-[UIKeyboardImpl phraseBoundary](self, "phraseBoundary") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UIKeyboardImpl taskQueue](self, "taskQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __60__UIKeyboardImpl_movePhraseBoundaryToDirection_granularity___block_invoke;
      v8[3] = &unk_1E16BBA40;
      v8[4] = self;
      v8[5] = a3;
      v8[6] = a4;
      objc_msgSend(v7, "performTask:", v8);

    }
  }
}

uint64_t __60__UIKeyboardImpl_movePhraseBoundaryToDirection_granularity___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "adjustPhraseBoundaryInForwardDirection:granularity:executionContext:", *(_QWORD *)(a1 + 40) == 0, *(unsigned int *)(a1 + 48), a2);
}

- (void)updateLayoutAndSetShift
{
  -[UIKeyboardImpl updateLayout](self, "updateLayout");
  -[UIKeyboardImpl setShift:](self, "setShift:", 1);
}

- (BOOL)nextCharacterIsWordCharacter
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  int v9;

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_characterAfterCaretSelection");

  -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = (_DWORD)v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "stringEndsWord:", v8) ^ 1;

  }
  return v9;
}

- (void)collapseSelection
{
  id v2;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collapseSelectionAndAdjustByOffset:", 0);

}

- (void)completeDeleteOnceFromInputWithCharacterBefore:(unsigned int)a3
{
  -[_UIKeyboardStateManager completeDeleteOnceFromInputWithCharacterBefore:](self->_keyboardStateManager, "completeDeleteOnceFromInputWithCharacterBefore:", *(_QWORD *)&a3);
}

- (void)deleteFromInput
{
  -[_UIKeyboardStateManager deleteFromInput](self->_keyboardStateManager, "deleteFromInput");
}

- (void)_deleteFromInputWithFlags:(unint64_t)a3
{
  -[_UIKeyboardStateManager _deleteFromInputWithFlags:](self->_keyboardStateManager, "_deleteFromInputWithFlags:", a3);
}

- (void)deleteFromInputWithFlags:(unint64_t)a3
{
  -[_UIKeyboardStateManager deleteFromInputWithFlags:](self->_keyboardStateManager, "deleteFromInputWithFlags:", a3);
}

- (void)undoWithKeyboardInput:(id)a3
{
  -[_UIKeyboardStateManager undoWithKeyboardInput:](self->_keyboardStateManager, "undoWithKeyboardInput:", a3);
}

- (void)completeDeleteFromInput
{
  -[_UIKeyboardStateManager completeDeleteFromInput](self->_keyboardStateManager, "completeDeleteFromInput");
}

- (BOOL)_shouldAcceptAutocorrectionOnSelectionChange
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "requestedAutocorrection") & 1) != 0)
  {
    v4 = -[UIKeyboardImpl _hasMarkedText](self, "_hasMarkedText");
  }
  else
  {
    -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autocorrection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v4 = 1;
    else
      v4 = -[UIKeyboardImpl _hasMarkedText](self, "_hasMarkedText");

  }
  return v4;
}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3
{
  -[UIKeyboardImpl acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:](self, "acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:", a3, 0);
}

- (void)acceptInlineCompletionWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _UIKeyboardLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[UIKeyboardImpl acceptInlineCompletionWithCompletionHandler:]";
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "%s Initiating accept inline completion", buf, 0xCu);
  }

  -[UIKeyboardImpl beginAcceptingInlineCompletionByDirectTap](self, "beginAcceptingInlineCompletionByDirectTap");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__UIKeyboardImpl_acceptInlineCompletionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E16BC218;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[UIKeyboardImpl acceptAutocorrectionWithCompletionHandler:](self, "acceptAutocorrectionWithCompletionHandler:", v7);

}

uint64_t __62__UIKeyboardImpl_acceptInlineCompletionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endAcceptingInlineCompletionByDirectTap");
  _UIKeyboardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[UIKeyboardImpl acceptInlineCompletionWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Completed accept inline completion", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)beginAcceptingInlineCompletionByDirectTap
{
  id v3;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardInputDestinationEventToUIHost:", sel_beginAcceptingInlineCompletionByDirectTap);
  }
  else
  {
    -[UIKeyboardImpl inlineTextCompletionController](self, "inlineTextCompletionController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCurrentlyAcceptingInlineCompletionByDirectTap:", 1);
  }

}

- (void)endAcceptingInlineCompletionByDirectTap
{
  id v3;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardInputDestinationEventToUIHost:", sel_endAcceptingInlineCompletionByDirectTap);
  }
  else
  {
    -[UIKeyboardImpl inlineTextCompletionController](self, "inlineTextCompletionController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCurrentlyAcceptingInlineCompletionByDirectTap:", 0);
  }

}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3 requestedByRemoteInputDestination:(BOOL)a4
{
  -[_UIKeyboardStateManager acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:](self->_keyboardStateManager, "acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:", a3, a4);
}

- (void)acceptAutocorrection
{
  -[_UIKeyboardStateManager acceptAutocorrection](self->_keyboardStateManager, "acceptAutocorrection");
}

- (void)removeAutocorrection
{
  -[_UIKeyboardStateManager removeAutocorrection](self->_keyboardStateManager, "removeAutocorrection");
}

- (void)acceptPredictiveInput:(id)a3
{
  -[_UIKeyboardStateManager acceptPredictiveInput:](self->_keyboardStateManager, "acceptPredictiveInput:", a3);
}

- (void)rejectAutocorrection:(id)a3
{
  -[_UIKeyboardStateManager rejectAutocorrection:](self->_keyboardStateManager, "rejectAutocorrection:", a3);
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  void *v2;
  char v3;

  -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "insertsSpaceAfterPredictiveInput");

  return v3;
}

- (void)textAccepted:(id)a3
{
  -[_UIKeyboardStateManager textAccepted:](self->_keyboardStateManager, "textAccepted:", a3);
}

- (void)acceptPredictiveInput:(id)a3 appendSeparator:(BOOL)a4 executionContext:(id)a5
{
  -[_UIKeyboardStateManager acceptPredictiveInput:appendSeparator:executionContext:](self->_keyboardStateManager, "acceptPredictiveInput:appendSeparator:executionContext:", a3, a4, a5);
}

- (void)acceptCandidate:(id)a3
{
  -[_UIKeyboardStateManager acceptCandidate:](self->_keyboardStateManager, "acceptCandidate:", a3);
}

- (void)acceptHandwritingCandidate
{
  id v3;

  if (-[UIKeyboardLayout isHandwritingPlane](self->m_layout, "isHandwritingPlane"))
    v3 = -[UIKeyboardImpl acceptCurrentCandidate](self, "acceptCurrentCandidate");
}

- (id)acceptCurrentCandidate
{
  return -[_UIKeyboardStateManager acceptCurrentCandidate](self->_keyboardStateManager, "acceptCurrentCandidate");
}

- (id)acceptInlineCandidate
{
  return -[_UIKeyboardStateManager acceptInlineCandidate](self->_keyboardStateManager, "acceptInlineCandidate");
}

- (void)acceptFirstCandidate
{
  -[_UIKeyboardStateManager acceptFirstCandidate](self->_keyboardStateManager, "acceptFirstCandidate");
}

- (void)showNextCandidates
{
  id v2;

  -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showCandidateInForwardDirection:granularity:", 1, 0);

}

- (void)showPreviousCandidate
{
  id v2;

  -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showCandidateInForwardDirection:granularity:", 0, 0);

}

- (void)showNextPage
{
  id v2;

  -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showCandidateInForwardDirection:granularity:", 1, 2);

}

- (void)jumpToCompositions
{
  void *v3;
  char v4;
  id v5;

  -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "jumpToCompositions");

  }
}

- (void)revealHiddenCandidates
{
  void *v3;
  char v4;
  id v5;

  -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "revealHiddenCandidates");

  }
}

- (void)candidateListAcceptCandidate:(id)a3
{
  -[_UIKeyboardStateManager candidateListAcceptCandidate:](self->_keyboardStateManager, "candidateListAcceptCandidate:", a3);
}

- (void)candidateListSelectionDidChange:(id)a3
{
  -[_UIKeyboardStateManager candidateListSelectionDidChange:](self->_keyboardStateManager, "candidateListSelectionDidChange:", a3);
}

- (void)candidateListInvalidateSelection:(id)a3
{
  -[_UIKeyboardStateManager candidateListInvalidateSelection:](self->_keyboardStateManager, "candidateListInvalidateSelection:", a3);
}

- (id)candidateList
{
  return -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
}

- (void)clearRecentInput
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0DBDCB8];
  -[UIKeyboardImpl keyboardState](self, "keyboardState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recentInputIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearRecentInputForIdentifier:", v4);

}

- (void)removeRecentInput:(id)a3 completionHandler:(id)a4
{
  -[_UIKeyboardStateManager removeRecentInput:completionHandler:](self->_keyboardStateManager, "removeRecentInput:completionHandler:", a3, a4);
}

- (void)acceptRecentInput:(id)a3
{
  -[_UIKeyboardStateManager acceptRecentInput:](self->_keyboardStateManager, "acceptRecentInput:", a3);
}

- (void)addInputObject:(id)a3
{
  -[_UIKeyboardStateManager addInputObject:](self->_keyboardStateManager, "addInputObject:", a3);
}

- (void)clearAnimations
{
  void *v3;

  -[UIView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[UIKeyboardLayout deactivateActiveKeys](self->m_layout, "deactivateActiveKeys");
}

- (void)clearDelegate
{
  -[_UIKeyboardStateManager clearDelegate](self->_keyboardStateManager, "clearDelegate");
}

- (void)deferReplaceTextActionToSystem:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKeyboardImpl.m"), 7405, CFSTR("Expected argument to be of class UITextReplacement"));

  }
  -[UIKeyboardImpl replaceText:](self, "replaceText:", v6);

}

- (void)replaceText:(id)a3
{
  -[_UIKeyboardStateManager replaceText:](self->_keyboardStateManager, "replaceText:", a3);
}

- (void)replaceRange:(id)a3 oldText:(id)a4 withText:(id)a5
{
  -[_UIKeyboardStateManager replaceRange:oldText:withText:](self->_keyboardStateManager, "replaceRange:oldText:withText:", a3, a4, a5);
}

- (void)scheduleReplacementsWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactionAssistant");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v11;
  if (v11)
  {
    objc_msgSend(v11, "scheduleReplacementsWithOptions:", a3);
LABEL_5:
    v6 = v11;
    goto LABEL_6;
  }
  if ((a3 & 0x20) != 0)
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedTextRange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showAutocorrectReplacementChoicesIfNeeded:forRange:", v8, v10);

    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4
{
  return -[UIKeyboardImpl acceptWord:firstDelete:forInput:](self, "acceptWord:firstDelete:forInput:", a3, a4, 0);
}

- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4 forInput:(id)a5
{
  return -[_UIKeyboardStateManager acceptWord:firstDelete:forInput:](self->_keyboardStateManager, "acceptWord:firstDelete:forInput:", a3, a4, a5);
}

- (void)processPayloadInfo:(id)a3
{
  -[_UIKeyboardStateManager processPayloadInfo:](self->_keyboardStateManager, "processPayloadInfo:", a3);
}

- (void)setCandidateList:(id)a3
{
  -[_UIKeyboardStateManager setCandidateList:](self->_keyboardStateManager, "setCandidateList:", a3);
}

- (BOOL)displaysCandidates
{
  return -[_UIKeyboardStateManager displaysCandidates](self->_keyboardStateManager, "displaysCandidates");
}

- (void)_conditionallyNotifyPredictionsAreAvailableForCandidates:(id)a3 containingProactiveTriggers:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  _BOOL4 v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "isResponseKitCandidate", (_QWORD)v17))
        {
          objc_msgSend(v12, "responseKitCategory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(&unk_1E1A94208, "containsObject:", v13);

          if ((v14 & 1) == 0)
          {

            v4 = 1;
            goto LABEL_15;
          }
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }

    if ((v9 & 1) != 0)
      v4 = 0;
  }
  else
  {

  }
LABEL_15:
  v15 = -[UIKeyboardImpl predictionFromPreference](self, "predictionFromPreference", (_QWORD)v17);
  if (v15)
    v15 = -[UIKeyboardImpl continuousPathUnderway](self, "continuousPathUnderway");
  if (v15 || v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("UIKeyboardPredictionsAvailable"), 0);

  }
}

- (void)setCandidateDisplayIsExtended:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIKeyboardImpl candidateController](self, "candidateController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsExtended:", v3);

}

- (unsigned)assertIntermediateText:(id)a3
{
  return -[_UIKeyboardStateManager assertIntermediateText:](self->_keyboardStateManager, "assertIntermediateText:", a3);
}

- (BOOL)presentTextCompletionAsMarkedText:(id)a3
{
  return -[_UIKeyboardStateManager presentTextCompletionAsMarkedText:](self->_keyboardStateManager, "presentTextCompletionAsMarkedText:", a3);
}

void __40__UIKeyboardImpl_updateCandidateDisplay__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "updateTextCandidateView");
  objc_msgSend(v3, "returnExecutionToParent");

}

- (BOOL)canUseCandidateBarAsSupplementToInlineView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  char v12;

  -[UIView _rootInputWindowController](self, "_rootInputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualModeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "useVisualModeWindowed"))
  {
    objc_msgSend(v5, "visualModeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "windowingModeEnabled"))
      v8 = objc_msgSend(v4, "isFloatingAssistantView");
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (!objc_msgSend((id)objc_opt_class(), "isFloating")
     || objc_msgSend(v4, "isFloatingAssistantView")))
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "autocorrectionType") == 1)
      v10 = 1;
    else
      v10 = v8;
    if (v10 == 1)
    {
      -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasAutofillCandidates");

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setShowsCandidateInline:(BOOL)a3
{
  void *v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;

  if (-[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible")
    || (-[UIKeyboardImpl textInputTraits](self, "textInputTraits"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isSecureTextEntry"),
        v5,
        v6))
  {
    self->m_showsCandidateInline = 0;
LABEL_4:
    -[UIKeyboardImpl removeAutocorrectPromptAndCandidateList](self, "removeAutocorrectPromptAndCandidateList");
    goto LABEL_5;
  }
  self->m_showsCandidateInline = a3;
  if (!a3)
    goto LABEL_4;
LABEL_5:
  v7 = (unint64_t)(-[UIKeyboardLayout orientation](self->m_layout, "orientation") - 3) < 2;
  v8 = (unint64_t)(-[UIView _keyboardOrientation](self, "_keyboardOrientation") - 3) < 2;
  if (self->m_layout)
  {
    if (((v7 ^ v8) & 1) == 0)
    {
      -[UIKeyboardImpl prepareForGeometryChange](self, "prepareForGeometryChange");
      -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", -[UIKeyboardImpl shouldShowCandidateBar](self, "shouldShowCandidateBar"));
      -[_UIKeyboardStateManager _setCandidateList:](self->_keyboardStateManager, "_setCandidateList:", 0);
      -[UIKeyboardImpl geometryChangeDone:](self, "geometryChangeDone:", 1);
    }
  }
}

- (void)candidateBarDidExtendWithGesture
{
  -[_UIKeyboardStateManager candidateBarDidExtendWithGesture](self->_keyboardStateManager, "candidateBarDidExtendWithGesture");
}

- (BOOL)maximizing
{
  return self->m_maximizing;
}

- (void)layoutDidResize
{
  -[_UIKeyboardStateManager layoutDidResize](self->_keyboardStateManager, "layoutDidResize");
}

- (void)responseContextDidChange
{
  -[_UIKeyboardStateManager responseContextDidChange](self->_keyboardStateManager, "responseContextDidChange");
}

- (id)_supplementalCandidateIcon:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "ui_supplementalItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "icon");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "supplementalLexiconAmbiguousItemIcon");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("questionmark.circle"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "supplementalLexiconAmbiguousItemIcon");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;

  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

- (void)setAutocorrectionList:(id)a3
{
  -[_UIKeyboardStateManager setAutocorrectionList:](self->_keyboardStateManager, "setAutocorrectionList:", a3);
}

- (id)autocorrectPrompt
{
  return self->m_autocorrectPrompt;
}

- (void)removeInlineTextCompletionPrompt
{
  -[_UIKeyboardStateManager removeInlineTextCompletionPrompt](self->_keyboardStateManager, "removeInlineTextCompletionPrompt");
}

- (void)removeTextChoicePromptWithUnderline
{
  void *v3;
  void *v4;
  id v5;

  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeActivePromptAndUnderline");

    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedTextRange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl removeTextChoiceUnderlinesInRange:](self, "removeTextChoiceUnderlinesInRange:", v4);

  }
}

- (void)removeTextChoicePromptAndAutocorrection
{
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    -[UIKeyboardImpl removeTextChoicePrompt](self, "removeTextChoicePrompt");
  }
  else
  {
    -[UIKeyboardImpl removeAutocorrection](self, "removeAutocorrection");
  }
}

- (void)removeTextChoiceUnderlinesInRange:(id)a3
{
  _BOOL4 v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled");
  v5 = v10;
  if (v10 && v4)
  {
    v6 = objc_msgSend(v10, "isEmpty");
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v10, "start");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clearUnderlineForPosition:", v9);

    }
    else
    {
      objc_msgSend(v7, "removeAllUnderlines");
    }

    v5 = v10;
  }

}

- (void)dismissTextChoicePrompt
{
  -[_UIKeyboardStateManager dismissTextChoicePrompt](self->_keyboardStateManager, "dismissTextChoicePrompt");
}

- (void)presentTextChoicePromptForRange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardInputDestinationEventToUIHost:", sel_presentTextChoicePromptForRange_);
  }
  else
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentIfNeededForRange:", v5);
  }

}

- (int)returnKeyState
{
  return self->m_returnKeyState;
}

- (void)_handleKeyBehavior:(unint64_t)a3 forKeyType:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;
  __CFString **v12;
  UIKeyboardLayout *m_layout;
  char *v14;
  UIKeyboardLayout *v15;
  __CFString **v16;
  UIKeyboardLayout *v17;
  __CFString **v18;
  UIKeyboardLayout *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  __CFString **v28;
  id v29;

  v6 = a4;
  v7 = v6;
  v29 = v6;
  if (a3 == 1)
  {
    -[UIKeyboardLayout restoreDefaultsForKey:](self->m_layout, "restoreDefaultsForKey:", v6);
    -[UIKeyboardLayout setTarget:forKey:](self->m_layout, "setTarget:forKey:", self, v29);
    -[UIKeyboardLayout setAction:forKey:](self->m_layout, "setAction:forKey:", sel__nop, v29);
  }
  else if (a3)
  {
    v8 = (objc_class *)a3;
    if (a3 == 8)
    {
      v9 = objc_msgSend(v6, "isEqualToString:", CFSTR("_keyid_space_"));
      v7 = v29;
      v10 = 52;
      if (v9)
        v10 = 51;
      v8 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIKeyboardImpl__id[v10]);
    }
    -[UIKeyboardLayout setTarget:forKey:](self->m_layout, "setTarget:forKey:", self, v7);
    -[UIKeyboardLayout setLongPressAction:forKey:](self->m_layout, "setLongPressAction:forKey:", 0, v29);
    switch((unint64_t)v8)
    {
      case 2uLL:
        v11 = -[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection");
        v12 = UIKeyboardStringConfirmCandidate;
        if (!v11)
          v12 = UIKeyboardStringConfirm;
        -[UIKeyboardLayout setLabel:forKey:](self->m_layout, "setLabel:forKey:", *v12, v29);
        m_layout = self->m_layout;
        v14 = sel_performKeyBehaviorConfirm;
        goto LABEL_25;
      case 3uLL:
        v17 = self->m_layout;
        v18 = UIKeyboardStringSelectFirstCandidate;
        goto LABEL_17;
      case 4uLL:
        v17 = self->m_layout;
        v18 = UIKeyboardStringSelectNextCandidate;
LABEL_17:
        -[UIKeyboardLayout setLabel:forKey:](v17, "setLabel:forKey:", *v18, v29);
        m_layout = self->m_layout;
        v14 = sel_showNextCandidates;
        goto LABEL_25;
      case 5uLL:
        -[UIKeyboardLayout setLabel:forKey:](self->m_layout, "setLabel:forKey:", CFSTR("UI-Confirm-Candidate"), v29);
        m_layout = self->m_layout;
        v14 = sel_performKeyBehaviorConfirmFirstCandidate;
        goto LABEL_25;
      case 6uLL:
        -[UIKeyboardLayout setLabel:forKey:](self->m_layout, "setLabel:forKey:", CFSTR("UI-NextPage"), v29);
        -[UIKeyboardLayout setAction:forKey:](self->m_layout, "setAction:forKey:", sel_showNextPage, v29);
        -[UIKeyboardLayout setLongPressAction:forKey:](self->m_layout, "setLongPressAction:forKey:", sel_jumpToCompositions, CFSTR("_keyid_space_"));
        break;
      case 7uLL:
        v15 = self->m_layout;
        v16 = UIKeyboardStringSpace;
        goto LABEL_21;
      case 8uLL:
        break;
      case 9uLL:
        v19 = self->m_layout;
        -[UIKeyboardImpl returnKeyDisplayName](self, "returnKeyDisplayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardLayout setLabel:forKey:](v19, "setLabel:forKey:", v20, v29);

        goto LABEL_23;
      case 0xAuLL:
        -[UIKeyboardLayout setLabel:forKey:](self->m_layout, "setLabel:forKey:", CFSTR("UI-Confirm"), v29);
        m_layout = self->m_layout;
        v14 = sel_performKeyBehaviorCommitInline;
        goto LABEL_25;
      case 0xBuLL:
        v22 = CFSTR("UI-Space");
        -[UIKeyboardImpl keyboardState](self, "keyboardState");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "layoutState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v24, "isAlphabeticPlane"))
          goto LABEL_40;
        -[UIKeyboardImpl keyboardState](self, "keyboardState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "shiftState");

        if (v26 == 1)
        {
          -[UIKeyboardImpl keyboardState](self, "keyboardState");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v23, "shouldOutputFullwidthSpace");
          v28 = UIKeyboardStringHalfwidthSpace;
          if (!v27)
            v28 = UIKeyboardStringFullwidthSpace;
          v24 = v22;
          v22 = *v28;
LABEL_40:

        }
        -[UIKeyboardLayout setLabel:forKey:](self->m_layout, "setLabel:forKey:", v22, v29);
        -[UIKeyboardLayout setAction:forKey:](self->m_layout, "setAction:forKey:", 0, v29);

        break;
      default:
        if (v8 != (objc_class *)100)
          break;
        v15 = self->m_layout;
        v16 = UIKeyboardStringZhuyinFirstTone;
LABEL_21:
        -[UIKeyboardLayout setLabel:forKey:](v15, "setLabel:forKey:", *v16, v29);
LABEL_23:
        m_layout = self->m_layout;
        v14 = 0;
LABEL_25:
        -[UIKeyboardLayout setAction:forKey:](m_layout, "setAction:forKey:", v14, v29);
        break;
    }
    if (a3 == 8)
    {
      -[UIKeyboardLayout setAction:forKey:](self->m_layout, "setAction:forKey:", sel__nop, v29);
    }
    else
    {
      if (objc_msgSend(v29, "isEqualToString:", CFSTR("_keyid_space_")))
        v21 = 488;
      else
        v21 = 496;
      *(Class *)((char *)&self->super.super.super.isa + v21) = v8;
    }
    if (objc_msgSend(v29, "isEqualToString:", CFSTR("_keyid_return_")))
      -[UIKeyboardImpl updateReturnKey:](self, "updateReturnKey:", 0);
  }
  else
  {
    -[UIKeyboardLayout restoreDefaultsForKey:](self->m_layout, "restoreDefaultsForKey:", v6);
  }

}

- (void)performKeyBehaviorConfirm
{
  -[_UIKeyboardStateManager performKeyBehaviorConfirm](self->_keyboardStateManager, "performKeyBehaviorConfirm");
}

- (void)performKeyBehaviorConfirmFirstCandidate
{
  -[_UIKeyboardStateManager performKeyBehaviorConfirmFirstCandidate](self->_keyboardStateManager, "performKeyBehaviorConfirmFirstCandidate");
}

- (void)performKeyBehaviorCommitInline
{
  -[_UIKeyboardStateManager performKeyBehaviorCommitInline](self->_keyboardStateManager, "performKeyBehaviorCommitInline");
}

- (BOOL)returnKeyEnabledInLayout
{
  return self->m_returnKeyEnabledInLayout;
}

- (void)callLayoutUpdateAllLocalizedKeys
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout updateLocalizedKeys:](self->m_layout, "updateLocalizedKeys:", 1);
}

- (void)callLayoutUpdateRecentInputs
{
  UILexicon *m_recentInputs;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILexicon *v11;
  UILexicon *v12;

  m_recentInputs = self->m_recentInputs;
  if (m_recentInputs)
  {
    self->m_recentInputs = 0;

  }
  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSecureTextEntry");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0DBDCB8];
    -[UIKeyboardImpl keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recentInputIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recentInputForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[UILexicon _lexiconWithTILexicon:](UILexicon, "_lexiconWithTILexicon:", v10);
    v11 = (UILexicon *)objc_claimAutoreleasedReturnValue();
    v12 = self->m_recentInputs;
    self->m_recentInputs = v11;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout setRecentInputs:](self->m_layout, "setRecentInputs:", self->m_recentInputs);
}

- (id)inlineCandidateView
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl candidateController](self, "candidateController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inlineCandidateView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)promptTypeForInputString:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  int v9;

  v4 = a3;
  -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsSetPhraseBoundary");

  if ((v6 & 1) != 0)
  {
    v7 = 6;
  }
  else
  {
    v7 = 5;
    if (!objc_msgSend(v4, "length"))
    {
      -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "suppressCompletionsForFieldEditor");

      if (v9)
        v7 = 7;
      else
        v7 = 5;
    }
  }

  return v7;
}

- (void)beginObservingInputOverlayContainerFrame
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id obj;

  -[UIKeyboardImpl inputOverlayContainerForCandidateView:](self, "inputOverlayContainerForCandidateView:", 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

  v4 = obj;
  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
      objc_msgSend(v6, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
      objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), v8);

    }
    v9 = objc_storeWeak((id *)&self->_overlayContainerObserved, obj);
    objc_msgSend(obj, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 0, v11);

    v4 = obj;
  }

}

- (void)endObservingInputOverlayContainerFrame
{
  UIView **p_overlayContainerObserved;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;

  p_overlayContainerObserved = &self->_overlayContainerObserved;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), v7);

    -[UIKeyboardImpl updateInputOverlayForContainerFrameChange](self, "updateInputOverlayForContainerFrameChange");
    objc_storeWeak((id *)p_overlayContainerObserved, 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  UIView **p_overlayContainerObserved;
  id WeakRetained;
  void *v10;
  id v11;

  p_overlayContainerObserved = &self->_overlayContainerObserved;
  WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    v11 = objc_loadWeakRetained((id *)p_overlayContainerObserved);

    if (v11 == a6)
      -[UIKeyboardImpl updateInputOverlayForContainerFrameChange](self, "updateInputOverlayForContainerFrameChange");
  }
}

- (CGRect)convertRectToAutocorrectRect:(CGRect)a3 delegateView:(id)a4 container:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect result;
  CGRect v66;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11 != v10)
  {
    objc_msgSend(v11, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v10, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v12, "window");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15 != v16;

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

    objc_msgSend(v12, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "_shouldTextEffectsWindowBeHostedForView:", v10);

    if ((v19 & 1) == 0 && !v17)
    {
      objc_msgSend(v12, "convertRect:fromView:", v10, x, y, width, height);
      v59 = CGRectIntegral(v58);
LABEL_11:
      x = v59.origin.x;
      y = v59.origin.y;
      width = v59.size.width;
      height = v59.size.height;
      goto LABEL_16;
    }
    objc_msgSend(v12, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convertRect:fromView:", v10, x, y, width, height);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    objc_msgSend(v12, "window");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "convertRect:toView:", v12, v22, v24, v26, v28);
    x = v30;
    y = v31;
    width = v32;
    height = v33;

    objc_msgSend(v12, "window");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "windowLevel");
    v36 = v35;
    objc_msgSend(v10, "window");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "windowLevel");
    v39 = v38;

    if (v36 < v39)
    {
      objc_msgSend(v10, "_rootInputWindowController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "visibleFrame");
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      v60.origin.x = x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      v66.origin.x = v42;
      v66.origin.y = v44;
      v66.size.width = v46;
      v66.size.height = v48;
      v61 = CGRectIntersection(v60, v66);
      v49 = v61.origin.x;
      v50 = v61.origin.y;
      v51 = v61.size.width;
      v52 = v61.size.height;
      if (!CGRectIsNull(v61))
      {
        v62.origin.x = v49;
        v62.origin.y = v50;
        v62.size.width = v51;
        v62.size.height = v52;
        if (CGRectGetHeight(v62) > 0.0)
        {
          v63.origin.x = v49;
          v63.origin.y = v50;
          v63.size.width = v51;
          v63.size.height = v52;
          v53 = -CGRectGetHeight(v63);
          v64.origin.x = x;
          v64.origin.y = y;
          v64.size.width = width;
          v64.size.height = height;
          v59 = CGRectOffset(v64, 0.0, v53);
          goto LABEL_11;
        }
      }
    }
  }
LABEL_16:

  v54 = x;
  v55 = y;
  v56 = width;
  v57 = height;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (void)sendCallbacksForPreCorrectionsDisplay
{
  void *v3;
  char v4;
  id v5;

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_willShowCorrections");

  }
}

- (void)sendCallbacksForPostCorrectionsRemoval
{
  void *v3;
  char v4;
  id v5;

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didHideCorrections");

  }
}

- (id)_rangeForAutocorrectionText:(id)a3
{
  return -[_UIKeyboardStateManager _rangeForAutocorrectionText:](self->_keyboardStateManager, "_rangeForAutocorrectionText:", a3);
}

- (id)autocorrectPromptRectsFromFirstDelegateRect:(CGRect)a3 lastDelegateRect:(CGRect)a4
{
  return -[_UIKeyboardStateManager autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:](self->_keyboardStateManager, "autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)updateAutocorrectPrompt:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[UIKeyboardImpl taskQueue](self, "taskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__UIKeyboardImpl_updateAutocorrectPrompt___block_invoke;
  v7[3] = &unk_1E16BB0D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performSingleTask:", v7);

}

uint64_t __42__UIKeyboardImpl_updateAutocorrectPrompt___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateAutocorrectPrompt:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t v22;
  id v23;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_2;
  aBlock[3] = &unk_1E16D6770;
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v21 = v5;
  v22 = v6;
  v23 = v7;
  v8 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "asyncInputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_4;
    v18[3] = &unk_1E16BB9F0;
    v13 = &v19;
    v19 = v8;
    objc_msgSend(v11, "requestTextRectsForString:withCompletionHandler:", v12, v18);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "webInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "asyncWebKitInteractionDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "asyncWebKitInteractionDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 48);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_5;
  v16[3] = &unk_1E16BBA18;
  v13 = &v17;
  v17 = v8;
  objc_msgSend(v11, "requestAutocorrectionRectsForString:withCompletionHandler:", v15, v16);
LABEL_5:

LABEL_6:
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  void *v9;
  _QWORD v10[5];
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_3;
  v10[3] = &unk_1E16BB9A0;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v9 = *(void **)(a1 + 32);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v9, "transferExecutionToMainThreadWithTask:", v10);

}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v7;
  uint64_t v8;
  id v9;
  CGRect v10;

  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 72);
  v7 = a2;
  v10.origin.x = v3;
  v10.origin.y = v4;
  v10.size.width = v5;
  v10.size.height = v6;
  if (CGRectIsEmpty(v10) && CGRectIsEmpty(*(CGRect *)(a1 + 80)))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v8;
  objc_msgSend(*(id *)(a1 + 32), "updateAutocorrectPrompt:correctionRects:", *(_QWORD *)(a1 + 40), v8);
  objc_msgSend(v7, "returnExecutionToParent");

}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "firstObject");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "rect");
  (*(void (**)(uint64_t, double, double, double, double, double, double, double, double))(v2 + 16))(v2, v5, v7, v9, v11, v13, v14, v15, v16);

}

uint64_t __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
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
  double v16;
  double v17;
  double v18;
  double v19;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "firstRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "lastRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  return (*(uint64_t (**)(uint64_t, double, double, double, double, double, double, double, double))(v2 + 16))(v2, v5, v7, v9, v11, v13, v15, v17, v19);
}

- (id)autocorrectPromptRectsForInput:(id)a3
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  -[UIKeyboardImpl _rangeForAutocorrectionText:](self, "_rangeForAutocorrectionText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstRectForRange:", v5);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_lastRectForRange:", v5);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[UIKeyboardImpl autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:](self, "autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:", v9, v11, v13, v15, v18, v20, v22, v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setNeedsAutocorrectionRectsUpdate
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateActiveAutocorrectionRects, 0);
  -[UIKeyboardImpl performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateActiveAutocorrectionRects, 0, 0.0);
}

- (void)updateActiveAutocorrectionRects
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "autocorrectInlinePromptIsVisible"))
    {
      -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "hasAutocorrection");

      if (!v4)
        return;
      -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "autocorrection");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "input");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardImpl autocorrectPromptRectsForInput:](self, "autocorrectPromptRectsForInput:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "count"))
      {
        -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "candidate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateActivePromptForCandidate:displayRects:highlightOnly:", v9, v7, 1);

      }
    }

  }
}

- (void)updateAutocorrectPrompt:(id)a3 correctionRects:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  CGRect v29;

  v28 = a3;
  v6 = a4;
  objc_msgSend(v28, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    v29.origin.x = v11;
    v29.origin.y = v13;
    v29.size.width = v15;
    v29.size.height = v17;
    if (!CGRectIsEmpty(v29))
    {
      -[UIKeyboardImpl inputOverlayContainer](self, "inputOverlayContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && -[UIKeyboardImpl delegateSupportsCorrectionUI](self, "delegateSupportsCorrectionUI"))
      {
        -[UIKeyboardImpl updateKeyboardConfigurations](self, "updateKeyboardConfigurations");
        -[UIKeyboardImpl inlineTextCompletionController](self, "inlineTextCompletionController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hasPrompt");

        if (!v20)
        {
          if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
          {
            if (-[UIKeyboardImpl isMinimized](self, "isMinimized"))
            {
              +[UIDevice currentDevice](UIDevice, "currentDevice");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v21, "userInterfaceIdiom"))
                v22 = -[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible")
                   || -[UIKeyboardImpl accessibilityUsesExtendedKeyboardPredictionsEnabled](self, "accessibilityUsesExtendedKeyboardPredictionsEnabled");
              else
                v22 = 0;

            }
            else
            {
              v22 = -[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible")
                 || -[UIKeyboardImpl accessibilityUsesExtendedKeyboardPredictionsEnabled](self, "accessibilityUsesExtendedKeyboardPredictionsEnabled");
            }
            -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "candidate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "updateActivePromptForCandidate:displayRects:highlightOnly:", v25, v6, v22);

          }
          else
          {
            -[UIKeyboardImpl updateLegacyAutocorrectPromptWithAutocorrection:parentView:correctionRects:](self, "updateLegacyAutocorrectPromptWithAutocorrection:parentView:correctionRects:", v28, v18, v6);
          }
          if (objc_msgSend(v7, "length"))
          {
            -[UIKeyboardImpl sendCallbacksForPreCorrectionsDisplay](self, "sendCallbacksForPreCorrectionsDisplay");
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("correction"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardCandidateCorrectionDidChangeNotification"), 0, v27);

          }
          goto LABEL_14;
        }
      }
      else
      {
        -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 1);
        -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "_replaceCurrentWordWithText:", v7);

        -[UIKeyboardImpl syncDocumentStateToInputDelegate](self, "syncDocumentStateToInputDelegate");
        -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 0);
      }
      -[UIKeyboardImpl removeAutocorrectPrompt](self, "removeAutocorrectPrompt");
LABEL_14:

      goto LABEL_15;
    }
  }
  -[UIKeyboardImpl removeAutocorrectPrompt](self, "removeAutocorrectPrompt");
LABEL_15:

}

- (void)updateLegacyAutocorrectPromptWithAutocorrection:(id)a3 parentView:(id)a4 correctionRects:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  UIAutocorrectInlinePrompt *m_autocorrectPrompt;
  id v13;
  UIAutocorrectInlinePrompt *v14;
  UIAutocorrectInlinePrompt *v15;
  UIAutocorrectInlinePrompt *v16;
  UIAutocorrectInlinePrompt *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  UIAutocorrectInlinePrompt *v38;
  void *v39;
  id v40;

  v40 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v40, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "input");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  m_autocorrectPrompt = self->m_autocorrectPrompt;
  if (!m_autocorrectPrompt)
  {
    v14 = [UIAutocorrectInlinePrompt alloc];
    v15 = -[UIAutocorrectInlinePrompt initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v16 = self->m_autocorrectPrompt;
    self->m_autocorrectPrompt = v15;

    goto LABEL_5;
  }
  -[UIView superview](m_autocorrectPrompt, "superview");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 != v8)
LABEL_5:
    objc_msgSend(v8, "addSubview:", self->m_autocorrectPrompt);
  v17 = self->m_autocorrectPrompt;
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textInputView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_convertVisualAltitude:toView:", self->m_autocorrectPrompt, 0.0);
  -[UIView _setVisualAltitude:](v17, "_setVisualAltitude:");

  -[UIKeyboardImpl trackUsageForPromptedCorrection:inputString:previousPrompt:](self, "trackUsageForPromptedCorrection:inputString:previousPrompt:", v10, v11, self->m_autocorrectPrompt);
  -[UIAutocorrectInlinePrompt setUsageTrackingMask:](self->m_autocorrectPrompt, "setUsageTrackingMask:", objc_msgSend(v40, "usageTrackingMask"));
  objc_msgSend(v9, "lastObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rect");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(v8, "bounds");
  v31 = v29 + v30;
  if (v29 + v30 == 0.0)
  {
    objc_msgSend(v8, "superview");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bounds");
    v31 = v33 + v34;

  }
  -[UIAutocorrectInlinePrompt setCorrection:typedText:inRect:maxX:](self->m_autocorrectPrompt, "setCorrection:typedText:inRect:maxX:", v10, v11, v22, v24, v26, v28, v31);
  -[UIView setSize:](self->m_autocorrectPrompt, "setSize:", v26, v28);
  v35 = objc_msgSend(v9, "count");
  v36 = v35 - 1;
  if (v35 != 1)
  {
    v37 = 0;
    do
    {
      v38 = self->m_autocorrectPrompt;
      objc_msgSend(v9, "objectAtIndex:", v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "rect");
      -[UIAutocorrectInlinePrompt addTypedTextRect:](v38, "addTypedTextRect:");

      ++v37;
    }
    while (v36 != v37);
  }

}

- (void)updateAutocorrectContainerWithAutocorrection:(id)a3 parentView:(id)a4 correctionRects:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UIAutocorrectBubbleContainer *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(UIAutocorrectBubbleContainer);
    -[UIKeyboardImpl setAutocorrectBubbleContainer:](self, "setAutocorrectBubbleContainer:", v12);

  }
  objc_msgSend(v9, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "containsObject:", v15);

  if ((v16 & 1) == 0)
  {
    objc_msgSend(v9, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    objc_msgSend(v9, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bringSubviewToFront:", v20);

  }
  objc_msgSend(v10, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rect");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v9;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v30, "subviews", 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v33)
          objc_enumerationMutation(v31);
        v35 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32 = v35;
          goto LABEL_15;
        }
      }
      v32 = (id)objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v32)
        continue;
      break;
    }
  }
LABEL_15:

  objc_msgSend(v30, "superview");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "convertRect:fromView:", v32, v23, v25, v27, v29);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;

  -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "candidate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "input");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "superview");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "updateWithAutocorrectionText:typedText:referenceTextView:referenceRect:", v46, v47, v48, v38, v40, v42, v44);

}

- (void)animateAutocorrectionToText:(id)a3 fromRect:(CGRect)a4
{
  void *v5;
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
  void *v17;
  id v18;

  -[UIKeyboardImpl _rangeForAutocorrectionText:](self, "_rangeForAutocorrectionText:", a3);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (self->m_autocorrectPrompt)
  {
    -[UIKeyboardImpl inputOverlayContainer](self, "inputOverlayContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstRectForRange:", v18);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

    }
    else
    {
      v10 = *MEMORY[0x1E0C9D628];
      v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }
    -[UIKeyboardImpl convertRectToAutocorrectRect:delegateView:container:](self, "convertRectToAutocorrectRect:delegateView:container:", v7, v5, v10, v12, v14, v16);
    -[UIKeyboardImpl animateAutocorrectionToRect:fromRect:](self, "animateAutocorrectionToRect:fromRect:");

    goto LABEL_8;
  }
  -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[UIKeyboardImpl autocorrectBubbleContainer](self, "autocorrectBubbleContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "animateAutocorrectionAccepted");
LABEL_8:

  }
}

- (void)animateAutocorrectionToRect:(CGRect)a3 fromRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIAutocorrectInlinePrompt *v25;
  UIAutocorrectInlinePrompt *m_autocorrectPrompt;
  UIAutocorrectInlinePrompt *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  UIAutocorrectInlinePrompt *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  double v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (!-[UIKeyboardImpl isPredictionViewControllerVisible](self, "isPredictionViewControllerVisible")
    && !-[UIKeyboardImpl shouldShowLongPredictionList](self, "shouldShowLongPredictionList"))
  {
    -[UIView setFrame:](self->m_autocorrectPrompt, "setFrame:", x, y, width, height);
    if (-[UIAutocorrectInlinePrompt prepareForAnimation:](self->m_autocorrectPrompt, "prepareForAnimation:", v11, v10, v9, v8))
    {
      -[UIAutocorrectInlinePrompt typedTextView](self->m_autocorrectPrompt, "typedTextView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAutocorrectInlinePrompt correctionView](self->m_autocorrectPrompt, "correctionView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAutocorrectInlinePrompt correctionAnimationView](self->m_autocorrectPrompt, "correctionAnimationView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAutocorrectInlinePrompt correctionShadowView](self->m_autocorrectPrompt, "correctionShadowView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "frameOrigin");
      v18 = v17;
      v20 = v19;
      -[UIView bounds](self->m_autocorrectPrompt, "bounds");
      v22 = round(v21 * 0.5);
      objc_msgSend(v13, "bounds");
      v24 = v20 + v22 - round(v23 * 0.5);
      v25 = self->m_autocorrectPrompt;
      m_autocorrectPrompt = self->m_autocorrectPrompt;
      self->m_autocorrectPrompt = 0;

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke;
      v33[3] = &unk_1E16C1C58;
      v37 = v18;
      v38 = v24;
      v34 = v14;
      v35 = v15;
      v36 = v16;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke_2;
      v31[3] = &unk_1E16B2218;
      v31[4] = self;
      v32 = v25;
      v27 = v25;
      v28 = v16;
      v29 = v15;
      v30 = v14;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v33, v31, 0.15, 0.0);

    }
  }
}

uint64_t __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrameOrigin:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setFrameOrigin:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "setFrameOrigin:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
}

uint64_t __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autocorrectionAnimationDidStopWithAutocorrectionView:", *(_QWORD *)(a1 + 40));
}

- (void)fadeAutocorrectPrompt
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  UIAutocorrectInlinePrompt *m_autocorrectPrompt;
  UIAutocorrectInlinePrompt *v8;
  void *v9;
  UIAutocorrectInlinePrompt *v10;
  _QWORD v11[5];
  UIAutocorrectInlinePrompt *v12;
  _QWORD v13[5];

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && -[UIKeyboardImpl hasAutocorrectPrompt](self, "hasAutocorrectPrompt"))
  {
    UIKeyboardGetCurrentInputMode();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIAutocorrectInlinePrompt usageTrackingMask](self->m_autocorrectPrompt, "usageTrackingMask");
    TIStatisticScalarIncrementAutocorrectionKey();
    v6 = +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled");
    m_autocorrectPrompt = self->m_autocorrectPrompt;
    if (v6)
    {
      if (m_autocorrectPrompt)
      {
        -[UIView setAlpha:](m_autocorrectPrompt, "setAlpha:", 0.0);
        v8 = self->m_autocorrectPrompt;
        self->m_autocorrectPrompt = 0;

      }
      -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dismissWithoutSelection");

    }
    else
    {
      v12 = m_autocorrectPrompt;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke;
      v13[3] = &unk_1E16B1B28;
      v13[4] = self;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke_2;
      v11[3] = &unk_1E16B2218;
      v11[4] = self;
      v10 = v12;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v13, v11, 0.1, 0.0);

    }
    -[_UIKeyboardStateManager rejectAutocorrectionForPromptFade](self->_keyboardStateManager, "rejectAutocorrectionForPromptFade");
    -[UIKeyboardImpl setAutocorrection:](self, "setAutocorrection:", 0);
    -[UIKeyboardImpl updateKeyboardConfigurations](self, "updateKeyboardConfigurations");

  }
}

void __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 424);
  *(_QWORD *)(v2 + 424) = 0;

}

uint64_t __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autocorrectionAnimationDidStopWithAutocorrectionView:", *(_QWORD *)(a1 + 40));
}

- (void)autocorrectionAnimationDidStopWithAutocorrectionView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v6, "removeFromSuperview");
  -[UIKeyboardImpl cursorAssertion](self, "cursorAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[UIKeyboardImpl setCursorAssertion:](self, "setCursorAssertion:", 0);
}

- (void)underlineCandidate:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;

  v12 = a3;
  v4 = +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled");
  v5 = v12;
  if (v12 && v4)
  {
    if (-[UIKeyboardImpl shouldUnderlineCandidate:](self, "shouldUnderlineCandidate:", v12))
    {
      objc_msgSend(v12, "candidate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardImpl _rangeForAutocorrectionText:](self, "_rangeForAutocorrectionText:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "isAutocorrection"))
      {
        -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "input");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "correctedTypedText:rangeOfReplacement:", v9, v7);

      }
      -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addUnderlineForCandidate:range:", v12, v7);

      goto LABEL_9;
    }
    v11 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    v5 = v12;
    if (v11)
    {
      -[UIKeyboardImpl _textChoicesAssistant](self, "_textChoicesAssistant");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setNeedsUnderlineUpdate");
LABEL_9:

      v5 = v12;
    }
  }

}

- (BOOL)shouldUnderlineCandidate:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "confidence"))
    v4 = objc_msgSend(v3, "confidence") != 3;
  else
    v4 = 0;

  return v4;
}

- (id)autocorrectionRecordForWord:(id)a3
{
  return -[_UIKeyboardStateManager autocorrectionRecordForWord:](self->_keyboardStateManager, "autocorrectionRecordForWord:", a3);
}

- (BOOL)delegateSuggestionsForCurrentInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  BOOL v30;
  char v31;
  void *v32;
  char isKindOfClass;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v38;

  -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textSuggestionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_34:
    v30 = 1;
    goto LABEL_35;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v4, "hasCurrentSuggestions"))
  {
    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_fullText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_selectedNSRange");

    v9 = (void *)objc_msgSend(v4, "suggestionsForString:inputIndex:", v6, v8);
    v11 = v10;
    v12 = v9;
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v14 = objc_msgSend(v13, "length");
    if (v14)
    {
      v15 = v14;
      if ((objc_msgSend(v6, "isEqualToString:", v13) & 1) != 0)
      {
LABEL_28:
        if ((unint64_t)objc_msgSend(v12, "count") < 2)
        {
          v34 = 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndex:", 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v12, "objectAtIndex:", 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35 = (void *)MEMORY[0x1E0DBDBE8];
            objc_msgSend(v12, "objectAtIndex:", 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "candidateWithCandidate:forInput:", v36, v6);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        -[UIKeyboardImpl setAutocorrection:](self, "setAutocorrection:", v34);
        -[UIKeyboardImpl syncInputManagerToKeyboardState](self, "syncInputManagerToKeyboardState");

        goto LABEL_34;
      }
      if (!delegateSuggestionsForCurrentInput_nbspString_0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", 160);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)delegateSuggestionsForCurrentInput_nbspString_0;
        delegateSuggestionsForCurrentInput_nbspString_0 = v16;

      }
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v13);
      objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), delegateSuggestionsForCurrentInput_nbspString_0, 2, 0, v15);
      -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 1);
      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_selectAll");

      -[UIKeyboardImpl syncDocumentStateToInputDelegate](self, "syncDocumentStateToInputDelegate");
      -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 0);
      -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertText:updateInputSource:", v18, 0);

      if (v11 >= v15)
        v21 = v15;
      else
        v21 = v11;
      if (v15 > v11)
      {
        v22 = (v21 - v15);
        v38 = v21;
        -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 1);
        -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
        v23 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v23, "_moveCurrentSelection:", v22);

        -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v23) = objc_opt_respondsToSelector();

        if ((v23 & 1) != 0)
        {
          v25 = objc_msgSend(v13, "_isNaturallyRTL");
          if (v38 > 5 || (v25 & 1) != 0)
          {
            v31 = v25 ^ 1;
            if (v38 < v15 - 5)
              v31 = 1;
            if ((v31 & 1) != 0)
              goto LABEL_26;
            -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            v28 = v15 - 1;
          }
          else
          {
            -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            v28 = 0;
          }
          objc_msgSend(v26, "_scrollRangeToVisible:animated:", v28, 0, 0);

        }
LABEL_26:
        -[UIKeyboardImpl syncDocumentStateToInputDelegate](self, "syncDocumentStateToInputDelegate");
        -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 0);
      }
    }
    else
    {
      -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 1);
      -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_selectAll");

      -[UIKeyboardImpl syncDocumentStateToInputDelegate](self, "syncDocumentStateToInputDelegate");
      -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 0);
      -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "insertText:updateInputSource:", &stru_1E16EDF20, 0);
    }

    goto LABEL_28;
  }
  v30 = 0;
LABEL_35:

  return v30;
}

- (void)_generateTextSuggestionForKeyboardCamera
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardImpl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAction _textFromCameraTitleForResponder:](UIAction, "_textFromCameraTitleForResponder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextSuggestion textSuggestionWithInputText:](UITextSuggestionWithAction, "textSuggestionWithInputText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTarget:", v3);
  objc_msgSend(v5, "setAction:", sel_captureTextFromCamera_);
  +[UIAction _textFromCameraImage](UIAction, "_textFromCameraImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl setSuggestions:](self, "setSuggestions:", v7);

}

- (id)replacementsFromSelectedText
{
  return -[_UIKeyboardStateManager replacementsFromSelectedText](self->_keyboardStateManager, "replacementsFromSelectedText");
}

- (id)generateAutocorrectionReplacements:(id)a3
{
  return -[_UIKeyboardStateManager generateAutocorrectionReplacements:](self->_keyboardStateManager, "generateAutocorrectionReplacements:", a3);
}

- (id)generateAutocorrectionListForSelectedText
{
  return -[_UIKeyboardStateManager generateAutocorrectionListForSelectedText](self->_keyboardStateManager, "generateAutocorrectionListForSelectedText");
}

- (void)handleAutoDeleteContinuationOnDestinationWithDeletionCount:(unint64_t)a3
{
  -[_UIKeyboardStateManager handleAutoDeleteContinuationOnDestinationWithDeletionCount:](self->_keyboardStateManager, "handleAutoDeleteContinuationOnDestinationWithDeletionCount:", a3);
}

- (void)performStopAutoDeleteAtDocumentStart
{
  -[_UIKeyboardStateManager performStopAutoDeleteAtDocumentStart](self->_keyboardStateManager, "performStopAutoDeleteAtDocumentStart");
}

- (void)startAutoDeleteTimer
{
  -[_UIKeyboardStateManager startAutoDeleteTimer](self->_keyboardStateManager, "startAutoDeleteTimer");
}

- (void)startAutoDeleteTimerForForce:(double)a3
{
  -[_UIKeyboardStateManager startAutoDeleteTimerForForce:](self->_keyboardStateManager, "startAutoDeleteTimerForForce:", a3);
}

- (void)adjustAutoDeleteTimerForForce:(double)a3
{
  -[_UIKeyboardStateManager adjustAutoDeleteTimerForForce:](self->_keyboardStateManager, "adjustAutoDeleteTimerForForce:", a3);
}

- (double)deleteWordLastDelete
{
  double result;

  -[_UIKeyboardStateManager deleteWordLastDelete](self->_keyboardStateManager, "deleteWordLastDelete");
  return result;
}

- (void)touchLongPressTimerWithDelay:(double)a3
{
  -[_UIKeyboardStateManager touchLongPressTimerWithDelay:](self->_keyboardStateManager, "touchLongPressTimerWithDelay:", a3);
}

- (void)touchLongPressTimer
{
  -[_UIKeyboardStateManager touchLongPressTimer](self->_keyboardStateManager, "touchLongPressTimer");
}

- (void)longPressAction
{
  -[_UIKeyboardStateManager longPressAction](self->_keyboardStateManager, "longPressAction");
}

- (BOOL)isLongPress
{
  return -[_UIKeyboardStateManager isLongPress](self->_keyboardStateManager, "isLongPress");
}

- (void)clearTimers
{
  if (pthread_main_np())
  {
    -[_UIKeyboardStateManager clearTimers](self->_keyboardStateManager, "clearTimers");
    -[UIKeyboardImpl clearAutocorrectPromptTimer](self, "clearAutocorrectPromptTimer");
    -[UIKeyboardImpl clearDetachHardwareKeyboardAction](self, "clearDetachHardwareKeyboardAction");
  }
  else
  {
    -[UIKeyboardImpl performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)updateChangeTimeAndIncrementCount
{
  -[_UIKeyboardStateManager updateChangeTimeAndIncrementCount](self->_keyboardStateManager, "updateChangeTimeAndIncrementCount");
}

- (void)updateHardwareKeyboardLayout
{
  -[UIKeyboardImpl updateHardwareKeyboardLayout:](self, "updateHardwareKeyboardLayout:", 0);
}

- (void)updateHardwareKeyboardLayout:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v5 = (void *)UIApp;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hardwareInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "automaticHardwareLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHardwareKeyboardLayoutName:forceRebuild:", v8, v3);

  -[UIKeyboardImpl setCapsLockIfNeeded](self, "setCapsLockIfNeeded");
  -[UIKeyboardImpl callLayoutUpdateAllLocalizedKeys](self, "callLayoutUpdateAllLocalizedKeys");
}

- (void)clearDetachHardwareKeyboardAction
{
  UIDelayedAction *m_detachHardwareKeyboardAction;

  -[UIDelayedAction cancel](self->m_detachHardwareKeyboardAction, "cancel");
  -[UIDelayedAction setTarget:](self->m_detachHardwareKeyboardAction, "setTarget:", 0);
  m_detachHardwareKeyboardAction = self->m_detachHardwareKeyboardAction;
  self->m_detachHardwareKeyboardAction = 0;

}

- (void)detachHardwareKeyboard
{
  void *v3;
  void *v4;
  id v5;

  -[UIKeyboardImpl clearDetachHardwareKeyboardAction](self, "clearDetachHardwareKeyboardAction");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardStateManager setHardwareKeyboardAttached:](self->_keyboardStateManager, "setHardwareKeyboardAttached:", objc_msgSend(v3, "_isHardwareKeyboardAvailable"));

  -[UIKeyboardImpl setInHardwareKeyboardMode:](self, "setInHardwareKeyboardMode:", -[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached"));
  -[UIKeyboardImpl setCapsLockSign](self, "setCapsLockSign");
  -[UIKeyboardImpl setIsAttachedHardwareKeyboard:](self, "setIsAttachedHardwareKeyboard:", 0);
  +[UIInputSwitcher activeInstance](UIInputSwitcher, "activeInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hideSwitcherIfNeeded");
  -[_UIKeyboardStateManager inputModeIndicatorController](self->_keyboardStateManager, "inputModeIndicatorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hardwareKeyboardDettached");

}

- (void)hardwareKeyboardAvailabilityDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[UIKeyboardImpl hardwareKeyboardAvailabilityChanged](self, "hardwareKeyboardAvailabilityChanged");
}

- (void)hardwareKeyboardAvailabilityChanged
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  UIDelayedAction *m_detachHardwareKeyboardAction;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  UIDelayedAction *v17;
  UIDelayedAction *v18;
  id v19;

  -[_UIKeyboardStateManager updateHardwareKeyboardExclusivityIdentifier](self->_keyboardStateManager, "updateHardwareKeyboardExclusivityIdentifier");
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isHardwareKeyboardAvailable");

  if (v4)
  {
    if (self->m_detachHardwareKeyboardAction
      && (-[UIKeyboardImpl clearDetachHardwareKeyboardAction](self, "clearDetachHardwareKeyboardAction"),
          -[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached")))
    {
      -[UIKeyboardImpl setCapsLockIfNeeded](self, "setCapsLockIfNeeded");
      -[UIKeyboardImpl setIsAttachedHardwareKeyboard:](self, "setIsAttachedHardwareKeyboard:", 0);
    }
    else
    {
      -[UIKeyboardImpl setAutomaticMinimizationEnabled:](self, "setAutomaticMinimizationEnabled:", 1);
      if (-[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached"))
        -[UIKeyboardImpl updateHardwareKeyboardLayout](self, "updateHardwareKeyboardLayout");
      else
        -[_UIKeyboardStateManager setHardwareKeyboardAttached:](self->_keyboardStateManager, "setHardwareKeyboardAttached:", 1);
      -[UIKeyboardImpl setInHardwareKeyboardMode:forceRebuild:](self, "setInHardwareKeyboardMode:forceRebuild:", 1, 0);
      -[UIKeyboardImpl setIsAttachedHardwareKeyboard:](self, "setIsAttachedHardwareKeyboard:", 0);
      -[_UIKeyboardStateManager unsetDidUpdateCapsLockLanguageSwitchSetting](self->_keyboardStateManager, "unsetDidUpdateCapsLockLanguageSwitchSetting");
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "prepareStartDictationKeyboardGestures");

    }
    return;
  }
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyInputDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_12;
  }
  v7 = (void *)v6;
  if ((objc_msgSend((id)UIApp, "isSuspended") & 1) == 0)
  {

    goto LABEL_16;
  }
  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_isHostedInAnotherProcess");

  if ((v10 & 1) == 0)
  {
LABEL_12:
    -[UIKeyboardImpl cancelAllKeyEvents](self, "cancelAllKeyEvents");
    objc_msgSend((id)UIApp, "_deliverRemainingKeyUpEvents");
    -[UIKeyboardImpl detachHardwareKeyboard](self, "detachHardwareKeyboard");
    -[_UIKeyboardStateManager unsetDidUpdateCapsLockLanguageSwitchSetting](self->_keyboardStateManager, "unsetDidUpdateCapsLockLanguageSwitchSetting");
    return;
  }
LABEL_16:
  m_detachHardwareKeyboardAction = self->m_detachHardwareKeyboardAction;
  if (m_detachHardwareKeyboardAction)
  {
    -[UIDelayedAction touch](m_detachHardwareKeyboardAction, "touch");
  }
  else if (-[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached"))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferencesActions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForPreferenceKey:", CFSTR("DetachHardwareKeyboardDelayInterval"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    -[UIKeyboardImpl cancelAllKeyEvents](self, "cancelAllKeyEvents");
    objc_msgSend((id)UIApp, "_deliverRemainingKeyUpEvents");
    if (v16 <= 0.0)
    {
      -[UIKeyboardImpl detachHardwareKeyboard](self, "detachHardwareKeyboard");
    }
    else
    {
      v17 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_detachHardwareKeyboard, 0, v16);
      v18 = self->m_detachHardwareKeyboardAction;
      self->m_detachHardwareKeyboardAction = v17;

    }
  }
}

- (void)hideKeyboardWithoutPreflightChecks
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[UIKeyboardImpl prepareForGeometryChange](self, "prepareForGeometryChange");
  -[UIKeyboardImpl removeCandidateList](self, "removeCandidateList");
  WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  objc_msgSend(WeakRetained, "setMinimized:", 1);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExtensionInputMode");

  if (v6)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minimize");

  }
  -[UIKeyboardImpl deactivateLayout](self, "deactivateLayout");
  -[UIKeyboardLayout resetTouchProcessingForKeyboardChange](self->m_layout, "resetTouchProcessingForKeyboardChange");
  -[UIKeyboardImpl notifyShiftState](self, "notifyShiftState");
  -[UIKeyboardImpl window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl _updateSoundPreheatingForWindow:](self, "_updateSoundPreheatingForWindow:", v8);

  -[UIKeyboardImpl geometryChangeDone:](self, "geometryChangeDone:", 1);
  -[UIKeyboardImpl hideInternationalKeyIntroductionIfNeeded](self, "hideInternationalKeyIntroductionIfNeeded");
  -[UIKeyboardImpl dismissContinuousPathIntroductionView](self, "dismissContinuousPathIntroductionView");
  -[UIKeyboardImpl dismissEditingIntroductionView](self, "dismissEditingIntroductionView");
  -[UIKeyboardImpl dismissMultilingualKeyboardTip](self, "dismissMultilingualKeyboardTip");
  -[UIKeyboardImpl dismissMultilingualSettingTip](self, "dismissMultilingualSettingTip");
  -[UIKeyboardImpl dismissStickerEditor:](self, "dismissStickerEditor:", 0);
}

- (void)hideKeyboard
{
  -[UIKeyboardImpl hideKeyboardIgnoringHardwareLayouts:](self, "hideKeyboardIgnoringHardwareLayouts:", 0);
}

- (void)hideKeyboardIgnoringHardwareLayouts:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;

  if (a3
    || (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "currentInputMode"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "showSWLayoutWithHWKeyboard"), v5, v4, (v6 & 1) == 0))
  {
    if (!-[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch"))
      -[UIKeyboardImpl hideKeyboardWithoutPreflightChecks](self, "hideKeyboardWithoutPreflightChecks");
  }
}

- (void)showKeyboard
{
  -[UIKeyboardImpl _showKeyboardIgnoringPolicyDelegate:](self, "_showKeyboardIgnoringPolicyDelegate:", 0);
}

- (void)showKeyboardWithoutSuppressionPolicy
{
  -[UIKeyboardImpl setHardwareKeyboardIsSeen:](self, "setHardwareKeyboardIsSeen:", 1);
  -[UIKeyboardImpl setAutomaticMinimizationEnabled:](self, "setAutomaticMinimizationEnabled:", 0);
  -[UIKeyboardImpl _showKeyboardIgnoringPolicyDelegate:](self, "_showKeyboardIgnoringPolicyDelegate:", 1);
  -[UIKeyboardImpl updateTextInputKeyboardSource](self, "updateTextInputKeyboardSource");
}

- (void)_showKeyboardIgnoringPolicyDelegate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  char v8;
  id WeakRetained;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a3;
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSuppressSoftwareKeyboard");

  if ((v6 & 1) == 0)
  {
    +[UIKeyboardCameraSession activeSession](UIKeyboardCameraSession, "activeSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldSuppressSoftwareKeyboard");

    if ((v8 & 1) == 0
      && +[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate](UIKeyboardVisualModeManager, "softwareKeyboardAllowedForActiveKeyboardSceneDelegate")&& !-[UIKeyboardImpl _shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:](self, "_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:", v3))
    {
      self->m_maximizing = 1;
      if (self->m_updateLayoutOnShowKeyboard
        || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
      {
        if (byte_1ECD783BA)
          -[UIKeyboardImpl refreshRivenPreferences](self, "refreshRivenPreferences");
        -[UIKeyboardImpl updateLayout](self, "updateLayout");
        -[UIKeyboardImpl callLayoutUpdateLocalizedKeys](self, "callLayoutUpdateLocalizedKeys");
        self->m_updateLayoutOnShowKeyboard = 0;
      }
      if (-[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented"))
        -[UIKeyboardImpl dismissEmojiPopoverBeforeCleanup:](self, "dismissEmojiPopoverBeforeCleanup:", 0);
      WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
      objc_msgSend(WeakRetained, "setMinimized:", 0);

      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentInputMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isExtensionInputMode");

      if (v12)
      {
        +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "maximize");

      }
      -[UIView setAlpha:](self->m_layout, "setAlpha:", 1.0);
      -[UIKeyboardImpl window](self, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardImpl _updateSoundPreheatingForWindow:](self, "_updateSoundPreheatingForWindow:", v14);

      -[UIKeyboardImpl prepareForGeometryChange](self, "prepareForGeometryChange");
      -[UIKeyboardImpl removeCandidateList](self, "removeCandidateList");
      v15 = -[UIKeyboardImpl autocorrectionPreferenceForTraits](self, "autocorrectionPreferenceForTraits") != 0;
      -[UIKeyboardImpl keyboardState](self, "keyboardState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAutocorrectionEnabled:", v15);

      -[UIKeyboardImpl keyboardStateManager](self, "keyboardStateManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isInlineCompletionEnabled");
      -[UIKeyboardImpl keyboardState](self, "keyboardState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setInlineCompletionEnabled:", v18);

      -[UIKeyboardImpl updateForChangedSelection](self, "updateForChangedSelection");
      -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", -[UIKeyboardImpl shouldShowCandidateBar](self, "shouldShowCandidateBar"));
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "currentInputMode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardImpl setKeyboardInputMode:userInitiated:](self, "setKeyboardInputMode:userInitiated:", v21, 0);

      if (-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
        -[UIKeyboardImpl generateCandidates](self, "generateCandidates");
      -[UIKeyboardImpl geometryChangeDone:](self, "geometryChangeDone:", 1);
      self->m_maximizing = 0;
    }
  }
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  -[UIKeyboardImpl setInHardwareKeyboardMode:forceRebuild:](self, "setInHardwareKeyboardMode:forceRebuild:", a3, 0);
}

- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4
{
  -[_UIKeyboardStateManager setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:](self->_keyboardStateManager, "setInHardwareKeyboardMode:forceRebuild:shouldMoveKeyboard:", a3, a4, 1);
}

- (void)nonDestructivelyDismissKeyboard
{
  id WeakRetained;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  v4 = objc_msgSend(WeakRetained, "canDismiss");

  if (v4)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v13, "ignoresPinning");
    objc_msgSend(v13, "setIgnoresPinning:", 1);
    -[UIKeyboardImpl setGeometryIsChanging:](self, "setGeometryIsChanging:", 1);
    -[UIKeyboardImpl clearForwardingInputDelegateAndResign:](self, "clearForwardingInputDelegateAndResign:", 1);
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "textOperations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setEditingActionSelector:", sel_cancelOperation_);

        -[UIKeyboardImpl buildInputSourceState](self, "buildInputSourceState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "textOperations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setInputSourceState:", v9);

        objc_msgSend(v7, "flushOperations");
      }
    }
    else
    {
      -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isFirstResponder");

      if (!v12)
      {
        objc_msgSend(v13, "_reloadInputViewsForResponder:", 0);
        goto LABEL_10;
      }
      -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resignFirstResponder");
    }

LABEL_10:
    -[UIKeyboardImpl setGeometryIsChanging:](self, "setGeometryIsChanging:", 0);
    objc_msgSend(v13, "setIgnoresPinning:", v5);
    -[UIKeyboardImpl sendKeyboardDismissalNotification](self, "sendKeyboardDismissalNotification");

  }
}

- (void)sendKeyboardDismissalNotification
{
  void *v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__UIKeyboardImpl_sendKeyboardDismissalNotification__block_invoke;
  aBlock[3] = &unk_1E16BAF98;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[UIKeyboardImpl taskQueue](self, "taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTask:", v3);

}

void __51__UIKeyboardImpl_sendKeyboardDismissalNotification__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "callKeyboardWillDismiss");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("UIKeyboardPrivateDidRequestDismissalNotification"), 0);

  }
  objc_msgSend(v6, "returnExecutionToParent");

}

- (void)dismissKeyboard
{
  UIKeyboardImplGeometryDelegate **p_m_geometryDelegate;
  id WeakRetained;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  p_m_geometryDelegate = &self->m_geometryDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  v5 = objc_msgSend(WeakRetained, "canDismiss");

  if (v5)
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "keyboardAppearance");

    if (v7 == 127
      || !-[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached")
      || (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v8, "currentInputMode"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "showSWLayoutWithHWKeyboard"), v9, v8, (v10 & 1) != 0))
    {
      -[UIKeyboardImpl nonDestructivelyDismissKeyboard](self, "nonDestructivelyDismissKeyboard");
    }
    else
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
        -[UIKeyboardImpl setShowsCandidateBar:](self, "setShowsCandidateBar:", 0);
      -[UIKeyboardImpl prepareForGeometryChange](self, "prepareForGeometryChange");
      v11 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
      objc_msgSend(v11, "setMinimized:", 1);

      -[UIKeyboardImpl geometryChangeDone:](self, "geometryChangeDone:", 0);
      -[UIKeyboardImpl setAutomaticMinimizationEnabled:](self, "setAutomaticMinimizationEnabled:", 1);
    }
    -[UIKeyboardImpl sendKeyboardDismissalNotification](self, "sendKeyboardDismissalNotification");
  }
}

- (void)_attemptAuthenticationWithMessage:(id)a3
{
  -[_UIKeyboardStateManager _attemptAuthenticationWithMessage:](self->_keyboardStateManager, "_attemptAuthenticationWithMessage:", a3);
}

- (void)_handleWebKeyEvent:(id)a3 withEventType:(unint64_t)a4 withInputString:(id)a5 withInputStringIgnoringModifiers:(id)a6
{
  -[_UIKeyboardStateManager _handleWebKeyEvent:withEventType:withInputString:withInputStringIgnoringModifiers:](self->_keyboardStateManager, "_handleWebKeyEvent:withEventType:withInputString:withInputStringIgnoringModifiers:", a3, a4, a5, a6);
}

- (void)_handleWebKeyEvent:(id)a3 withIndex:(unint64_t)a4 inInputString:(id)a5
{
  -[_UIKeyboardStateManager _handleWebKeyEvent:withIndex:inInputString:](self->_keyboardStateManager, "_handleWebKeyEvent:withIndex:inInputString:", a3, a4, a5);
}

- (void)triggerPendingKeyup
{
  -[_UIKeyboardStateManager triggerPendingKeyup](self->_keyboardStateManager, "triggerPendingKeyup");
}

- (void)allowResponderChainFirstChanceToHandleKeyEvent:(id)a3
{
  objc_msgSend((id)UIApp, "handleKeyUIEvent:", a3);
}

- (void)_handleKeyEvent:(id)a3 executionContext:(id)a4
{
  -[_UIKeyboardStateManager _handleKeyEvent:executionContext:](self->_keyboardStateManager, "_handleKeyEvent:executionContext:", a3, a4);
}

- (void)handleKeyEvent:(id)a3
{
  -[_UIKeyboardStateManager handleKeyEvent:](self->_keyboardStateManager, "handleKeyEvent:", a3);
}

- (BOOL)_isKeyCommand:(id)a3
{
  return -[_UIKeyboardStateManager _isKeyCommand:](self->_keyboardStateManager, "_isKeyCommand:", a3);
}

- (BOOL)_handlesKeyCommandForEvent:(id)a3
{
  return -[_UIKeyboardStateManager _handlesKeyCommandForEvent:](self->_keyboardStateManager, "_handlesKeyCommandForEvent:", a3);
}

- (BOOL)_handleKeyCommand:(id)a3
{
  return -[_UIKeyboardStateManager _handleKeyCommand:](self->_keyboardStateManager, "_handleKeyCommand:", a3);
}

- (void)completeHandleKeyEvent:(id)a3
{
  -[_UIKeyboardStateManager completeHandleKeyEvent:](self->_keyboardStateManager, "completeHandleKeyEvent:", a3);
}

- (BOOL)deferEventHandlingToSystemWithContext:(id)a3
{
  return -[_UIKeyboardStateManager deferEventHandlingToSystemWithContext:](self->_keyboardStateManager, "deferEventHandlingToSystemWithContext:", a3);
}

- (void)toggleSoftwareKeyboard
{
  UIKeyboardImplGeometryDelegate **p_m_geometryDelegate;
  id v4;
  int v5;
  id v6;
  id v7;
  id WeakRetained;

  p_m_geometryDelegate = &self->m_geometryDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  if ((objc_msgSend(WeakRetained, "isActive") & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
    v5 = objc_msgSend(v4, "isAutomatic");

    if (v5)
    {
      v6 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
      -[UIKeyboardImpl setAutomaticMinimizationEnabled:](self, "setAutomaticMinimizationEnabled:", objc_msgSend(v6, "isMinimized") ^ 1);

      v7 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
      LODWORD(v6) = objc_msgSend(v7, "isMinimized");

      if ((_DWORD)v6)
        -[UIKeyboardImpl showKeyboard](self, "showKeyboard");
      else
        -[UIKeyboardImpl hideKeyboard](self, "hideKeyboard");
    }
  }
  else
  {

  }
}

- (void)ejectKeyDown
{
  -[_UIKeyboardStateManager ejectKeyDown](self->_keyboardStateManager, "ejectKeyDown");
}

- (void)resetIsPhysicallyAttachedHardwareKeyboard
{
  NSNumber *isAttachedHardwareKeyboard;

  isAttachedHardwareKeyboard = self->_isAttachedHardwareKeyboard;
  self->_isAttachedHardwareKeyboard = 0;

}

- (void)updateIsAttachedHardwareKeyboard
{
  const __CFArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFArray *v20;
  __IOHIDEventSystemClient *cf;
  __IOHIDServiceClient *service;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  cf = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = IOHIDEventSystemClientCopyServices(cf);
  v3 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    v20 = v2;
    v17 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      v18 = v4;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v2);
        service = *(__IOHIDServiceClient **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        v7 = (void *)IOHIDServiceClientCopyProperty(service, CFSTR("DeviceUsagePairs"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v6;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v8 = v7;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v25;
            while (2)
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v25 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v13, "objectForKey:", CFSTR("DeviceUsagePage"));
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "objectForKey:", CFSTR("DeviceUsage"));
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v14, "isEqual:", &unk_1E1A98EB0)
                    && objc_msgSend(v15, "isEqual:", &unk_1E1A98EC8))
                  {
                    v16 = (void *)IOHIDServiceClientCopyProperty(service, CFSTR("Transport"));
                    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AID")) & 1) != 0
                      || objc_msgSend(v16, "isEqualToString:", CFSTR("USB")))
                    {
                      -[UIKeyboardImpl setIsAttachedHardwareKeyboard:](self, "setIsAttachedHardwareKeyboard:", MEMORY[0x1E0C9AAB0]);
                      CFRelease(cf);

                      v2 = v20;
                      goto LABEL_27;
                    }

                  }
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v10)
                continue;
              break;
            }
          }

          v6 = v19;
          v2 = v20;
          v5 = v17;
          v4 = v18;
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v4);
  }

  -[UIKeyboardImpl setIsAttachedHardwareKeyboard:](self, "setIsAttachedHardwareKeyboard:", MEMORY[0x1E0C9AAA0]);
  if (cf)
    CFRelease(cf);
LABEL_27:

}

- (void)setKeyboardMinimizedByDictation:(BOOL)a3
{
  -[_UIKeyboardStateManager setKeyboardMinimizedByDictation:](self->_keyboardStateManager, "setKeyboardMinimizedByDictation:", a3);
}

- (void)showKeyboardIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  id v9;

  if (+[UIDictationController isRunningInTypeAndTalkMode](UIDictationController, "isRunningInTypeAndTalkMode"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "shouldSuppressSoftwareKeyboard")
      && -[UIKeyboardImpl isMinimized](self, "isMinimized"))
    {
      v4 = !-[UIKeyboardImpl isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode");
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  if (-[UIKeyboardImpl hardwareKeyboardIsSeen](self, "hardwareKeyboardIsSeen") && !v4
    || !-[UIKeyboardImpl isMinimized](self, "isMinimized")
    || -[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented")
    || -[UIKeyboardImpl _shouldSuppressSoftwareKeyboardByOneness](self, "_shouldSuppressSoftwareKeyboardByOneness"))
  {
    return;
  }
  -[UIKeyboardImpl isAttachedHardwareKeyboard](self, "isAttachedHardwareKeyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[UIKeyboardImpl updateIsAttachedHardwareKeyboard](self, "updateIsAttachedHardwareKeyboard");
  -[UIKeyboardImpl isAttachedHardwareKeyboard](self, "isAttachedHardwareKeyboard");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "BOOLValue"))
  {

LABEL_21:
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldSuppressSoftwareKeyboard");

    if (v8)
      -[UIKeyboardImpl setKeyboardMinimizedByDictation:](self, "setKeyboardMinimizedByDictation:", 0);
    -[UIKeyboardImpl toggleSoftwareKeyboard](self, "toggleSoftwareKeyboard");
    return;
  }
  if (!v4)
  {

    return;
  }
  v6 = -[UIKeyboardImpl isMinimized](self, "isMinimized");

  if (v6)
    goto LABEL_21;
}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 2)
    -[UIResponder remoteControlReceivedWithEvent:](self->m_layout, "remoteControlReceivedWithEvent:", v4);

}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 7)
    -[UIResponder _wheelChangedWithEvent:](self->m_layout, "_wheelChangedWithEvent:", v4);

}

- (void)_moveWithEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 5 && -[UIKeyboardLayout canHandleEvent:](self->m_layout, "canHandleEvent:", v4))
  {
    -[UIKeyboardImpl clearLanguageIndicator](self, "clearLanguageIndicator");
    -[UIResponder _moveWithEvent:](self->m_layout, "_moveWithEvent:", v4);
  }

}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  UIKeyboardLayout *m_layout;

  m_layout = self->m_layout;
  if (m_layout)
    LOBYTE(m_layout) = -[UIKeyboardLayout canHandlePresses:withEvent:](m_layout, "canHandlePresses:withEvent:", a3, a4);
  return (char)m_layout;
}

- (BOOL)caretBlinks
{
  void *v2;
  char v3;

  -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cursorBlinks");

  return v3;
}

- (BOOL)caretVisible
{
  void *v2;
  char v3;

  -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cursorVisible");

  return v3;
}

- (void)clearSelection
{
  -[_UIKeyboardStateManager clearSelection](self->_keyboardStateManager, "clearSelection");
}

- (id)dynamicCaretList
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_legacySelectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dynamicCaretList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateNoContentViews
{
  void *v3;
  void *v4;
  id v5;

  -[UIKeyboardImpl dynamicCaretList](self, "dynamicCaretList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardImpl textInteractionAssistant](self, "textInteractionAssistant");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_legacySelectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateDocumentHasContent:", -[UIKeyboardImpl noContent](self, "noContent") ^ 1);

  }
}

- (BOOL)canHandleKeyHitTest
{
  return -[_UIKeyboardStateManager canHandleKeyHitTest](self->_keyboardStateManager, "canHandleKeyHitTest");
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[UIKeyboardImpl pointInside:forEvent:](self, "pointInside:forEvent:", objc_msgSend(v7, "_gsEvent"), x, y)
    || -[UIView pointInside:withEvent:](self->m_layout, "pointInside:withEvent:", v7, x, y);

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y;
  double x;
  int v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat width;
  CGFloat height;
  void *v24;
  void *continuousPathIntroductionView;
  UIKBMultilingualSettingIntroductionView *v26;
  _BOOL4 v27;
  UIKeyboardLayout *m_layout;
  BOOL v29;
  void *v30;
  void *v31;
  int HasAlphaHittable;
  CGPoint v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  y = a3.y;
  x = a3.x;
  if (!-[UIKeyboardImpl isMinimized](self, "isMinimized"))
  {
    -[UIView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UIKeyboardLayout hitBuffer](self->m_layout, "hitBuffer");
    v18 = v17;
    v19 = -v17;
    v35.origin.x = v10;
    v35.origin.y = v12;
    v35.size.width = v14;
    v35.size.height = v16;
    v36 = CGRectInset(v35, 0.0, v19);
    v20 = v36.origin.x;
    v21 = v36.origin.y;
    width = v36.size.width;
    height = v36.size.height;
    -[UIKeyboardImpl internationalKeyIntroductionView](self, "internationalKeyIntroductionView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    continuousPathIntroductionView = v24;
    if (v24
      || (continuousPathIntroductionView = self->_continuousPathIntroductionView) != 0
      || (continuousPathIntroductionView = self->_editingGestureIntroductionView) != 0
      || (continuousPathIntroductionView = self->_multilingualKeyboardIntroductionView) != 0)
    {
      v26 = continuousPathIntroductionView;

    }
    else
    {
      v26 = self->_multilingualSettingIntroductionView;
      if (!v26)
        goto LABEL_11;
    }
    -[UIView convertPoint:fromView:](v26, "convertPoint:fromView:", self, x, y);
    if (-[UIView pointInside:forEvent:](v26, "pointInside:forEvent:", a4))
    {
      LOBYTE(v8) = 1;
LABEL_24:

      return v8;
    }
LABEL_11:
    v37.origin.x = v20;
    v37.origin.y = v21;
    v37.size.width = width;
    v37.size.height = height;
    v34.x = x;
    v34.y = y;
    v27 = CGRectContainsPoint(v37, v34);
    m_layout = self->m_layout;
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", m_layout, x, y);
    v8 = -[UIView pointInside:forEvent:](m_layout, "pointInside:forEvent:", a4);
    v29 = v18 != 0.0 || !v27;
    if (v29
      || !+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit")
      || -[UIKeyboardImpl centerFilled](self, "centerFilled"))
    {
      v8 |= v27;
    }
    if (-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
    {
      -[UIKeyboardImpl candidateController](self, "candidateController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "candidateBar");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v31, "isHiddenOrHasHiddenAncestor") & 1) != 0)
      {
        HasAlphaHittable = 0;
      }
      else
      {
        HasAlphaHittable = -[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v31);
        if (HasAlphaHittable)
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v31, x, y);
          HasAlphaHittable = objc_msgSend(v31, "pointInside:forEvent:", a4);
        }
      }
      LOBYTE(v8) = (HasAlphaHittable | v8) != 0;

    }
    goto LABEL_24;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *continuousPathIntroductionView;
  UIKBMultilingualSettingIntroductionView *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIKeyboardLayout *m_layout;
  UIKeyboardLayout *v19;
  UIKeyboardLayout *v20;
  id v21;
  UIKeyboardLayout *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char v32;
  void *v33;
  objc_super v35;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[UIKeyboardImpl internationalKeyIntroductionView](self, "internationalKeyIntroductionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  continuousPathIntroductionView = v8;
  if (v8
    || (continuousPathIntroductionView = self->_continuousPathIntroductionView) != 0
    || (continuousPathIntroductionView = self->_editingGestureIntroductionView) != 0
    || (continuousPathIntroductionView = self->_multilingualKeyboardIntroductionView) != 0)
  {
    v10 = continuousPathIntroductionView;

  }
  else
  {
    v10 = self->_multilingualSettingIntroductionView;
    if (!v10)
    {
LABEL_7:
      if (-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
      {
        -[UIKeyboardImpl candidateController](self, "candidateController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "candidateBar");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
        v15 = v14;
        v17 = v16;
        if ((objc_msgSend(v13, "isHiddenOrHasHiddenAncestor") & 1) == 0
          && -[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v13)
          && (objc_msgSend(v13, "pointInside:withEvent:", v7, v15, v17) & 1) != 0)
        {
          objc_msgSend(v13, "hitTest:withEvent:", v7, v15, v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

          goto LABEL_34;
        }

      }
      m_layout = self->m_layout;
      -[UIView convertPoint:fromView:](m_layout, "convertPoint:fromView:", self, x, y);
      -[UIView hitTest:withEvent:](m_layout, "hitTest:withEvent:", v7);
      v19 = (UIKeyboardLayout *)objc_claimAutoreleasedReturnValue();
      v20 = self->m_layout;

      if (v19 == v20)
      {
        v22 = self->m_layout;
LABEL_33:
        v11 = v22;
        goto LABEL_34;
      }
      if (-[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"))
      {
LABEL_32:
        v35.receiver = self;
        v35.super_class = (Class)UIKeyboardImpl;
        -[UIView hitTest:withEvent:](&v35, sel_hitTest_withEvent_, v7, x, y);
        v22 = (UIKeyboardLayout *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      -[UIKeyboardLayout candidateList](self->m_layout, "candidateList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          -[UIKeyboardImpl candidateController](self, "candidateController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "activeCandidateViewType");

          if ((v32 & 1) != 0)
          {
            -[UIKeyboardImpl candidateController](self, "candidateController");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "candidateKey");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
              goto LABEL_21;
          }
          else
          {
            v23 = 0;
          }
          goto LABEL_31;
        }
        objc_msgSend(v13, "view");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v23 = v21;
      if (v21)
      {
LABEL_21:
        if ((objc_msgSend(v23, "isHidden") & 1) == 0)
        {
          -[UIKeyboardImpl candidateController](self, "candidateController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "candidateResultSet");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "hasCandidates");

          if (v26)
          {
            -[UIView convertPoint:toView:](self, "convertPoint:toView:", v23, x, y);
            v28 = v27;
            v30 = v29;
            if ((objc_msgSend(v23, "pointInside:withEvent:", v7) & 1) != 0)
            {
              objc_msgSend(v23, "hitTest:withEvent:", v7, v28, v30);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_25;
            }
          }
        }
      }
LABEL_31:

      goto LABEL_32;
    }
  }
  -[UIView convertPoint:fromView:](v10, "convertPoint:fromView:", self, x, y);
  -[UIView hitTest:withEvent:](v10, "hitTest:withEvent:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_7;
LABEL_34:

  return v11;
}

- (BOOL)isAutoFillMode
{
  return -[_UIKeyboardStateManager isAutoFillMode](self->_keyboardStateManager, "isAutoFillMode");
}

- (void)trackUsageForPromptedCorrection:(id)a3 inputString:(id)a4 previousPrompt:(id)a5
{
  -[_UIKeyboardStateManager trackUsageForPromptedCorrection:inputString:previousPrompt:](self->_keyboardStateManager, "trackUsageForPromptedCorrection:inputString:previousPrompt:", a3, a4, a5);
}

- (void)trackUsageForCandidateAcceptedAction:(id)a3
{
  -[_UIKeyboardStateManager trackUsageForCandidateAcceptedAction:](self->_keyboardStateManager, "trackUsageForCandidateAcceptedAction:", a3);
}

- (void)performSendCurrentLocation
{
  void *v3;
  const char *v4;
  id v5;

  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl responderForSendCurrentLocation](self, "responderForSendCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (const char *)objc_msgSend(v5, "_sendCurrentLocationAction");
    if (dyld_program_sdk_at_least())
      objc_msgSend(v3, v4);
    else
      objc_msgSend(v3, sel_performSelector_, v4);
  }

}

- (void)enableTransientInputDelegateSelectionMode
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__UIKeyboardImpl_enableTransientInputDelegateSelectionMode__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __59__UIKeyboardImpl_enableTransientInputDelegateSelectionMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableTransientSelectionMode");
}

- (void)enableTransientSelectionMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateRespectingForwardingDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl _setTransientSelectionModeEnabled:forInputDelegate:](self, "_setTransientSelectionModeEnabled:forInputDelegate:", 1, v4);

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSystemSourceSession");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "textOperations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEditingActionSelector:", sel_enableTransientSelectionMode);
      objc_msgSend(v7, "flushOperations");

    }
  }
}

- (void)disableTransientSelectionMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateRespectingForwardingDelegate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl _setTransientSelectionModeEnabled:forInputDelegate:](self, "_setTransientSelectionModeEnabled:forInputDelegate:", 0, v4);

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSystemSourceSession");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "textOperations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEditingActionSelector:", sel_disableTransientSelectionMode);
      objc_msgSend(v7, "flushOperations");

    }
  }
}

- (void)didChangeForwardingInputDelegate:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[UIKeyboardImpl takeTextInputTraitsFromDelegate](self, "takeTextInputTraitsFromDelegate");
  if (a3)
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forwardingInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "keyboardType");

    if (v7 == 122)
      -[UIKeyboardImpl recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:](self, "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", 0, 1);
  }
  else
  {
    -[UIKeyboardImpl disableTransientSelectionMode](self, "disableTransientSelectionMode");
    -[UIKeyboardImpl recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:](self, "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", 1, 1);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateRenderConfigForCurrentResponder");

    -[UIKeyboardImpl reinitializeAfterInputModeSwitch:](self, "reinitializeAfterInputModeSwitch:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIKeyboardLayout didTriggerDestructiveRenderConfigChange](self->m_layout, "didTriggerDestructiveRenderConfigChange");
  }
}

- (void)_setTransientSelectionModeEnabled:(BOOL)a3 forInputDelegate:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "interactionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectionDisplayVisible:", 1);
    objc_msgSend(v5, "setCursorBlinkAnimationEnabled:", v4 ^ 1);
    objc_msgSend(v5, "setGhostAppearance:", v4);

  }
}

- (void)_ensureRTIConnection
{
  -[_UIKeyboardStateManager _ensureRTIConnection](self->_keyboardStateManager, "_ensureRTIConnection");
}

- (id)buildInputSourceState
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0D87190]);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputMode:", v6);

  objc_msgSend(v3, "setMinimized:", -[UIKeyboardImpl isMinimized](self, "isMinimized"));
  objc_msgSend(v3, "setHardwareKeyboardMode:", -[UIKeyboardImpl isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"));
  objc_msgSend(v3, "setCenterFilled:", -[UIKeyboardImpl centerFilled](self, "centerFilled"));
  objc_msgSend(v3, "setSplit:", objc_msgSend((id)objc_opt_class(), "isSplit"));
  if (objc_msgSend(v3, "split"))
  {
    -[UIKeyboardImpl frameForKeylayoutName:](self, "frameForKeylayoutName:", CFSTR("split-left"));
    objc_msgSend(v3, "setLeftSplitFrame:");
    -[UIKeyboardImpl frameForKeylayoutName:](self, "frameForKeylayoutName:", CFSTR("split-right"));
    objc_msgSend(v3, "setRightSplitFrame:");
  }
  objc_msgSend(v3, "setFloating:", objc_msgSend((id)objc_opt_class(), "isFloating"));
  objc_msgSend(v3, "setShowingEmojiSearch:", -[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch"));
  objc_msgSend(v3, "setUsesCandidateSelection:", -[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection"));
  objc_msgSend(v3, "setShowsCandidateBar:", -[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"));
  -[_UIKeyboardStateManager inputManagerState](self->_keyboardStateManager, "inputManagerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupportsSetPhraseBoundary:", objc_msgSend(v7, "supportsSetPhraseBoundary"));

  return v3;
}

- (id)remoteTextEditingMetadata
{
  return -[_UIKeyboardStateManager remoteTextEditingMetadata](self->_keyboardStateManager, "remoteTextEditingMetadata");
}

- (void)resetInputDelegate
{
  -[_UIKeyboardStateManager resetInputDelegate](self->_keyboardStateManager, "resetInputDelegate");
}

- (void)modifyTextInputTraits:(id)a3 forceSync:(BOOL)a4
{
  -[_UIKeyboardStateManager modifyTextInputTraits:forceSync:](self->_keyboardStateManager, "modifyTextInputTraits:forceSync:", a3, a4);
}

- (void)updateInputDelegateForRemoteTraitChange:(id)a3 forceSync:(BOOL)a4
{
  -[_UIKeyboardStateManager updateInputDelegateForRemoteTraitChange:forceSync:](self->_keyboardStateManager, "updateInputDelegateForRemoteTraitChange:forceSync:", a3, a4);
}

- (void)updateInputDelegateForRemoteDocumentStateChange:(id)a3 selectedTextRange:(_NSRange)a4 hasText:(BOOL)a5 forceSync:(BOOL)a6
{
  -[_UIKeyboardStateManager updateInputDelegateForRemoteDocumentStateChange:selectedTextRange:hasText:forceSync:](self->_keyboardStateManager, "updateInputDelegateForRemoteDocumentStateChange:selectedTextRange:hasText:forceSync:", a3, a4.location, a4.length, a5, a6);
}

- (void)updateForExpectedRemoteDocumentStateChange:(id)a3 selectedTextRange:(_NSRange)a4 forceSync:(BOOL)a5
{
  -[_UIKeyboardStateManager updateForExpectedRemoteDocumentStateChange:selectedTextRange:forceSync:](self->_keyboardStateManager, "updateForExpectedRemoteDocumentStateChange:selectedTextRange:forceSync:", a3, a4.location, a4.length, a5);
}

- (BOOL)assertTextForRemoteDocument:(id)a3 withSelectionDelta:(id)a4 updatingSelection:(BOOL)a5
{
  return -[_UIKeyboardStateManager assertTextForRemoteDocument:withSelectionDelta:updatingSelection:](self->_keyboardStateManager, "assertTextForRemoteDocument:withSelectionDelta:updatingSelection:", a3, a4.var0, a4.var1, a5);
}

- (void)insertAttributedText:(id)a3
{
  -[_UIKeyboardStateManager insertAttributedText:](self->_keyboardStateManager, "insertAttributedText:", a3);
}

- (void)updateAssistantViewInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemInputAssistantViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRemoteAssistantViewInfo:", v3);
}

- (void)applyAssistantItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemInputAssistantViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "applyRemoteAssistantItem:", v4);
  -[UIKeyboardImpl updateInputAssistantButtonItems](self, "updateInputAssistantButtonItems");

}

- (void)unmarkText:(id)a3
{
  -[_UIKeyboardStateManager unmarkText:](self->_keyboardStateManager, "unmarkText:", a3);
}

- (BOOL)hasMarkedText
{
  return -[_UIKeyboardStateManager _hasMarkedText](self->_keyboardStateManager, "_hasMarkedText");
}

- (id)markedText
{
  return -[_UIKeyboardStateManager _markedText](self->_keyboardStateManager, "_markedText");
}

- (void)handleRemoteDictationEvent_switchToDictationInputModeWithOptions:(id)a3
{
  id v3;
  int has_internal_diagnostics;
  BOOL v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v5)
  {
    v8 = handleRemoteDictationEvent_switchToDictationInputModeWithOptions____s_category_0;
    if (!handleRemoteDictationEvent_switchToDictationInputModeWithOptions____s_category_0)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&handleRemoteDictationEvent_switchToDictationInputModeWithOptions____s_category_0);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unexpected event handling", v10, 2u);
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switchToDictationInputModeWithOptions:", v3);

}

- (void)handleRemoteDictationEvent_switchToDictationLanguage:(id)a3
{
  id v3;
  int has_internal_diagnostics;
  BOOL v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v5)
  {
    v8 = handleRemoteDictationEvent_switchToDictationLanguage____s_category_0;
    if (!handleRemoteDictationEvent_switchToDictationLanguage____s_category_0)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&handleRemoteDictationEvent_switchToDictationLanguage____s_category_0);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unexpected event handling", v10, 2u);
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switchToDictationLanguage:", v3);

}

- (void)handleRemoteDictationEvent_startDictation
{
  int has_internal_diagnostics;
  BOOL v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v3 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v6 = handleRemoteDictationEvent_startDictation___s_category_0;
    if (!handleRemoteDictationEvent_startDictation___s_category_0)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&handleRemoteDictationEvent_startDictation___s_category_0);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unexpected event handling", v8, 2u);
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDictation");

}

- (void)handleRemoteDictationEvent_stopDictation:(BOOL)a3
{
  _BOOL8 v3;
  int has_internal_diagnostics;
  BOOL v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v5 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v5)
  {
    v9 = handleRemoteDictationEvent_stopDictation____s_category_0;
    if (!handleRemoteDictationEvent_stopDictation____s_category_0)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&handleRemoteDictationEvent_stopDictation____s_category_0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected event handling", v11, 2u);
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopDictation:", v3);

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resignFirstResponderWhenIdleIfNeeded");

}

- (void)handleRemoteDictationEvent_cancelDictation
{
  int has_internal_diagnostics;
  BOOL v3;
  void *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v3 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v7 = handleRemoteDictationEvent_cancelDictation___s_category_0;
    if (!handleRemoteDictationEvent_cancelDictation___s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&handleRemoteDictationEvent_cancelDictation___s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unexpected event handling", v9, 2u);
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelDictation");

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponderWhenIdleIfNeeded");

}

- (void)handleRemoteDictationEvent_handleTip:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  UIDictationPopoverController *dictationPopoverController;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v11 = handleRemoteDictationEvent_handleTip____s_category_0;
    if (!handleRemoteDictationEvent_handleTip____s_category_0)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&handleRemoteDictationEvent_handleTip____s_category_0);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Unexpected event handling", v13, 2u);
    }
  }
  dictationPopoverController = self->_dictationPopoverController;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationPopoverController presentTip:tipDescription:](dictationPopoverController, "presentTip:tipDescription:", v8, v9);

  }
  else
  {
    -[UIDictationPopoverController dismissTip](dictationPopoverController, "dismissTip");
  }

}

- (void)handleRemoteDictationEvent_movePopoverView:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  UIDictationPopoverController *dictationPopoverController;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v15 = handleRemoteDictationEvent_movePopoverView____s_category_0;
    if (!handleRemoteDictationEvent_movePopoverView____s_category_0)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&handleRemoteDictationEvent_movePopoverView____s_category_0);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Unexpected event handling", v17, 2u);
    }
  }
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    dictationPopoverController = self->_dictationPopoverController;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceRect"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rectValue");
    -[UIDictationPopoverController movePopoverView:](dictationPopoverController, "movePopoverView:");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("editMenuFrame"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "rectValue");
      -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:");
    }

  }
}

- (void)handleRemoteDictationEvent_setEditMenuFrame:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v12 = handleRemoteDictationEvent_setEditMenuFrame____s_category_0;
    if (!handleRemoteDictationEvent_setEditMenuFrame____s_category_0)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&handleRemoteDictationEvent_setEditMenuFrame____s_category_0);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "Unexpected event handling", v14, 2u);
    }
  }
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("editMenuFrame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rectValue");
    -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:");

  }
}

- (void)handleRemoteDictationEvent_updateIdleDetection:(int64_t)a3
{
  int has_internal_diagnostics;
  BOOL v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v8 = handleRemoteDictationEvent_updateIdleDetection____s_category_0;
    if (!handleRemoteDictationEvent_updateIdleDetection____s_category_0)
    {
      v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v8, (unint64_t *)&handleRemoteDictationEvent_updateIdleDetection____s_category_0);
    }
    v9 = *(NSObject **)(v8 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unexpected event handling", v10, 2u);
    }
  }
  -[UIKeyboardImpl updateIdleDetection:](self, "updateIdleDetection:", a3);
}

- (void)handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases
{
  int has_internal_diagnostics;
  BOOL v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v3 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v6 = handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0;
    if (!handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unexpected event handling", v8, 2u);
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopDictationIgnoreFinalizePhrases");

}

- (void)handleRemoteDictationEvent_resumeDictation
{
  int has_internal_diagnostics;
  BOOL v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v3 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v3)
  {
    v6 = handleRemoteDictationEvent_resumeDictation___s_category_0;
    if (!handleRemoteDictationEvent_resumeDictation___s_category_0)
    {
      v6 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&handleRemoteDictationEvent_resumeDictation___s_category_0);
    }
    v7 = *(NSObject **)(v6 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "Unexpected event handling", v8, 2u);
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeDictation");

}

- (void)handleRemoteKeyboardCameraEvent_startCameraInput:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v10 = handleRemoteKeyboardCameraEvent_startCameraInput____s_category_0;
    if (!handleRemoteKeyboardCameraEvent_startCameraInput____s_category_0)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&handleRemoteKeyboardCameraEvent_startCameraInput____s_category_0);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Unexpected event handling", v12, 2u);
    }
  }
  +[UIKeyboardCameraSession sharedSession](UIKeyboardCameraSession, "sharedSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showForResponder:sender:rtiConfiguration:", v8, 0, v4);

}

- (void)handleEventFromRemoteSource_insertSupplementalCandidate:(id)a3 textToCommit:(id)a4
{
  -[_UIKeyboardStateManager handleEventFromRemoteSource_insertSupplementalCandidate:textToCommit:](self->_keyboardStateManager, "handleEventFromRemoteSource_insertSupplementalCandidate:textToCommit:", a3, a4);
}

- (void)handleEventFromRemoteSource_chooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
  -[_UIKeyboardStateManager handleEventFromRemoteSource_chooseSupplementalItem:toReplaceText:](self->_keyboardStateManager, "handleEventFromRemoteSource_chooseSupplementalItem:toReplaceText:", a3, a4);
}

- (void)handleEventCallbackFromRemoteDestination_didChooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
  -[_UIKeyboardStateManager handleEventCallbackFromRemoteDestination_didChooseSupplementalItem:toReplaceText:](self->_keyboardStateManager, "handleEventCallbackFromRemoteDestination_didChooseSupplementalItem:toReplaceText:", a3, a4);
}

- (void)handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert
{
  -[_UIKeyboardStateManager _cancelPendingSupplementalCandidateInsertion](self->_keyboardStateManager, "_cancelPendingSupplementalCandidateInsertion");
}

- (void)handleEventFromRemoteSource_insertionPointEnteredText:(id)a3 withSupplementalCandidate:(id)a4
{
  -[_UIKeyboardStateManager handleEventFromRemoteSource_insertionPointEnteredText:withSupplementalCandidate:](self->_keyboardStateManager, "handleEventFromRemoteSource_insertionPointEnteredText:withSupplementalCandidate:", a3, a4);
}

- (void)handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  -[_UIKeyboardStateManager handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection:](self->_keyboardStateManager, "handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection:", a3);
}

- (void)handleEventFromRemoteSource_insertAutofillContent:(id)a3
{
  -[_UIKeyboardStateManager handleEventFromRemoteSource_insertAutofillContent:](self->_keyboardStateManager, "handleEventFromRemoteSource_insertAutofillContent:", a3);
}

- (void)handleEventFromRemoteSource_autoFillIsMenuPresented:(BOOL)a3
{
  -[_UIKeyboardStateManager handleEventFromRemoteSource_autoFillIsMenuPresented:](self->_keyboardStateManager, "handleEventFromRemoteSource_autoFillIsMenuPresented:", a3);
}

- (BOOL)shouldSuppressSelectionCommands
{
  return -[_UIKeyboardStateManager shouldSuppressSelectionCommands](self->_keyboardStateManager, "shouldSuppressSelectionCommands");
}

- (void)pauseDictationForResponderChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    _UIDictationControllerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "UIDictationController pauseDictationForResponderChange", v7, 2u);
    }

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pauseDictation");

    -[UIKeyboardImpl dismissDictationPopover](self, "dismissDictationPopover");
    +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v5, "canStopLanding");

    if ((_DWORD)v4)
    {
      +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopLanding");

    }
  }
}

- (void)handleDictationForResponderChange
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  UIDelayedAction *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  UIDelayedAction *m_resumeDictationForResponderChange;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (+[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = +[UIDictationController checkTraitsSupportDictation:](UIDictationController, "checkTraitsSupportDictation:", v3);

    _UIDictationControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "UIDictationController resumeDictationForResponderChange", (uint8_t *)&v17, 2u);
      }

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resumeDictation");

      if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled")
        && !-[UIKeyboardImpl isDictationMenuPresented](self, "isDictationMenuPresented"))
      {
        -[UIKeyboardImpl presentDictationMenu](self, "presentDictationMenu");
      }
    }
    else
    {
      if (v6)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "UIDictationController resumeDictationForResponderChange cancelDictation instead -> new responder does not support dictation", (uint8_t *)&v17, 2u);
      }

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setReasonType:", 20);

      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancelDictation");

    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSkipAutomaticResumeDictation:", 0);

    _UIDictationControllerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "skipAutomaticResumeDictation");
      v17 = 136315394;
      v18 = "-[UIKeyboardImpl handleDictationForResponderChange]";
      v19 = 1024;
      v20 = v15;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "%s, set skipAutomaticResumeDictation=%d", (uint8_t *)&v17, 0x12u);

    }
    m_resumeDictationForResponderChange = self->m_resumeDictationForResponderChange;
    self->m_resumeDictationForResponderChange = 0;

  }
  else
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldResumeDictation:", 0);

    v9 = self->m_resumeDictationForResponderChange;
    self->m_resumeDictationForResponderChange = 0;

  }
}

- (void)resumeDictationForResponderChange
{
  void *v3;
  int v4;
  UIDelayedAction *m_resumeDictationForResponderChange;
  void *v6;
  int v7;
  void *v8;
  UIDelayedAction *v9;
  UIDelayedAction *v10;
  UIDelayedAction *v11;

  if (+[UIDictationController isRunning](UIDictationController, "isRunning")
    && (+[UIDictationController sharedInstance](UIDictationController, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isDictationPaused"),
        v3,
        v4))
  {
    m_resumeDictationForResponderChange = self->m_resumeDictationForResponderChange;
    if (m_resumeDictationForResponderChange)
    {
      -[UIDelayedAction touch](m_resumeDictationForResponderChange, "touch");
    }
    else
    {
      v10 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_handleDictationForResponderChange, 0, 0.5);
      v11 = self->m_resumeDictationForResponderChange;
      self->m_resumeDictationForResponderChange = v10;

    }
  }
  else
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldResumeDictation");

    if (v7)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShouldResumeDictation:", 0);

      v9 = self->m_resumeDictationForResponderChange;
      self->m_resumeDictationForResponderChange = 0;

    }
  }
}

- (void)assertTextForDictation
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = v3;
    v4 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
    v3 = v13;
    if (!v4)
    {
      -[UIKeyboardImpl documentState](self, "documentState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextBeforeInput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");
      objc_msgSend(v5, "selectedText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      objc_msgSend(v5, "fullString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textOperations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTextToAssert:", v10);

      objc_msgSend(v13, "textOperations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectionRangeToAssert:", v7, v9);

      objc_msgSend(v13, "flushOperations");
      v3 = v13;
    }
  }

}

- (id)inlineCompletionAsMarkedText
{
  return -[_UIKeyboardStateManager inlineCompletionAsMarkedText](self->_keyboardStateManager, "inlineCompletionAsMarkedText");
}

- (void)handleGrammarCorrectionEntries:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forwardGrammarCorrectionEntries:", v5);

  }
  else
  {
    +[UITextChecker handleGrammarCorrectionEntries:](UITextChecker, "handleGrammarCorrectionEntries:", v5);
  }

}

- (BOOL)shouldIgnoreTextInputChanges
{
  return -[_UIKeyboardStateManager textInputChangesIgnored](self->_keyboardStateManager, "textInputChangesIgnored");
}

- (void)setShouldIgnoreTextInputChanges:(BOOL)a3
{
  -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", a3);
}

- (_UITextInputUserInteractionDelegate)userInteractionDelegate
{
  return -[_UIKeyboardStateManager userInteractionDelegate](self->_keyboardStateManager, "userInteractionDelegate");
}

- (void)setUserInteractionDelegate:(id)a3
{
  -[_UIKeyboardStateManager setUserInteractionDelegate:](self->_keyboardStateManager, "setUserInteractionDelegate:", a3);
}

+ (void)setParentTestForProfiling:(id)a3
{
  objc_storeStrong((id *)&kbProfilingParentTest, a3);
}

+ (void)sendPerformanceNotification:(id)a3
{
  objc_msgSend(a1, "sendPerformanceNotification:userInfo:", a3, 0);
}

+ (void)sendPerformanceNotification:(id)a3 userInfo:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  if (kbProfilingParentTest)
  {
    v5 = (void *)MEMORY[0x1E0CB37D0];
    v6 = a4;
    v7 = a3;
    objc_msgSend(v5, "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", v7, 0, v6);

  }
}

- (void)_setInputManager:(id)a3
{
  -[_UIKeyboardStateManager _setInputManager:](self->_keyboardStateManager, "_setInputManager:", a3);
}

- (void)_setShiftLockedEnabled:(BOOL)a3
{
  -[_UIKeyboardStateManager setShiftLockedEnabled:](self->_keyboardStateManager, "setShiftLockedEnabled:", a3);
}

- (void)updateFromTextInputTraits
{
  -[UIKeyboardImpl takeTextInputTraitsFromDelegate](self, "takeTextInputTraitsFromDelegate");
  -[UIKeyboardImpl updateReturnKey:](self, "updateReturnKey:", 1);
}

- (BOOL)_isShowingCandidateUIWithAvailableCandidates
{
  _BOOL4 v3;
  void *v4;
  char v5;

  _UIDeviceNativeUserInterfaceIdiom();
  v3 = -[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar");
  if (v3)
  {
    -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasCandidates");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (int64_t)_needAutofillCandidate:(id)a3
{
  return -[_UIKeyboardStateManager needAutofillCandidate:](self->_keyboardStateManager, "needAutofillCandidate:", a3);
}

- (void)_setAutofillGroup:(id)a3
{
  -[_UIKeyboardStateManager _setAutofillGroup:](self->_keyboardStateManager, "_setAutofillGroup:", a3);
}

- (id)_autofillGroup
{
  void *v2;
  void *v3;

  -[_UIKeyboardStateManager autofillController](self->_keyboardStateManager, "autofillController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autofillGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_fallbackAutofillGroup
{
  void *v2;
  void *v3;

  -[_UIKeyboardStateManager autofillController](self->_keyboardStateManager, "autofillController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fallbackAutofillGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_containsUsernamePasswordPairsInAutofillGroup:(id)a3
{
  _UIKeyboardStateManager *keyboardStateManager;
  id v4;
  void *v5;
  char v6;

  keyboardStateManager = self->_keyboardStateManager;
  v4 = a3;
  -[_UIKeyboardStateManager autofillController](keyboardStateManager, "autofillController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsUsernamePasswordPairsInAutofillGroup:", v4);

  return v6;
}

- (void)_setCandidateController:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->m_candidateController, a3);
  v5 = a3;
  -[_UIKeyboardStateManager _setCandidateList:](self->_keyboardStateManager, "_setCandidateList:", v5);

}

- (BOOL)isSelectionChanging
{
  return -[_UIKeyboardStateManager isSelectionChanging](self->_keyboardStateManager, "isSelectionChanging");
}

- (void)createTypoTrackerReport
{
  -[_UIKeyboardStateManager createTypoTrackerReport](self->_keyboardStateManager, "createTypoTrackerReport");
}

- (void)presentKeyboardFeedbackAssistantViewControllerForLogURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forwardTypologyLogURL:", v4);

  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v6 = (void *)qword_1ECD78478;
    v19 = qword_1ECD78478;
    v7 = MEMORY[0x1E0C809B0];
    if (!qword_1ECD78478)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getKFAViewControllerClass_block_invoke;
      location[3] = &unk_1E16B14C0;
      location[4] = &v16;
      __getKFAViewControllerClass_block_invoke((uint64_t)location);
      v6 = (void *)v17[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v16, 8);
    v9 = objc_alloc_init(v8);
    -[UIKeyboardImpl setKeyboardFeedbackAssistantViewController:](self, "setKeyboardFeedbackAssistantViewController:", v9);

    -[UIKeyboardImpl keyboardFeedbackAssistantViewController](self, "keyboardFeedbackAssistantViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", self);

    objc_initWeak(location, self);
    -[UIKeyboardImpl keyboardFeedbackAssistantViewController](self, "keyboardFeedbackAssistantViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke;
    v12[3] = &unk_1E16B7008;
    objc_copyWeak(&v14, location);
    v13 = v4;
    objc_msgSend(v11, "prepareWithCompletion:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }

}

void __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
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
  NSObject *v16;
  void *v17;
  uint8_t v18[16];
  _QWORD v19[5];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "keyboardFeedbackAssistantViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sheetPresentationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[UISheetPresentationControllerDetent mediumDetent](UISheetPresentationControllerDetent, "mediumDetent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDetents:", v9);

      objc_msgSend(v5, "delegateAsResponder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_window");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rootViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "presentedViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        do
        {
          objc_msgSend(v12, "presentedViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "presentedViewController");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v14;
        }
        while (v15);
      }
      else
      {
        v14 = v12;
      }
      objc_msgSend(v5, "hideKeyboard");
      objc_msgSend(v5, "keyboardFeedbackAssistantViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke_2;
      v19[3] = &unk_1E16B1B50;
      v19[4] = v5;
      v20 = *(id *)(a1 + 32);
      objc_msgSend(v14, "presentViewController:animated:completion:", v17, 1, v19);

    }
    else
    {
      _UIKeyboardImplLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Failed to prepare Keyboard Feedback Assistant.", v18, 2u);
      }

      objc_msgSend(v5, "setKeyboardFeedbackAssistantViewController:", 0);
    }
  }

}

void __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "keyboardFeedbackAssistantViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTypologyLogURL:", *(_QWORD *)(a1 + 40));

}

+ (id)keyboardWindow
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_responderWindow");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    objc_msgSend(v2, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

+ (id)keyboardScreen
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_responderWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v2, "window");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "screen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (BOOL)overrideNativeScreen
{
  return +[UIApplication _classicMode](UIApplication, "_classicMode") == 7;
}

- (void)_performInputViewControllerOutput:(id)a3
{
  -[_UIKeyboardStateManager _performInputViewControllerOutput:](self->_keyboardStateManager, "_performInputViewControllerOutput:", a3);
}

- (void)_requestInputManagerSync
{
  -[_UIKeyboardStateManager _requestInputManagerSync](self->_keyboardStateManager, "_requestInputManagerSync");
}

- (void)_tagTouchForTypingMenu:(unsigned int)a3
{
  uint64_t v3;
  void (*v4)(uint64_t);
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = *(_QWORD *)&a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = (void (*)(uint64_t))off_1ECD78488;
  v11 = off_1ECD78488;
  if (!off_1ECD78488)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getSBSTagTouchForTypingMenuSymbolLoc_block_invoke_0;
    v7[3] = &unk_1E16B14C0;
    v7[4] = &v8;
    __getSBSTagTouchForTypingMenuSymbolLoc_block_invoke_0(v7);
    v4 = (void (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    v4(v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void UIKBSBSTagTouchForTypingMenu(uint32_t)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("UIKeyboardImpl.m"), 292, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

- (void)clearExcessKeyboardMemory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegateRespectingForwardingDelegate:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      +[UIKBRenderer clearInternalCaches](UIKBRenderer, "clearInternalCaches");
      +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commitTransaction");

      +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearNonPersistentCache");

      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = self->m_keyedLayouts;
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            -[NSMutableDictionary objectForKey:](self->m_keyedLayouts, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "clearUnusedObjects:", 1);

            ++v11;
          }
          while (v9 != v11);
          v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

    }
    -[UIKeyboardLayout updateTouchProcessingForKeyboardChange](self->m_layout, "updateTouchProcessingForKeyboardChange", (_QWORD)v13);
  }
}

- (BOOL)keyboardDrawsOpaque
{
  _BOOL8 v3;

  v3 = -[UIView isOpaque](self->m_layout, "isOpaque");
  if (v3 != -[UIView isOpaque](self, "isOpaque"))
    -[UIView setOpaque:](self, "setOpaque:", v3);
  return v3;
}

- (void)clearLanguageIndicator
{
  UIView *m_languageIndicator;
  UIView *v4;

  m_languageIndicator = self->m_languageIndicator;
  if (m_languageIndicator)
  {
    -[UIView removeFromSuperview](m_languageIndicator, "removeFromSuperview");
    v4 = self->m_languageIndicator;
    self->m_languageIndicator = 0;

  }
}

- (BOOL)_shouldMinimizeForHardwareKeyboard
{
  _UIKeyboardStateManager *keyboardStateManager;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;
  void *v9;

  if (!+[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate](UIKeyboardVisualModeManager, "softwareKeyboardAllowedForActiveKeyboardSceneDelegate"))return 1;
  keyboardStateManager = self->_keyboardStateManager;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardStateManager setHardwareKeyboardAttached:](keyboardStateManager, "setHardwareKeyboardAttached:", objc_msgSend(v4, "_isHardwareKeyboardAvailable"));

  if (-[UIKeyboardImpl _shouldSuppressSoftwareKeyboardByOneness](self, "_shouldSuppressSoftwareKeyboardByOneness"))
    return 1;
  if (!-[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached")
    || !-[UIKeyboardImpl automaticMinimizationEnabled](self, "automaticMinimizationEnabled"))
  {
    return 0;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentInputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "showSWLayoutWithHWKeyboard") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "keyboardAppearance") != 127;

  }
  return v5;
}

- (BOOL)_showsScribbleIconsInAssistantView
{
  _BOOL4 v3;

  v3 = +[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled");
  if (v3)
  {
    if (-[UIKeyboardImpl _shouldSuppressAssistantBar](self, "_shouldSuppressAssistantBar"))
    {
      LOBYTE(v3) = 0;
    }
    else if (-[UIKeyboardImpl _shouldSuppressSoftwareKeyboard](self, "_shouldSuppressSoftwareKeyboard")
           || (v3 = -[UIKeyboardImpl floatingForced](self, "floatingForced")))
    {
      v3 = +[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate](UIKeyboardVisualModeManager, "softwareKeyboardAllowedForActiveKeyboardSceneDelegate");
      if (v3)
      {
        if (-[UIKeyboardImpl isEmojiPopoverPresented](self, "isEmojiPopoverPresented"))
          LOBYTE(v3) = 1;
        else
          LOBYTE(v3) = !-[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch");
      }
    }
  }
  return v3;
}

- (BOOL)_shouldSuppressSoftwareKeyboardByDictation
{
  void *v2;
  char v3;

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSuppressSoftwareKeyboard");

  return v3;
}

- (BOOL)_shouldSuppressSoftwareKeyboardByOneness
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hardwareKeyboardExclusivityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardStateManager hardwareKeyboardExclusivityIdentifier](self->_keyboardStateManager, "hardwareKeyboardExclusivityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (BOOL)_shouldSuppressSoftwareKeyboardAndAssistantView
{
  void *v3;
  char v4;
  _BOOL4 v5;

  if (-[UIKeyboardImpl _shouldSuppressSoftwareKeyboardByDictation](self, "_shouldSuppressSoftwareKeyboardByDictation")
    || (+[UIKeyboardCameraSession activeSession](UIKeyboardCameraSession, "activeSession"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "shouldSuppressSoftwareKeyboard"),
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[UIKeyboardImpl _shouldSuppressSoftwareKeyboard](self, "_shouldSuppressSoftwareKeyboard");
    if (v5)
      LOBYTE(v5) = !-[UIKeyboardImpl _showsScribbleIconsInAssistantView](self, "_showsScribbleIconsInAssistantView");
  }
  return v5;
}

- (BOOL)_shouldSuppressSoftwareKeyboard
{
  void *v3;
  char v4;

  if (-[UIKeyboardImpl _shouldSuppressSoftwareKeyboardByDictation](self, "_shouldSuppressSoftwareKeyboardByDictation"))
    return 1;
  if (-[UIKeyboardImpl _shouldSuppressSoftwareKeyboardByOneness](self, "_shouldSuppressSoftwareKeyboardByOneness"))
    return 1;
  +[UIKeyboardCameraSession activeSession](UIKeyboardCameraSession, "activeSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldSuppressSoftwareKeyboard");

  return (v4 & 1) != 0
      || -[UIKeyboardImpl _shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:](self, "_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:", 0);
}

- (BOOL)_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[UIKeyboardImpl _shouldSuppressSoftwareKeyboardForResponder:ignoringPolicyDelegate:](self, "_shouldSuppressSoftwareKeyboardForResponder:ignoringPolicyDelegate:", v5, v3);

  return v3;
}

- (void)_setShouldSuppressSoftwareKeyboard:(BOOL)a3
{
  self->m_shouldSuppressSoftwareKeyboard = a3;
}

- (void)unsetPolicyDelegateResult
{
  self->m_policyDelegateResult = 0;
}

- (BOOL)_shouldSuppressSoftwareKeyboardForResponder:(id)a3 ignoringPolicyDelegate:(BOOL)a4
{
  id v6;
  char m_shouldSuppressSoftwareKeyboard;
  uint64_t v8;
  void *v9;

  v6 = a3;
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    m_shouldSuppressSoftwareKeyboard = self->m_shouldSuppressSoftwareKeyboard;
  }
  else
  {
    m_shouldSuppressSoftwareKeyboard = objc_msgSend(v6, "_suppressSoftwareKeyboard");
    if ((m_shouldSuppressSoftwareKeyboard & 1) == 0 && !a4)
    {
      +[UIKeyboard suppressionPolicyDelegate](UIKeyboard, "suppressionPolicyDelegate");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled")
          && -[UIKeyboardImpl _textInputSourceForDelegate:](self, "_textInputSourceForDelegate:", v6) == 2)
        {
          m_shouldSuppressSoftwareKeyboard = self->m_policyDelegateResult;
        }
        else
        {
          m_shouldSuppressSoftwareKeyboard = objc_msgSend(v9, "_shouldSuppressForDelegate:", v6);
          self->m_policyDelegateResult = m_shouldSuppressSoftwareKeyboard;
        }

      }
      else
      {
        m_shouldSuppressSoftwareKeyboard = 0;
      }
    }
  }

  return m_shouldSuppressSoftwareKeyboard;
}

- (void)_updateKeyboardLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UITextInputUpdateKeyboardLanguageKey"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputModeIdentifierLastUsedForLanguage:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (id)UIKeyboardActiveInputModes;
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setInputMode:userInitiated:", v5, 1);

    }
  }

}

- (void)_setShouldSuppressAssistantBar:(BOOL)a3
{
  self->m_shouldSuppressAssistantBar = a3;
}

- (BOOL)_shouldSuppressAssistantBar
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (!+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI")
    && !-[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "wantsAssistantWhileSuppressingKeyboard");

    if ((v4 & 1) == 0)
    {
      +[UIKeyboard suppressionPolicyDelegate](UIKeyboard, "suppressionPolicyDelegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        +[UIKeyboard suppressionPolicyDelegate](UIKeyboard, "suppressionPolicyDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardImpl inputDelegate](self, "inputDelegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v6, "_shouldSuppressAssistantBarForDelegate:", v7);

      }
      else
      {
        v8 = 0;
      }

      if (self->m_shouldSuppressAssistantBar != v8)
      {
        self->m_shouldSuppressAssistantBar = v8;
        +[UIAssistantBarButtonItemProvider dismissFloatingKeyboardFromPencilKitIfNeeded](UIAssistantBarButtonItemProvider, "dismissFloatingKeyboardFromPencilKitIfNeeded");
      }
    }
  }
  return self->m_shouldSuppressAssistantBar;
}

- (void)_updateKeyboardSuppression:(id)a3
{
  -[UIKeyboardImpl _suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:](self, "_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:", 0);
}

- (void)_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;
  int v10;
  _BOOL8 v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  char v19;
  id v20;

  v3 = a3;
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyInputDelegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_24;
  v7 = (void *)v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  if ((objc_msgSend(WeakRetained, "isActive") & 1) == 0)
  {

    goto LABEL_23;
  }
  v9 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  v10 = objc_msgSend(v9, "isAutomatic");

  if (v10)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIKeyboardImpl _shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:](self, "_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:", v3);
    v12 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
    v13 = objc_msgSend(v12, "isMinimized");

    if (!v13)
    {
      if (v11)
        -[UIKeyboardImpl hideKeyboardIgnoringHardwareLayouts:](self, "hideKeyboardIgnoringHardwareLayouts:", 1);
      goto LABEL_20;
    }
    if (v11 || -[UIKeyboardImpl _shouldMinimizeForHardwareKeyboard](self, "_shouldMinimizeForHardwareKeyboard"))
    {
      if (-[UIKeyboardImpl floatingForced](self, "floatingForced"))
        goto LABEL_20;
      objc_msgSend(v5, "keyboardWindow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rootViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "placement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "showsInputOrAssistantViews"))
      {
        v17 = -[UIKeyboardImpl _shouldSuppressAssistantBar](self, "_shouldSuppressAssistantBar");

        if (!v17)
          goto LABEL_18;
      }
      else
      {

      }
      objc_msgSend(v5, "minimize");
    }
    else
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "handlingRemoteEvent");

      if ((v19 & 1) == 0)
      {
        -[UIKeyboardImpl _showKeyboardIgnoringPolicyDelegate:](self, "_showKeyboardIgnoringPolicyDelegate:", v3);
LABEL_20:
        if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1 && !v3)
          goto LABEL_24;
        -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "forwardKeyboardSuppression:suppressAssistantBar:", v11, -[UIKeyboardImpl _shouldSuppressAssistantBar](self, "_shouldSuppressAssistantBar"));
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      v15 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
      objc_msgSend(v15, "setMinimized:", 0);
    }
LABEL_18:

    goto LABEL_20;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotificationName:object:", CFSTR("UIKeyboardSuppressionDidChange"), 0);

}

- (void)setInitialDirection
{
  -[_UIKeyboardStateManager setInitialDirection](self->_keyboardStateManager, "setInitialDirection");
}

- (UITextInteractionAssistant)textInteractionAssistant
{
  return -[_UIKeyboardStateManager textInteractionAssistant](self->_keyboardStateManager, "textInteractionAssistant");
}

- (_UITextInteractionEditMenuAssistant)_editMenuAssistant
{
  return -[_UIKeyboardStateManager _editMenuAssistant](self->_keyboardStateManager, "_editMenuAssistant");
}

- (_UITextChoiceAccelerationAssistant)_textChoicesAssistant
{
  return -[_UIKeyboardStateManager _textChoicesAssistant](self->_keyboardStateManager, "_textChoicesAssistant");
}

- (void)setSplit:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout setSplit:animated:](self->m_layout, "setSplit:animated:", v5, v4);
}

- (void)traitCollectionDidChange
{
  void *v3;
  id v4;

  -[UIKeyboardImpl takeTextInputTraitsFromDelegate](self, "takeTextInputTraitsFromDelegate");
  -[UIKeyboardImpl activeLayout](self, "activeLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollectionDidChange");

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI"))
  {
    -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentTraitsChanged");

  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "__isKindOfUIResponder") & 1) == 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateAsResponder");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (v5)
  {
    v8 = (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v5, "keyboardAppearance") == 10;

  }
  else
  {
    v8 = 1;
  }
  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceStyle");

  if (v8)
  {
    -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12;
      if (v10 == 2)
        v13 = 1;
      else
        v13 = 2;
      objc_msgSend(v12, "setKeyboardAppearance:", v13);

    }
  }
}

- (void)finishSplitTransitionWithProgress:(double)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKeyboardLayout finishSplitTransitionWithProgress:](self->m_layout, "finishSplitTransitionWithProgress:", a3);
  +[UIKeyboardImpl setPersistentSplitProgress:](UIKeyboardImpl, "setPersistentSplitProgress:", a3);
}

- (void)setTextInputChangesIgnored:(BOOL)a3
{
  -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", a3);
}

- (BOOL)isUsingDictationLayout
{
  void *v2;
  void *v3;
  char isKindOfClass;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isExtensionInputMode") & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_layout
{
  return self->m_layout;
}

- (BOOL)allowsReachableKeyboard
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL result;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_unjailedReferenceBounds");
  v5 = v4;

  _UIDeviceNativeUserInterfaceIdiom();
  v6 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  -[UIKeyboardImpl _layout](self, "_layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "orientation");

  result = 0;
  if (v6 != 1 && v5 > 320.0 && (unint64_t)(v8 - 3) >= 2)
    return !-[UIKeyboardImpl keyboardIsKeyPad](self, "keyboardIsKeyPad");
  return result;
}

- (int64_t)currentHandBias
{
  return -[UIKeyboardLayout currentHandBias](self->m_layout, "currentHandBias");
}

- (double)biasedKeyboardWidthRatio
{
  double result;

  -[UIKeyboardLayout biasedKeyboardWidthRatio](self->m_layout, "biasedKeyboardWidthRatio");
  return result;
}

- (void)acceptAutocorrectionAndEndComposition
{
  void *v3;
  void *v4;

  -[UIKeyboardImpl autocorrectionController](self, "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIKeyboardImpl acceptAutocorrectionWithCompletionHandler:](self, "acceptAutocorrectionWithCompletionHandler:", 0);
  else
    -[UIKeyboardImpl textAccepted:](self, "textAccepted:", 0);
}

- (BOOL)globeKeyDisplaysAsEmojiKey
{
  void *v2;
  char v3;

  -[UIKeyboardImpl _layout](self, "_layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "globeKeyDisplaysAsEmojiKey");

  return v3;
}

- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton
{
  void *v2;
  char v3;

  -[UIKeyboardImpl _layout](self, "_layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDedicatedEmojiKeyAlongsideGlobeButton");

  return v3;
}

- (id)internationalKeyDisplayStringOnEmojiKeyboard
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExtensionInputMode");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[UIKeyboardImpl _layout](self, "_layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "internationalKeyDisplayStringOnEmojiKeyboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_autofillContext
{
  void *v2;
  void *v3;

  -[UIKeyboardImpl keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autofillContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_remoteAppId
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_remoteLocalizedAppName
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedAppName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_remoteUnlocalizedAppName
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_remoteAssociatedDomains
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "associatedDomains");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_passwordRules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[_UIKeyboardStateManager autofillController](self->_keyboardStateManager, "autofillController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "autofillGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("password"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIKeyboardStateManager autofillController](self->_keyboardStateManager, "autofillController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autofillGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("new-password"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v11 = v10 == 0;
    else
      v11 = 0;
    v12 = v4;
    if (v11 || (!v4 ? (v13 = v10 == 0) : (v13 = 1), v12 = v10, !v13))
    {
      v20 = v12;
      goto LABEL_27;
    }
    if (v4)
      v14 = v10 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "passwordRules");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "passwordRulesDescriptor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          v18 = v4;
LABEL_20:
          objc_msgSend(v18, "passwordRules");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          goto LABEL_30;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "passwordRules");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "passwordRulesDescriptor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23)
          {
            v18 = v10;
            goto LABEL_20;
          }
        }
      }
    }
    v20 = 0;
LABEL_27:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_32;
    }
    objc_msgSend(v20, "passwordRules");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
    objc_msgSend(v19, "passwordRulesDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
    goto LABEL_33;
  }
  -[UIKeyboardImpl inputSystemSourceSession](self, "inputSystemSourceSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "passwordRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v5;
}

- (BOOL)shouldLoadAutofillSignUpInputViewController
{
  return -[_UIKeyboardStateManager shouldLoadAutofillSignUpInputViewController](self->_keyboardStateManager, "shouldLoadAutofillSignUpInputViewController");
}

- (void)_showAutofillExtras
{
  UIKeyboardSafariPresentCredentialPickerForType(1);
}

- (void)_deactiveActiveKeys
{
  -[UIKeyboardLayout deactivateActiveKeys](self->m_layout, "deactivateActiveKeys");
}

- (void)performBlockWithTextInputChangesIgnoredForNonMacOS:(id)a3
{
  _UIKeyboardStateManager *keyboardStateManager;
  void (**v5)(_QWORD);
  uint64_t v6;

  keyboardStateManager = self->_keyboardStateManager;
  v5 = (void (**)(_QWORD))a3;
  v6 = -[_UIKeyboardStateManager textInputChangesIgnored](keyboardStateManager, "textInputChangesIgnored");
  -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", 1);
  v5[2](v5);

  -[_UIKeyboardStateManager setTextInputChangesIgnored:](self->_keyboardStateManager, "setTextInputChangesIgnored:", v6);
}

- (BOOL)hardwareKeyboardAttached
{
  return -[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached");
}

- (void)setHardWareKeyboardAttached:(BOOL)a3
{
  -[_UIKeyboardStateManager setHardwareKeyboardAttached:](self->_keyboardStateManager, "setHardwareKeyboardAttached:", a3);
}

+ (BOOL)isHardwareShiftKeyBeingHeld
{
  objc_msgSend((id)UIApp, "_hardwareKeyboard:", 0);
  return (GSKeyboardGetLiveModifierState() & 0x220000) != 0;
}

+ (BOOL)isHardwareCommandKeyBeingHeld
{
  objc_msgSend((id)UIApp, "_hardwareKeyboard:", 0);
  return (GSKeyboardGetLiveModifierState() & 0x1010000) != 0;
}

- (BOOL)isShiftKeyBeingHeld
{
  BOOL v3;
  BOOL v4;

  v3 = +[UIKeyboardImpl isHardwareShiftKeyBeingHeld](UIKeyboardImpl, "isHardwareShiftKeyBeingHeld");
  v4 = -[UIKeyboardImpl callLayoutIsShiftKeyBeingHeld](self, "callLayoutIsShiftKeyBeingHeld");
  return v3 | v4 | -[UIKeyboardImpl _mimicShiftBeingHeld](self, "_mimicShiftBeingHeld");
}

- (void)moveCursorLeftShifted:(BOOL)a3
{
  _BOOL8 v3;
  UIKeyboardImpl *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  if (-[UIKeyboardImpl hasEditableMarkedText](self, "hasEditableMarkedText"))
  {
    if (v3)
    {
      v5 = self;
      v6 = 0;
LABEL_12:
      -[UIKeyboardImpl movePhraseBoundaryToDirection:granularity:](v5, "movePhraseBoundaryToDirection:granularity:", 1, v6);
      goto LABEL_13;
    }
    -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasCandidates");

    if (v11)
    {
      if (!-[UIKeyboardImpl cursorIsAtEndOfMarkedText](self, "cursorIsAtEndOfMarkedText"))
      {
LABEL_11:
        v5 = self;
        v6 = 1;
        goto LABEL_12;
      }
      -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "currentIndex") == 0x7FFFFFFFFFFFFFFFLL)
      {

        goto LABEL_11;
      }
      -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "currentIndex");

      if (!v14)
        goto LABEL_11;
      -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "showCandidateInForwardDirection:granularity:", 0, 0);

    }
  }
  else
  {
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl arrowKeyHistory](self, "arrowKeyHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_moveLeft:withHistory:", v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl setArrowKeyHistory:](self, "setArrowKeyHistory:", v9);

  }
LABEL_13:
  -[UIKeyboardImpl updateForChangedSelection](self, "updateForChangedSelection");
}

- (void)moveCursorRightShifted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  if (-[UIKeyboardImpl hasEditableMarkedText](self, "hasEditableMarkedText"))
  {
    if (!v3)
    {
      -[_UIKeyboardStateManager candidateResultSet](self->_keyboardStateManager, "candidateResultSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasCandidates");

      if (!v9)
        goto LABEL_5;
      if (-[UIKeyboardImpl cursorIsAtEndOfMarkedText](self, "cursorIsAtEndOfMarkedText"))
      {
        -[_UIKeyboardStateManager candidateList](self->_keyboardStateManager, "candidateList");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "showCandidateInForwardDirection:granularity:", 1, 0);

        goto LABEL_5;
      }
    }
    -[UIKeyboardImpl movePhraseBoundaryToDirection:granularity:](self, "movePhraseBoundaryToDirection:granularity:", 0, 0);
  }
  else
  {
    -[UIKeyboardImpl delegateAsResponder](self, "delegateAsResponder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl arrowKeyHistory](self, "arrowKeyHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_moveRight:withHistory:", v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardImpl setArrowKeyHistory:](self, "setArrowKeyHistory:", v7);

  }
LABEL_5:
  -[UIKeyboardImpl updateForChangedSelection](self, "updateForChangedSelection");
}

- (void)lookUpResponderChainForCustomInputView
{
  -[_UIKeyboardStateManager lookUpResponderChainForCustomInputView](self->_keyboardStateManager, "lookUpResponderChainForCustomInputView");
}

- (double)lastTouchDownTimestamp
{
  double result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0.0;
  -[UIKeyboardLayout lastTouchDownTimestamp](self->m_layout, "lastTouchDownTimestamp");
  return result;
}

- (BOOL)callShouldInsertText:(id)a3 onDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EDE21770))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EDE22B80))
    v10 = v7;
  else
    v10 = 0;
  v11 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_msgSend(v9, "keyboardInput:shouldInsertText:isMarkedText:", v9, v6, 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectedTextRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldChangeTextInRange:replacementText:", v14, v6);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)keyboardLayoutIsInAnotherProcess
{
  void *v3;
  _BOOL4 v4;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    && -[UIKeyboardImpl isRTIClient](self, "isRTIClient"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "automaticAppearanceEnabled"))
      v4 = !+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");
    else
      LOBYTE(v4) = 0;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)shouldApplyKeyboardCommandToUIHost
{
  _BOOL4 v3;

  v3 = -[_UIKeyboardStateManager hardwareKeyboardAttached](self->_keyboardStateManager, "hardwareKeyboardAttached");
  if (v3)
    LOBYTE(v3) = -[UIKeyboardImpl keyboardLayoutIsInAnotherProcess](self, "keyboardLayoutIsInAnotherProcess");
  return v3;
}

- (BOOL)isRTIClient
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "keyboardScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v3, -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "idiom") == 3)
  {
    v5 = 0;
  }
  else
  {
    -[UIKeyboardImpl remoteTextInputPartnerPrivate](self, "remoteTextInputPartnerPrivate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "inputSystemClientEnabled");

  }
  return v5;
}

- (BOOL)playInputClick
{
  _UIKBFeedbackGenerating *m_feedbackGenerator;

  m_feedbackGenerator = self->m_feedbackGenerator;
  if (m_feedbackGenerator)
    -[_UIKBFeedbackGenerating actionOccurred:](self->m_feedbackGenerator, "actionOccurred:", 1);
  return m_feedbackGenerator != 0;
}

- (BOOL)_isBackdropVisible
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;

  objc_msgSend((id)objc_opt_class(), "keyboardScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v3, -[UIView _keyboardOrientation](self, "_keyboardOrientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "keyboardAppearance");

  if (v6 == 127)
  {
    v7 = 0;
  }
  else
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Spotlight")) & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.SpotlightTest"));
    -[UIKeyboardImpl textInputTraits](self, "textInputTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "keyboardAppearance");

    if (v11 == 11)
      v7 = v9 ^ 1;
    else
      v7 = 1;

  }
  return v7;
}

- (BOOL)shouldShowContinuousPathIntroductionView
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "oneTimeActionCompleted:", *MEMORY[0x1E0DBDEE8]);

  if ((v5 & 1) != 0 || !-[UIKeyboardLayout _allowContinuousPathUI](self->m_layout, "_allowContinuousPathUI"))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.purplebuddy")) ^ 1;

  }
  return v7;
}

- (void)presentContinuousPathIntroductionView
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  UIContinuousPathIntroductionView *v7;
  void *v8;
  UIContinuousPathIntroductionView *v9;
  UIContinuousPathIntroductionView *continuousPathIntroductionView;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  _QWORD block[5];

  if ((objc_msgSend((id)UIApp, "isSuspended") & 1) == 0 && !-[UIKeyboardImpl isMinimized](self, "isMinimized"))
  {
    -[UIView window](self->_continuousPathIntroductionView, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else
    {
      -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "keyInputDelegate");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        v6 = -[UIKeyboardImpl shouldShowContinuousPathIntroductionView](self, "shouldShowContinuousPathIntroductionView");

        if (v6)
        {
          if (!self->_continuousPathIntroductionView)
          {
            v7 = [UIContinuousPathIntroductionView alloc];
            -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = -[UIContinuousPathIntroductionView initWithKeyboardAppearance:](v7, "initWithKeyboardAppearance:", objc_msgSend(v8, "keyboardAppearance"));
            continuousPathIntroductionView = self->_continuousPathIntroductionView;
            self->_continuousPathIntroductionView = v9;

          }
          -[UIView _rootInputWindowController](self, "_rootInputWindowController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bottomEdgeView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addSubview:", self->_continuousPathIntroductionView);

          v13 = dispatch_time(0, 500000000);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __55__UIKeyboardImpl_presentContinuousPathIntroductionView__block_invoke;
          block[3] = &unk_1E16B1B28;
          block[4] = self;
          v14 = MEMORY[0x1E0C80D38];
          dispatch_after(v13, MEMORY[0x1E0C80D38], block);
          v15 = dispatch_time(0, 300000000000);
          dispatch_after(v15, v14, &__block_literal_global_799);

        }
      }
      else
      {

      }
    }
  }
}

void __55__UIKeyboardImpl_presentContinuousPathIntroductionView__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didTriggerOneTimeAction:", *MEMORY[0x1E0DBDEE8]);

  }
}

void __55__UIKeyboardImpl_presentContinuousPathIntroductionView__block_invoke_2()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dismissContinuousPathIntroductionView");

}

- (void)dismissContinuousPathIntroductionView
{
  UIContinuousPathIntroductionView *continuousPathIntroductionView;
  UIContinuousPathIntroductionView *v4;

  continuousPathIntroductionView = self->_continuousPathIntroductionView;
  if (continuousPathIntroductionView)
  {
    -[UIContinuousPathIntroductionView removeFromSuperview](continuousPathIntroductionView, "removeFromSuperview");
    v4 = self->_continuousPathIntroductionView;
    self->_continuousPathIntroductionView = 0;

  }
}

- (BOOL)shouldShowEditingIntroductionView
{
  return +[UIKBEditingGesturesIntroduction shouldShowEditingIntroduction](UIKBEditingGesturesIntroduction, "shouldShowEditingIntroduction");
}

- (void)presentEditingIntroductionView
{
  UIKBEditingGesturesIntroduction *v3;
  void *v4;
  UIKBEditingGesturesIntroduction *v5;
  UIKBEditingGesturesIntroduction *editingGestureIntroductionView;
  void *v7;
  id v8;

  if (-[UIKeyboardImpl shouldShowEditingIntroductionView](self, "shouldShowEditingIntroductionView"))
  {
    if (!self->_editingGestureIntroductionView)
    {
      v3 = [UIKBEditingGesturesIntroduction alloc];
      -[_UIKeyboardStateManager textInputTraits](self->_keyboardStateManager, "textInputTraits");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[UIKBTutorialModalDisplay initWithKeyboardAppearance:](v3, "initWithKeyboardAppearance:", objc_msgSend(v4, "keyboardAppearance"));
      editingGestureIntroductionView = self->_editingGestureIntroductionView;
      self->_editingGestureIntroductionView = v5;

    }
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomEdgeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_editingGestureIntroductionView);

  }
}

- (void)dismissEditingIntroductionView
{
  UIKBEditingGesturesIntroduction *editingGestureIntroductionView;
  UIKBEditingGesturesIntroduction *v4;

  editingGestureIntroductionView = self->_editingGestureIntroductionView;
  if (editingGestureIntroductionView)
  {
    -[UIView removeFromSuperview](editingGestureIntroductionView, "removeFromSuperview");
    v4 = self->_editingGestureIntroductionView;
    self->_editingGestureIntroductionView = 0;

  }
}

- (void)presentStickerEditorWithStickerIdentifier:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  UIKeyboardStickerEditorViewController *v9;
  UIKeyboardStickerEditorViewController *stickerEditorViewController;
  id v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  if (self->_stickerEditorViewController)
    -[UIKeyboardImpl dismissStickerEditor:](self, "dismissStickerEditor:", 0);
  v9 = -[UIKeyboardStickerEditorViewController initWithStickerIdentifier:sourceRect:]([UIKeyboardStickerEditorViewController alloc], "initWithStickerIdentifier:sourceRect:", v11, x, y, width, height);
  stickerEditorViewController = self->_stickerEditorViewController;
  self->_stickerEditorViewController = v9;

  -[UIKeyboardStickerEditorViewController showInKeyboard](self->_stickerEditorViewController, "showInKeyboard");
}

- (void)dismissStickerEditor:(BOOL)a3
{
  UIKeyboardStickerEditorViewController *stickerEditorViewController;
  UIKeyboardStickerEditorViewController *v5;

  stickerEditorViewController = self->_stickerEditorViewController;
  if (stickerEditorViewController)
  {
    -[UIKeyboardStickerEditorViewController dismissAnimated:](stickerEditorViewController, "dismissAnimated:", a3);
    v5 = self->_stickerEditorViewController;
    self->_stickerEditorViewController = 0;

  }
}

- (void)presentMultilingualKeyboardTip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  dispatch_time_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIKBMultilingualKeyboardIntroductionView *multilingualKeyboardIntroductionView;
  UIKBMultilingualKeyboardIntroductionView *v18;
  UIKBMultilingualKeyboardIntroductionView *v19;
  void *v20;
  void *v21;
  _QWORD block[5];

  v4 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "oneTimeActionCompleted:", CFSTR("MultilingualKeyboardTip"));

  if ((v7 & 1) == 0)
  {
    v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__UIKeyboardImpl_presentMultilingualKeyboardTip___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
    -[UIKeyboardImpl keyboardIntroductionFrame](self, "keyboardIntroductionFrame");
    v13 = v9;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    multilingualKeyboardIntroductionView = self->_multilingualKeyboardIntroductionView;
    if (!multilingualKeyboardIntroductionView)
    {
      v18 = -[UIKBMultilingualKeyboardIntroductionView initWithInputMode:frame:]([UIKBMultilingualKeyboardIntroductionView alloc], "initWithInputMode:frame:", v4, v9, v10, v11, v12);
      v19 = self->_multilingualKeyboardIntroductionView;
      self->_multilingualKeyboardIntroductionView = v18;

      multilingualKeyboardIntroductionView = self->_multilingualKeyboardIntroductionView;
    }
    -[UIView setFrame:](multilingualKeyboardIntroductionView, "setFrame:", v13, v14, v15, v16);
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomEdgeView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSubview:", self->_multilingualKeyboardIntroductionView);

  }
}

void __49__UIKeyboardImpl_presentMultilingualKeyboardTip___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didTriggerOneTimeAction:", CFSTR("MultilingualKeyboardTip"));

  }
}

- (void)dismissMultilingualKeyboardTip
{
  UIKBMultilingualKeyboardIntroductionView *multilingualKeyboardIntroductionView;
  UIKBMultilingualKeyboardIntroductionView *v4;

  multilingualKeyboardIntroductionView = self->_multilingualKeyboardIntroductionView;
  if (multilingualKeyboardIntroductionView)
  {
    -[UIView removeFromSuperview](multilingualKeyboardIntroductionView, "removeFromSuperview");
    v4 = self->_multilingualKeyboardIntroductionView;
    self->_multilingualKeyboardIntroductionView = 0;

  }
}

- (void)presentMultilingualSettingTip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  dispatch_time_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIKBMultilingualSettingIntroductionView *v13;
  UIKBMultilingualSettingIntroductionView *multilingualSettingIntroductionView;
  void *v15;
  void *v16;
  _QWORD block[5];

  v4 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "oneTimeActionCompleted:", CFSTR("MultilingualSettingTip"));

  if ((v7 & 1) == 0)
  {
    v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__UIKeyboardImpl_presentMultilingualSettingTip___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
    -[UIKeyboardImpl keyboardIntroductionFrame](self, "keyboardIntroductionFrame");
    if (!self->_multilingualSettingIntroductionView)
    {
      v13 = -[UIKBMultilingualSettingIntroductionView initWithInputMode:frame:]([UIKBMultilingualSettingIntroductionView alloc], "initWithInputMode:frame:", v4, v9, v10, v11, v12);
      multilingualSettingIntroductionView = self->_multilingualSettingIntroductionView;
      self->_multilingualSettingIntroductionView = v13;

    }
    -[UIView _rootInputWindowController](self, "_rootInputWindowController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bottomEdgeView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_multilingualSettingIntroductionView);

  }
}

void __48__UIKeyboardImpl_presentMultilingualSettingTip___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "superview");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "didTriggerOneTimeAction:", CFSTR("MultilingualSettingTip"));

  }
}

- (void)dismissMultilingualSettingTip
{
  UIKBMultilingualSettingIntroductionView *multilingualSettingIntroductionView;
  UIKBMultilingualSettingIntroductionView *v4;

  multilingualSettingIntroductionView = self->_multilingualSettingIntroductionView;
  if (multilingualSettingIntroductionView)
  {
    -[UIView removeFromSuperview](multilingualSettingIntroductionView, "removeFromSuperview");
    v4 = self->_multilingualSettingIntroductionView;
    self->_multilingualSettingIntroductionView = 0;

  }
}

- (void)_shouldClearTextSuggestions:(BOOL)a3
{
  -[_UIKeyboardStateManager _shouldClearTextSuggestions:](self->_keyboardStateManager, "_shouldClearTextSuggestions:", a3);
}

- (void)restoreTextSuggestions
{
  -[_UIKeyboardStateManager restoreTextSuggestions](self->_keyboardStateManager, "restoreTextSuggestions");
}

- (UIKBTree)currentKey
{
  return 0;
}

- (void)restoreFocusFromEntryPoint:(CGPoint)a3
{
  -[UIKeyboardLayout restoreFocusFromEntryPoint:](self->m_layout, "restoreFocusFromEntryPoint:", a3.x, a3.y);
}

- (unint64_t)serviceRole
{
  return -[_UIKeyboardStateManager serviceRole](self->_keyboardStateManager, "serviceRole");
}

- (void)setServiceRole:(unint64_t)a3
{
  -[_UIKeyboardStateManager setServiceRole:](self->_keyboardStateManager, "setServiceRole:", a3);
}

- (BOOL)skipRecomputeInputMode
{
  return -[_UIKeyboardStateManager skipRecomputeInputMode](self->_keyboardStateManager, "skipRecomputeInputMode");
}

- (void)setSkipRecomputeInputMode:(BOOL)a3
{
  -[_UIKeyboardStateManager setSkipRecomputeInputMode:](self->_keyboardStateManager, "setSkipRecomputeInputMode:", a3);
}

- (id)keyboardWindowSnapshot
{
  return -[_UIKeyboardStateManager keyboardWindowSnapshot](self->_keyboardStateManager, "keyboardWindowSnapshot");
}

- (void)clearKeyboardWindowSnapshot
{
  -[_UIKeyboardStateManager clearKeyboardWindowSnapshot](self->_keyboardStateManager, "clearKeyboardWindowSnapshot");
}

- (void)updateIdleDetection:(int64_t)a3
{
  -[_UIKeyboardStateManager updateIdleDetection:](self->_keyboardStateManager, "updateIdleDetection:", a3);
}

- (void)textSelectionInteractionWillBegin:(id)a3
{
  -[UIKeyboardImpl updateIdleDetection:](self, "updateIdleDetection:", 5);
}

- (void)forwardDictationEvent_switchToDictationInputModeWithOptions:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v9 = forwardDictationEvent_switchToDictationInputModeWithOptions____s_category_0;
    if (!forwardDictationEvent_switchToDictationInputModeWithOptions____s_category_0)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&forwardDictationEvent_switchToDictationInputModeWithOptions____s_category_0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v11, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_switchToDictationInputModeWithOptions_, v4);

}

- (void)forwardDictationEvent_handleDictationShouldPause:(BOOL)a3 withNewDelagate:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  int has_internal_diagnostics;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[3];

  v4 = a4;
  v5 = a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v8 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v8)
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", v16, 2u);
      }

    }
  }
  else if (!v8)
  {
    v14 = forwardDictationEvent_handleDictationShouldPause_withNewDelagate____s_category_0;
    if (!forwardDictationEvent_handleDictationShouldPause_withNewDelagate____s_category_0)
    {
      v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&forwardDictationEvent_handleDictationShouldPause_withNewDelagate____s_category_0);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v16, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = CFSTR("shouldPause");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("withNewDelagate");
  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleDictationShouldPause_withNewDelagate_, v12);

}

- (void)forwardDictationEvent_switchToDictationLanguage:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v9 = forwardDictationEvent_switchToDictationLanguage____s_category_0;
    if (!forwardDictationEvent_switchToDictationLanguage____s_category_0)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&forwardDictationEvent_switchToDictationLanguage____s_category_0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v11, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_switchToDictationLanguage_, v4);

}

- (void)forwardDictationEvent_startDictation
{
  int has_internal_diagnostics;
  BOOL v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v7 = forwardDictationEvent_startDictation___s_category_0;
    if (!forwardDictationEvent_startDictation___s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&forwardDictationEvent_startDictation___s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v9, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_startDictation, 0);

}

- (void)forwardDictationEvent_stopDictation:(BOOL)a3
{
  _BOOL8 v3;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v10 = forwardDictationEvent_stopDictation____s_category_0;
    if (!forwardDictationEvent_stopDictation____s_category_0)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&forwardDictationEvent_stopDictation____s_category_0);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v12, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_stopDictation_, v8);

}

- (void)forwardDictationEvent_cancelDictation
{
  int has_internal_diagnostics;
  BOOL v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v7 = forwardDictationEvent_cancelDictation___s_category_0;
    if (!forwardDictationEvent_cancelDictation___s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&forwardDictationEvent_cancelDictation___s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v9, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_cancelDictation, 0);

}

- (void)forwardDictationEvent_movePopoverView:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v9 = forwardDictationEvent_movePopoverView____s_category_0;
    if (!forwardDictationEvent_movePopoverView____s_category_0)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&forwardDictationEvent_movePopoverView____s_category_0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v11, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_movePopoverView_, v4);

}

- (void)forwardDictationEvent_handleTip:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  int has_internal_diagnostics;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v9 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v9)
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", v16, 2u);
      }

    }
  }
  else if (!v9)
  {
    v14 = forwardDictationEvent_handleTip_title____s_category_0;
    if (!forwardDictationEvent_handleTip_title____s_category_0)
    {
      v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&forwardDictationEvent_handleTip_title____s_category_0);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v16, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
  {
    v17[0] = CFSTR("text");
    v17[1] = CFSTR("title");
    v18[0] = v6;
    v18[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_handleTip_, v12);

  }
  else
  {
    objc_msgSend(v10, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_handleTip_, 0);
  }

}

- (void)forwardDictationEvent_updateIdleDetection:(int64_t)a3
{
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v11 = forwardDictationEvent_updateIdleDetection____s_category_0;
    if (!forwardDictationEvent_updateIdleDetection____s_category_0)
    {
      v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&forwardDictationEvent_updateIdleDetection____s_category_0);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v13, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_updateIdleDetection_, v8);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "insertLastHypothesisAsFinalResultLocally");

}

- (void)forwardDictationEvent_stopDictationIgnoreFinalizePhrases
{
  int has_internal_diagnostics;
  BOOL v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v7 = forwardDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0;
    if (!forwardDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&forwardDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v9, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases, 0);

}

- (void)forwardDictationEvent_resumeDictation
{
  int has_internal_diagnostics;
  BOOL v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v7 = forwardDictationEvent_resumeDictation___s_category_0;
    if (!forwardDictationEvent_resumeDictation___s_category_0)
    {
      v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v7, (unint64_t *)&forwardDictationEvent_resumeDictation___s_category_0);
    }
    v8 = *(NSObject **)(v7 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v9, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forwardDictationEventToUIHost:withOptionalObject:", sel_handleRemoteDictationEvent_resumeDictation, 0);

}

- (void)forwardKeyboardCameraEvent_startCameraInput:(id)a3
{
  id v4;
  int has_internal_diagnostics;
  BOOL v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v9 = forwardKeyboardCameraEvent_startCameraInput____s_category_0;
    if (!forwardKeyboardCameraEvent_startCameraInput____s_category_0)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&forwardKeyboardCameraEvent_startCameraInput____s_category_0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v11, 2u);
    }
  }
  -[UIKeyboardImpl remoteTextInputPartner](self, "remoteTextInputPartner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forwardKeyboardCameraEvent_startCameraInput:", v4);

}

- (void)forwardKeyboardCameraEvent_selfDestruct
{
  int has_internal_diagnostics;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = +[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v9 = forwardKeyboardCameraEvent_selfDestruct___s_category_0;
    if (!forwardKeyboardCameraEvent_selfDestruct___s_category_0)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&forwardKeyboardCameraEvent_selfDestruct___s_category_0);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v11, 2u);
    }
  }
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputSystemSourceSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "textOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditingActionSelector:", sel_handleRemoteKeyboardCameraEvent_selfDestruct);
    objc_msgSend(v6, "flushOperations");

  }
}

- (void)forwardKeyboardCameraEvent_updatePreviewText:(id)a3 asMarkedText:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int has_internal_diagnostics;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v8 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
  if (has_internal_diagnostics)
  {
    if (!v8)
    {
      __UIFaultDebugAssertLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v15, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v8)
  {
    v16 = forwardKeyboardCameraEvent_updatePreviewText_asMarkedText____s_category_0;
    if (!forwardKeyboardCameraEvent_updatePreviewText_asMarkedText____s_category_0)
    {
      v16 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v16, (unint64_t *)&forwardKeyboardCameraEvent_updatePreviewText_asMarkedText____s_category_0);
    }
    v17 = *(NSObject **)(v16 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v18, 2u);
    }
  }
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputSystemSourceSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DBDC20], "intermediateTextWithInputString:displayString:", &stru_1E16EDF20, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textOperations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIntermediateText:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBDC20], "intermediateTextWithInputString:displayString:", &stru_1E16EDF20, &stru_1E16EDF20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textOperations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setIntermediateText:", v13);

      objc_msgSend(v10, "textOperations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyboardOutput");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertText:", v6);
    }

    objc_msgSend(v10, "flushOperations");
  }

}

- (void)forwardStickerEvent_presentCard
{
  int has_internal_diagnostics;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4 = +[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI");
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      __UIFaultDebugAssertLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }

    }
  }
  else if (!v4)
  {
    v9 = forwardStickerEvent_presentCard___s_category;
    if (!forwardStickerEvent_presentCard___s_category)
    {
      v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&forwardStickerEvent_presentCard___s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v11, 2u);
    }
  }
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputSystemSourceSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "textOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditingActionSelector:", sel_handleStickerEvent_presentCard);
    objc_msgSend(v6, "flushOperations");

  }
}

- (void)handleStickerEvent_presentCard
{
  _UIStickerPickerKeyboardSession *v3;
  _UIStickerPickerKeyboardSession *stickerPickerSession;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_stickerPickerSession)
  {
    v3 = objc_alloc_init(_UIStickerPickerKeyboardSession);
    stickerPickerSession = self->_stickerPickerSession;
    self->_stickerPickerSession = v3;

    -[_UIStickerPickerKeyboardSession setDelegate:](self->_stickerPickerSession, "setDelegate:", self);
  }
  -[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateRespectingForwardingDelegate:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE22B80))
  {
    -[_UIStickerPickerKeyboardSession presentWithTextInput:view:](self->_stickerPickerSession, "presentWithTextInput:view:", v6, v7);
  }
  else
  {
    _UIKeyboardImplLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "responder %@ does not conform to UITextInput. Cannot present stickers.", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)stickerPickerKeyboardSessionDidFinish
{
  _UIStickerPickerKeyboardSession *stickerPickerSession;

  stickerPickerSession = self->_stickerPickerSession;
  self->_stickerPickerSession = 0;

}

- (void)reportSmartReplyFeedbackUIWasPresented
{
  id v2;

  -[_UIKeyboardStateManager smartReplyFeedbackManager](self->_keyboardStateManager, "smartReplyFeedbackManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportFeedbackUIPresented");

}

- (void)writingToolsDidEnd
{
  id v2;

  -[_UIKeyboardStateManager smartReplyFeedbackManager](self->_keyboardStateManager, "smartReplyFeedbackManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportWritingToolsPanelDismissed");

}

- (void)reportSmartRepliesConcern
{
  id v2;

  -[_UIKeyboardStateManager smartReplyFeedbackManager](self->_keyboardStateManager, "smartReplyFeedbackManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportSmartRepliesConcern");

}

- (void)resetSmartReplyFeedbackUIIfAlreadyShown
{
  id v2;

  -[_UIKeyboardStateManager smartReplyFeedbackManager](self->_keyboardStateManager, "smartReplyFeedbackManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetSmartReplyFeedbackUIIfAlreadyShown");

}

- (BOOL)shouldShowSmartReplyFeedbackInputDashboardViewController
{
  void *v2;
  char v3;

  -[_UIKeyboardStateManager smartReplyFeedbackManager](self->_keyboardStateManager, "smartReplyFeedbackManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldShowSmartReplyFeedbackInputDashboardViewController");

  return v3;
}

- (BOOL)shouldCollapseButtonBarForFeedbackUI
{
  void *v2;
  char v3;

  -[_UIKeyboardStateManager smartReplyFeedbackManager](self->_keyboardStateManager, "smartReplyFeedbackManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "willShowFeedbackUI");

  return v3;
}

- (id)obtainHideInlineCandidatesAssertionForReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 0, 1, a3, 1);
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return !a3 && -[UIKeyboardImpl hideInlineCandidates](self, "hideInlineCandidates");
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (!a4)
  {
    -[UIKeyboardImpl setHideInlineCandidates:](self, "setHideInlineCandidates:", a3);
    -[UIKeyboardImpl removeCandidateList](self, "removeCandidateList");
    -[UIKeyboardImpl generateCandidates](self, "generateCandidates");
  }
}

- (id)_getCurrentKeyplaneName
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKeyboardLayout keyplaneName](self->m_layout, "keyplaneName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_getCurrentKeyboardName
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKeyboardLayout keyboardName](self->m_layout, "keyboardName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_getLocalizedInputMode
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKeyboardLayout localizedInputMode](self->m_layout, "localizedInputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setAutocorrects:(BOOL)a3
{
  -[_UIKeyboardStateManager _setAutocorrects:](self->_keyboardStateManager, "_setAutocorrects:", a3);
}

- (id)_getAutocorrection
{
  return -[_UIKeyboardStateManager _getAutocorrection](self->_keyboardStateManager, "_getAutocorrection");
}

- (id)_getAutocorrectionList
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemInputAssistantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayedCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_getCandidateList
{
  return -[_UIKeyboardStateManager _getCandidateList](self->_keyboardStateManager, "_getCandidateList");
}

- (BOOL)_hasCandidates
{
  return -[_UIKeyboardStateManager _hasCandidates](self->_keyboardStateManager, "_hasCandidates");
}

- (int64_t)_positionInCandidateList:(id)a3
{
  return -[_UIKeyboardStateManager _positionInCandidateList:](self->_keyboardStateManager, "_positionInCandidateList:", a3);
}

- (void)_setNeedsCandidates:(BOOL)a3
{
  -[_UIKeyboardStateManager _setNeedsCandidates:](self->_keyboardStateManager, "_setNeedsCandidates:", a3);
}

- (BOOL)_needsCandidates
{
  return -[_UIKeyboardStateManager _needsCandidates](self->_keyboardStateManager, "_needsCandidates");
}

- (BOOL)prewarmsPredictiveCandidates
{
  return -[_UIKeyboardStateManager prewarmsPredictiveCandidates](self->_keyboardStateManager, "prewarmsPredictiveCandidates");
}

- (void)setPrewarmsPredictiveCandidates:(BOOL)a3
{
  -[_UIKeyboardStateManager setPrewarmsPredictiveCandidates:](self->_keyboardStateManager, "setPrewarmsPredictiveCandidates:", a3);
}

- (UIKeyboardLayout)layout
{
  return self->m_layout;
}

- (BOOL)showInputModeIndicator
{
  return self->m_showInputModeIndicator;
}

- (void)setShowInputModeIndicator:(BOOL)a3
{
  self->m_showInputModeIndicator = a3;
}

- (BOOL)showsCandidateInline
{
  return self->m_showsCandidateInline;
}

- (BOOL)animateUpdateBars
{
  return self->m_animateUpdateBars;
}

- (void)setAnimateUpdateBars:(BOOL)a3
{
  self->m_animateUpdateBars = a3;
}

- (_UIKBFeedbackGenerating)feedbackGenerator
{
  return self->m_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->m_feedbackGenerator, a3);
}

- (BOOL)suppressUpdateCandidateView
{
  return self->m_suppressUpdateCandidateView;
}

- (void)setSuppressUpdateCandidateView:(BOOL)a3
{
  self->m_suppressUpdateCandidateView = a3;
}

- (BOOL)updateLayoutOnShowKeyboard
{
  return self->m_updateLayoutOnShowKeyboard;
}

- (void)setUpdateLayoutOnShowKeyboard:(BOOL)a3
{
  self->m_updateLayoutOnShowKeyboard = a3;
}

- (BOOL)geometryIsChanging
{
  return self->_geometryIsChanging;
}

- (void)setGeometryIsChanging:(BOOL)a3
{
  self->_geometryIsChanging = a3;
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (void)setRequestedInteractionModel:(unint64_t)a3
{
  self->_requestedInteractionModel = a3;
}

- (void)setCursorAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_cursorAssertion, a3);
}

- (void)setInternationalKeyIntroductionView:(id)a3
{
  objc_storeStrong((id *)&self->_internationalKeyIntroductionView, a3);
}

- (NSNumber)isAttachedHardwareKeyboard
{
  return self->_isAttachedHardwareKeyboard;
}

- (void)setAutocorrectBubbleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectBubbleContainer, a3);
}

- (UIView)overlayContainerObserved
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
}

- (void)setOverlayContainerObserved:(id)a3
{
  objc_storeWeak((id *)&self->_overlayContainerObserved, a3);
}

- (KFAViewController)keyboardFeedbackAssistantViewController
{
  return self->_keyboardFeedbackAssistantViewController;
}

- (void)setKeyboardFeedbackAssistantViewController:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFeedbackAssistantViewController, a3);
}

- (BOOL)hideInlineCandidates
{
  return self->_hideInlineCandidates;
}

- (void)setHideInlineCandidates:(BOOL)a3
{
  self->_hideInlineCandidates = a3;
}

- (UIPressAndHoldPopoverController)pressAndHoldPopoverController
{
  return self->_pressAndHoldPopoverController;
}

- (_UIKeyboardStateManager)keyboardStateManager
{
  return self->_keyboardStateManager;
}

- (void)setActiveLayout:(id)a3
{
  objc_storeWeak((id *)&self->_activeLayout, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeLayout);
  objc_storeStrong((id *)&self->_keyboardStateManager, 0);
  objc_storeStrong((id *)&self->_pressAndHoldPopoverController, 0);
  objc_storeStrong((id *)&self->_keyboardFeedbackAssistantViewController, 0);
  objc_destroyWeak((id *)&self->_overlayContainerObserved);
  objc_storeStrong((id *)&self->_autocorrectBubbleContainer, 0);
  objc_storeStrong((id *)&self->_isAttachedHardwareKeyboard, 0);
  objc_storeStrong((id *)&self->_internationalKeyIntroductionView, 0);
  objc_storeStrong((id *)&self->_inputModeAssertion, 0);
  objc_storeStrong((id *)&self->_capslockAssertion, 0);
  objc_storeStrong((id *)&self->_cursorAssertion, 0);
  objc_storeStrong((id *)&self->_autocorrectPromptTask, 0);
  objc_storeStrong((id *)&self->m_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->m_candidateController, 0);
  objc_destroyWeak((id *)&self->m_geometryDelegate);
  objc_storeStrong((id *)&self->m_layout, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_emojiKeyboardPrewarmingAssertion, 0);
  objc_storeStrong((id *)&self->_stickerPickerSession, 0);
  objc_storeStrong((id *)&self->m_tipView, 0);
  objc_storeStrong((id *)&self->m_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->m_dictationIndicatorAssertion, 0);
  objc_storeStrong((id *)&self->m_dictationMenuAction, 0);
  objc_storeStrong((id *)&self->_autoFillPanel, 0);
  objc_storeStrong((id *)&self->_dictationPopoverController, 0);
  objc_storeStrong((id *)&self->_emojiPopoverController, 0);
  objc_storeStrong((id *)&self->_multilingualSettingIntroductionView, 0);
  objc_storeStrong((id *)&self->_multilingualKeyboardIntroductionView, 0);
  objc_storeStrong((id *)&self->_stickerEditorViewController, 0);
  objc_storeStrong((id *)&self->_editingGestureIntroductionView, 0);
  objc_storeStrong((id *)&self->_continuousPathIntroductionView, 0);
  objc_storeStrong((id *)&self->m_capsLockSign, 0);
  objc_storeStrong((id *)&self->m_resumeDictationForResponderChange, 0);
  objc_storeStrong((id *)&self->m_detachHardwareKeyboardAction, 0);
  objc_storeStrong((id *)&self->m_recentInputs, 0);
  objc_storeStrong((id *)&self->m_keyedLayouts, 0);
  objc_storeStrong((id *)&self->m_markedTextOverlay, 0);
  objc_storeStrong((id *)&self->m_autocorrectPrompt, 0);
  objc_storeStrong((id *)&self->m_languageIndicator, 0);
}

@end
