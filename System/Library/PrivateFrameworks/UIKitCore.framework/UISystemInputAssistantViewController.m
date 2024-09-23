@implementation UISystemInputAssistantViewController

- (BOOL)supportsCompactStyle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "allowsCompactAssistantBar");
  else
    v4 = 1;
  -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "_writingToolsWantsKeyboardSuppression") & 1) != 0)
    v4 = 0;

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setInputAssistantButtonItemsForResponder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if (-[UISystemInputAssistantViewController layoutHasBuiltinAssistantView](self, "layoutHasBuiltinAssistantView"))
  {
    -[UISystemInputAssistantViewController _beginObservingInputAssistantItemForRelevantItemChanges:](self, "_beginObservingInputAssistantItemForRelevantItemChanges:", 0);
  }
  else if (-[UISystemInputAssistantViewController _assistantItemsVisibleForResponder:](self, "_assistantItemsVisibleForResponder:", v16))
  {
    if (v16)
    {
      _UIResponderFindInputAssistantItem(v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputAssistantViewController remoteAssistantItem](self, "remoteAssistantItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[UISystemInputAssistantViewController remoteAssistantItem](self, "remoteAssistantItem");
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
      if (!-[UISystemInputAssistantViewController _isAssistantPreferenceEnabled](self, "_isAssistantPreferenceEnabled")
        && objc_msgSend(v4, "allowsHidingShortcuts"))
      {

        v4 = 0;
      }
      -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInputAssistantItem:", v4);

      -[UISystemInputAssistantViewController _beginObservingInputAssistantItemForRelevantItemChanges:](self, "_beginObservingInputAssistantItemForRelevantItemChanges:", v4);
      -[UISystemInputAssistantViewController _updateSystemInputAssistantViewStylingForInputAssistantItem:](self, "_updateSystemInputAssistantViewStylingForInputAssistantItem:", v4);

    }
    -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expectedPlacement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAssistantViewPlacement(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = UIGetAssistantBarStyleFromPlacement(v10);
    if (self->_assistantBarStyle != v11)
    {
      v12 = v11;
      if ((objc_msgSend(v10, "showsInputOrAssistantViews") & 1) != 0 || objc_msgSend(v10, "isUndocked"))
      {
        -[UISystemInputAssistantViewController _updateViewsForAssistantBarStyle:](self, "_updateViewsForAssistantBarStyle:", v12);
        self->_assistantBarStyle = v12;
      }
      -[UISystemInputAssistantViewController setOverrideSafeAreaInsets](self, "setOverrideSafeAreaInsets");
    }
    if (objc_msgSend((id)objc_opt_class(), "shouldShowSystemInputAssistantItems"))
    {
      +[UIAssistantBarButtonItemProvider unmodifiableSystemAssistantItem:](UIAssistantBarButtonItemProvider, "unmodifiableSystemAssistantItem:", self->_assistantBarStyle);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setSystemInputAssistantItem:", v13);

    }
  }
  else
  {
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setInputAssistantItem:force:", 0, 1);

  }
}

- (void)loadView
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getTUISystemInputAssistantViewClass_softClass;
  v12 = getTUISystemInputAssistantViewClass_softClass;
  if (!getTUISystemInputAssistantViewClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getTUISystemInputAssistantViewClass_block_invoke;
    v8[3] = &unk_1E16B14C0;
    v8[4] = &v9;
    __getTUISystemInputAssistantViewClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  v5 = [v4 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setBackgroundVisible:", 0);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("SystemInputAssistantView"));
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 3, 0);

  -[UIInputViewController setView:](self, "setView:", v6);
}

- (id)inputWindowController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerRootController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v4;
  }
  -[UIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_rootInputWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  return v4;
}

+ (BOOL)_requiresProxyInterface
{
  return 0;
}

- (void)_responderChangedNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("UITextInputResponderCapabilitiesChangedInputResponderKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UISystemInputAssistantViewController _queueResponderChangedForNewResponder:](self, "_queueResponderChangedForNewResponder:", v4);

}

- (void)_queueResponderChangedForNewResponder:(id)a3
{
  NSTimer *v4;
  NSTimer *pendingResponderChangedTimer;
  _QWORD v6[5];

  objc_storeWeak((id *)&self->_pendingResponderForChangedNotification, a3);
  if (!self->_pendingResponderChangedTimer)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __78__UISystemInputAssistantViewController__queueResponderChangedForNewResponder___block_invoke;
    v6[3] = &unk_1E16C4358;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v6, 0.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    pendingResponderChangedTimer = self->_pendingResponderChangedTimer;
    self->_pendingResponderChangedTimer = v4;

  }
}

- (void)_updateCenterViewWidthForInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;

  -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAssistantViewPlacement(v6);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v24, "isHiddenForFloatingTransition");
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = objc_msgSend(v24, "isFloating");
  else
    v8 = 1;
  v9 = -[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode");
  -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emojiSearchView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchTextField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 | objc_msgSend(v12, "isActive");

  if (v13 == 1)
  {
    v14 = v24;
    if ((v8 & 1) == 0)
    {
      if ((objc_msgSend(v24, "showsKeyboard") & 1) != 0)
      {
        v14 = v24;
        if (!(_DWORD)v7)
          goto LABEL_13;
        goto LABEL_12;
      }
      if ((objc_msgSend(v24, "showsInputOrAssistantViews") & 1) != 0
        || (v15 = objc_msgSend(v24, "accessoryViewWillAppear"), v14 = v24, ((v15 | v7) & 1) != 0))
      {
LABEL_12:
        -[UISystemInputAssistantViewController _dismissEmojiSearch](self, "_dismissEmojiSearch");
        v14 = v24;
        v13 = 0;
      }
    }
  }
  else
  {
    v14 = v24;
  }
LABEL_13:
  if (((v8 | v7) & 1) != 0 || v13)
  {
    if (objc_msgSend(v14, "isFloating"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "_showsScribbleIconsInAssistantView");
      v16 = 1;
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
  }
  else
  {
    v16 = 0;
    v17 = 1;
  }
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShowsButtonBarItemsInline:", v17);

  if (v16)
  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISystemInputAssistantViewController _centerViewWidthForTraitCollection:interfaceOrientation:](self, "_centerViewWidthForTraitCollection:interfaceOrientation:", v20, a3);
  v22 = v21;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCenterViewWidth:", v22);

  -[UISystemInputAssistantViewController updateRemoteAssistantViewHidden](self, "updateRemoteAssistantViewHidden");
}

- (BOOL)_isEmojiInputMode
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiInputMode");

  return v4;
}

- (BOOL)isEmojiSearchResultsVisible
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    -[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchViewController, "emojiSearchView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "predictionViewVisible") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (TUIEmojiSearchInputViewController)emojiSearchViewController
{
  return self->_emojiSearchViewController;
}

- (void)updateRemoteAssistantViewHidden
{
  unint64_t v3;
  int64_t assistantBarStyle;
  uint64_t v5;
  void *v6;

  v3 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  assistantBarStyle = self->_assistantBarStyle;
  v5 = assistantBarStyle > 1 || v3 == 1;
  if (v3 == 1 && assistantBarStyle <= 1)
  {
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "showsButtonBarItemsInline") ^ 1;

  }
  -[UIView setHidden:](self->_remoteAssistantView, "setHidden:", v5);
}

- (double)_centerViewWidthForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  int isKindOfClass;
  int v36;
  void *v37;
  char v38;
  double v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  char v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;

  v6 = a3;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inputAssistantItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_centerBarButtonGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0.0;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "barButtonItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(v9, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "barButtonItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "width");
      if (v17 <= 0.0)
        goto LABEL_50;
      objc_msgSend(v16, "width");
      v10 = v18;

    }
  }
  if (-[UISystemInputAssistantViewController _hasCustomCenterViewControllerWidth](self, "_hasCustomCenterViewControllerWidth"))
  {
    -[UISystemInputAssistantViewController _customCenterViewController:](self, "_customCenterViewController:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "preferredWidthForTraitCollection:", v6);
    if (v20 == -1.0)
      v10 = 0.0;
    else
      v10 = v20;

  }
  -[UISystemInputAssistantViewController remoteCenterViewPreferredWidth](self, "remoteCenterViewPreferredWidth");
  if (v21 > 0.0)
  {
    -[UISystemInputAssistantViewController remoteCenterViewPreferredWidth](self, "remoteCenterViewPreferredWidth");
    v10 = v22;
  }
  +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v23, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UISystemInputAssistantViewController _buttonBarWidthForTraitCollection:interfaceOrientation:](self, "_buttonBarWidthForTraitCollection:interfaceOrientation:", v6, a4);
  v25 = v24;
  -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "placement");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isFloatingAssistantView"))
  {

  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "_showsScribbleIconsInAssistantView");

    if ((v29 & 1) == 0)
    {
      objc_msgSend(v16, "assistantViewWidth");
      v31 = v30 - v25;
      if (v10 > v31)
        v10 = v31;
    }
  }
  if (v10 == 0.0)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "containerRootController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "placement");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v36 = objc_msgSend(v34, "isFloating");
    else
      v36 = 1;
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "showsExpandableButtonBarItems");

    if (!objc_msgSend(v34, "isFloatingAssistantView")
      || (v39 = 1.0, (objc_msgSend(v34, "isCompactAssistantView") & 1) == 0))
    {
      if (objc_msgSend(v34, "isFloatingAssistantView"))
      {
        v40 = (unint64_t)(a4 - 3) < 2;
        +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "wantsAssistantWhileSuppressingKeyboard"))
        {
          +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "disableBecomeFirstResponder");

        }
        else
        {
          v43 = 0;
        }
        v39 = dbl_18667AEF0[v40];

        -[UIViewController view](self, "view");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "window");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "windowScene");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "_enhancedWindowingEnabled");

        if (v48 && (v43 & 1) == 0)
        {
          objc_msgSend(v16, "assistantViewWidth");
          v50 = v49 - (v25 + v25);
          if (v39 < v50)
            v50 = v39;
          v39 = fmax(v50, 1.0);
        }
      }
      else if (((v36 | isKindOfClass) & 1) != 0)
      {
        if (v10 < 667.0
          || ((unint64_t)(a4 - 5) < 0xFFFFFFFFFFFFFFFELL ? (v44 = 1) : (v44 = v38), (v44 & 1) != 0))
        {
          v39 = v10;
        }
        else
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "_layout");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "currentKeyplane");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "keyUnionFrame");
          v63 = v62;

          if (v63 <= 0.0)
            v39 = v10;
          else
            v39 = v63;
        }
      }
      else
      {
        -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "emojiSearchView");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "searchTextField");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isActive");

        -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "emojiSearchView");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "window");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v54 & 1) != 0
          || +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled")&& v57)
        {
          objc_msgSend(v16, "keyboardWidth");
          v39 = v58;
        }
        else if (v10 <= 0.0)
        {
          objc_msgSend(v16, "keyboardWidth");
          v39 = v64 - (v25 + v25);
        }
        else
        {
          v39 = v25 + v25 + v10;
        }
      }
    }

    v10 = v39;
  }
LABEL_50:

  return v10;
}

- (void)updateCenterViewVisibilityStateForInputDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  int v17;
  char isKindOfClass;
  void *v19;
  BOOL v20;
  _BOOL4 v21;
  int v22;
  char v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  _BOOL8 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;

  v4 = a3;
  if (!v4)
  {
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v44 = v4;
  -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rootInputWindowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAssistantViewPlacement(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = objc_msgSend(v9, "isFloating") ^ 1;
  else
    v10 = 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_rootInputWindowController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSplitting");

  v15 = objc_msgSend(v5, "_disableAutomaticKeyboardUI");
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isVisibleForInputDelegate:inputViews:", v44, 0);

  isKindOfClass = 0;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") && (v10 & 1) == 0)
  {
    -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  v20 = -[UISystemInputAssistantViewController _hidesCenterViewForActiveWindowingMode](self, "_hidesCenterViewForActiveWindowingMode");
  v21 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  if ((v21 & v17) == 1)
    v22 = objc_msgSend(v11, "showingEmojiSearch") ^ 1;
  else
    LOBYTE(v22) = v17 & ~v21;
  v23 = v14 | v15 | ~(_BYTE)v22 | isKindOfClass | v20;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "centerViewHidden");

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v23 & 1;
  objc_msgSend(v26, "setCenterViewHidden:", v27);

  if (v25 != (_DWORD)v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "postNotificationName:object:", CFSTR("_uisavcvcn"), v29);

  }
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setScrollEnabled:", +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") ^ 1);

  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    v33 = 1;
  }
  else
  {
    -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v36, "hidesExpandableButton");

    }
    else
    {
      v33 = 0;
    }
  }
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setHidesExpandableButton:", v33);

  v38 = -[UISystemInputAssistantViewController _shouldShowExpandableButtonBarItemsForResponder:](self, "_shouldShowExpandableButtonBarItemsForResponder:", v5);
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setShowsExpandableButtonBarItems:", v38);

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "showsExpandableButtonBarItems");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "candidateController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setReuseArrowButtonToExpandAssistantBarItems:", v41);

  if (-[UISystemInputAssistantViewController _hasCustomCenterViewControllerWidth](self, "_hasCustomCenterViewControllerWidth"))
  {
    -[UISystemInputAssistantViewController _updateCenterViewWidthForInterfaceOrientation:](self, "_updateCenterViewWidthForInterfaceOrientation:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
  }

}

- (BOOL)_centerPredictionViewVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[UISystemInputAssistantViewController automaticallySetCenterViewControllerBasedOnInputDelegate:](self, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v6);
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "requiresKeyboard");

    if (v11)
    {
      objc_msgSend(v7, "keyboard");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_10;
    }
  }
  else
  {

  }
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isVisibleForInputDelegate:inputViews:", v6, v7);

  if ((v14 & 1) != 0)
  {
    v15 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if (-[UISystemInputAssistantViewController _canShowCenterBarButtonItem](self, "_canShowCenterBarButtonItem"))
  {
    -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _UIResponderFindInputAssistantItem(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "_centerBarButtonGroups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v18, "count") != 0;

  }
  else
  {
    v15 = 0;
  }
LABEL_13:

  return v15;
}

- (UIPredictiveViewController)centerViewController
{
  return self->_centerViewController;
}

- (BOOL)_canShowCenterBarButtonItem
{
  void *v4;
  void *v5;
  BOOL v6;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 1;
  -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[UISystemInputAssistantViewController _allowedToShowBarButtonItemsInline:](self, "_allowedToShowBarButtonItemsInline:", v5);
  return v6;
}

- (id)_inputDelegateAsResponder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if ((objc_msgSend(v3, "__isKindOfUIResponder") & 1) == 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "delegateAsResponder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldShowExpandableButtonBarItemsForResponder:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4
    && -[UISystemInputAssistantViewController _allowedToShowBarButtonItemsInline:](self, "_allowedToShowBarButtonItemsInline:", v4))
  {
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
      -[UISystemInputAssistantViewController remoteAssistantItem](self, "remoteAssistantItem");
    else
      _UIResponderFindInputAssistantItem(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "_showsBarButtonItemsInline"))
    {
      objc_msgSend(v6, "leadingBarButtonGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v6, "trailingBarButtonGroups");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v8, "count") != 0;

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_allowedToShowBarButtonItemsInline:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v15;
  void *v16;

  -[UIViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (os_variant_has_internal_diagnostics())
  {
    if (-[UISystemInputAssistantViewController hasCheckedPreferences](self, "hasCheckedPreferences"))
    {
      v7 = -[UISystemInputAssistantViewController assistantOniPhonePreference](self, "assistantOniPhonePreference");
    }
    else
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preferencesActions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v16, "BOOLForPreferenceKey:", CFSTR("KeyboardAssistantOniPhone"));

    }
  }
  else
  {
    v7 = 0;
  }
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputSystemSourceSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _UIMainBundleIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v6 == 0;
  if (v12)
    v13 = v7;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
    v12 = objc_msgSend(&unk_1E1A93350, "containsObject:", v11);

  return v12;
}

- (BOOL)shouldBeShownForInputDelegate:(id)a3 inputViews:(id)a4
{
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  int v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  char v44;
  uint64_t v45;
  void *v46;
  BOOL v47;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_3;
LABEL_11:
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_11;
LABEL_3:
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsString:", CFSTR("dictation"));

  v13 = objc_msgSend(v10, "isEmojiInputMode");
  v14 = objc_msgSend(v10, "isSpecializedInputMode");
  if (!v14)
    goto LABEL_6;
  if ((+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled") & v12) != 1)
  {
    LOBYTE(v15) = 1;
    if (!v13)
      goto LABEL_20;
    goto LABEL_18;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isMinimized"))
  {
    LOBYTE(v15) = 1;
  }
  else
  {
LABEL_6:
    LOBYTE(v15) = v13;
    if (_os_feature_enabled_impl())
    {
      v15 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") & v13;
      if (!v14)
      {
LABEL_8:
        if (!v13)
          goto LABEL_20;
        goto LABEL_18;
      }
    }
    else if (!v14)
    {
      goto LABEL_8;
    }
  }

  if (!v13)
    goto LABEL_20;
LABEL_18:
  objc_msgSend(v8, "keyboard");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    objc_msgSend(v8, "inputAccessoryView");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      v46 = (void *)v45;
      v47 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled");

      if (v47)
        goto LABEL_46;
    }
  }
LABEL_20:
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "showingEmojiSearch");

    goto LABEL_24;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((v15 & 1) == 0)
      goto LABEL_29;
LABEL_46:
    v44 = 0;
    goto LABEL_47;
  }
  v19 = objc_msgSend(v6, "keyboardType") == 122;
LABEL_24:
  v20 = v15 & ~(_BYTE)v12;
  if (!v19)
    v20 = v15;
  if ((v20 & 1) != 0)
    goto LABEL_46;
LABEL_29:
  v21 = -[UISystemInputAssistantViewController _centerPredictionViewVisibleForInputDelegate:inputViews:](self, "_centerPredictionViewVisibleForInputDelegate:inputViews:", v6, v8);
  if (!v21)
    goto LABEL_50;
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_rootInputWindowController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "placement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIAssistantViewPlacement(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isFloating");

  if ((v26 & 1) == 0)
  {
LABEL_50:
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "_shouldSuppressAssistantBar");

    if ((v28 & 1) != 0)
      goto LABEL_46;
  }
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE22B80) & 1) == 0
    && (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE0CE228) & 1) == 0
    && !objc_msgSend(v6, "conformsToProtocol:", &unk_1EE0CE288))
  {
    goto LABEL_46;
  }
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hideSystemInputAssistantView");

  if ((v30 & 1) != 0)
    goto LABEL_46;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "disableInputBars");

  if ((v32 & 1) != 0)
    goto LABEL_46;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "visualModeManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "useVisualModeWindowed");

  LODWORD(v34) = -[UISystemInputAssistantViewController layoutHasBuiltinAssistantView](self, "layoutHasBuiltinAssistantView");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "_showsScribbleIconsInAssistantView");

  if ((_DWORD)v34)
  {
    if ((v35 & 1) == 0 && !v37)
      goto LABEL_46;
  }
  -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[UISystemInputAssistantViewController _assistantItemsVisibleForResponder:](self, "_assistantItemsVisibleForResponder:", v38);

  -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "placement");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  UIAssistantViewPlacement(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v42, "isFloatingAssistantView");
  v44 = v43 | (v21 || v39);
  if (v43 && !v21 && !v39)
    v44 = +[UIAssistantBarButtonItemProvider isKeyboardGroupVisible](UIAssistantBarButtonItemProvider, "isKeyboardGroupVisible");

LABEL_47:
  return v44;
}

- (id)_currentInputDelegate
{
  void *v2;
  void *v3;
  void *v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)layoutHasBuiltinAssistantView
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  int v8;
  void *v9;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
    goto LABEL_4;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateList");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    LOBYTE(v8) = 0;
LABEL_7:

    return v8;
  }
  v6 = (void *)v5;
  v7 = +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit");

  if (!v7)
  {
    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "emojiSearchView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isActive") ^ 1;

    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v8) = 0;
  return v8;
}

- (BOOL)_assistantItemsVisibleForResponder:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  int v28;
  _QWORD aBlock[4];
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  if ((objc_msgSend(v4, "_isDisplayingWritingToolsSessionInUCB") & 1) == 0)
  {
    v6 = -[UISystemInputAssistantViewController _isAssistantPreferenceEnabled](self, "_isAssistantPreferenceEnabled");
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__71;
    v32[4] = __Block_byref_object_dispose__71;
    v33 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__UISystemInputAssistantViewController__assistantItemsVisibleForResponder___block_invoke;
    aBlock[3] = &unk_1E16C4310;
    v31 = v32;
    v7 = v4;
    v30 = v7;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    v9 = v8;
    if (v6)
    {
      v5 = 1;
    }
    else
    {
      v8[2](v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v10, "allowsHidingShortcuts") ^ 1;

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v11, "_showsScribbleIconsInAssistantView");

    -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "placement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isFloating") & 1) != 0)
    {
      v14 = 1;
    }
    else
    {
      -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "placement");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "isHiddenForFloatingTransition");

    }
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
      && +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      if ((+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard") & v5 & 1) == 0)
      {
        if ((v5 & 1) == 0)
          goto LABEL_28;
LABEL_24:
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "visualModeManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "useVisualModeWindowed");

        if (v20 && (objc_msgSend(v7, "inputView"), (v21 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          LOBYTE(v5) = 0;
        }
        else
        {
          +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "hasCustomInputViewController");

          if ((v23 & 1) != 0)
          {
LABEL_28:
            LOBYTE(v5) = 0;
            goto LABEL_37;
          }
          v9[2](v9);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "leadingBarButtonGroups");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "count"))
          {
            LOBYTE(v5) = 1;
          }
          else
          {
            objc_msgSend(v21, "trailingBarButtonGroups");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "count"))
            {
              LOBYTE(v5) = 1;
            }
            else
            {
              objc_msgSend(v21, "_centerBarButtonGroups");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v5) = objc_msgSend(v26, "count") != 0;

            }
          }

        }
        goto LABEL_37;
      }
    }
    else if (!v5)
    {
      goto LABEL_37;
    }
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "userInterfaceIdiom") == 6)
    {

      if ((v5 & 1) == 0)
        goto LABEL_28;
      goto LABEL_24;
    }
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {

      if ((v14 & ~v28) != 1)
      {
        if (v5)
          goto LABEL_24;
        goto LABEL_37;
      }
    }
    else
    {

    }
    v5 = -[UISystemInputAssistantViewController _shouldShowExpandableButtonBarItemsForResponder:](self, "_shouldShowExpandableButtonBarItemsForResponder:", v7);
    if (v5)
      goto LABEL_24;
LABEL_37:

    _Block_object_dispose(v32, 8);
    goto LABEL_38;
  }
  LOBYTE(v5) = 0;
LABEL_38:

  return v5;
}

- (BOOL)assistantEnabledPreference
{
  return self->_assistantEnabledPreference;
}

- (BOOL)_isAssistantPreferenceEnabled
{
  void *v3;
  void *v4;

  if (!-[UISystemInputAssistantViewController hasCheckedPreferences](self, "hasCheckedPreferences"))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferencesActions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController setAssistantEnabledPreference:](self, "setAssistantEnabledPreference:", objc_msgSend(v4, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE1C0]));

    -[UISystemInputAssistantViewController setHasCheckedPreferences:](self, "setHasCheckedPreferences:", 1);
  }
  return -[UISystemInputAssistantViewController assistantEnabledPreference](self, "assistantEnabledPreference");
}

- (BOOL)hasCheckedPreferences
{
  return self->_hasCheckedPreferences;
}

- (BOOL)_hasCustomCenterViewControllerWidth
{
  void *v2;
  char v3;

  -[UISystemInputAssistantViewController _customCenterViewController:](self, "_customCenterViewController:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = objc_opt_respondsToSelector();
  else
    v3 = 0;

  return v3 & 1;
}

- (id)_customCenterViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "inputDashboardViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_hidesCenterViewForActiveWindowingMode
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useVisualModeWindowed");

  -[UIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "horizontalSizeClass") != 1)
    v5 = 0;

  return v5;
}

- (double)remoteCenterViewPreferredWidth
{
  return self->_remoteCenterViewPreferredWidth;
}

- (double)_buttonBarWidthForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;

  +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assistantViewWindowBounds");
  v8 = v7;
  objc_msgSend(v6, "assistantViewWindowBounds");
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = a4 - 3;
  if (v10 >= 1024.0)
  {
    v12 = v11 >= 2;
    v13 = 283.0;
    v14 = 352.0;
  }
  else
  {
    if (v10 >= 834.0)
    {
      v15 = dbl_18667AEE0[v11 < 2];
      goto LABEL_12;
    }
    v12 = v11 >= 2;
    v13 = 152.0;
    v14 = 178.0;
  }
  if (v12)
    v15 = v13;
  else
    v15 = v14;
LABEL_12:

  return v15;
}

- (void)setHasCheckedPreferences:(BOOL)a3
{
  self->_hasCheckedPreferences = a3;
}

- (void)setAssistantEnabledPreference:(BOOL)a3
{
  self->_assistantEnabledPreference = a3;
}

- (void)automaticallySetCenterViewControllerBasedOnInputDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;

  v4 = a3;
  objc_opt_class();
  v5 = -[UISystemInputAssistantViewController assistantBarStyle](self, "assistantBarStyle");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "suppressUpdateLayout");

  if ((v7 & 1) == 0)
  {
    -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationAwarePlacement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAssistantViewPlacement(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "showsInputOrAssistantViews") & 1) != 0 || objc_msgSend(v10, "isUndocked"))
      v5 = UIGetAssistantBarStyleFromPlacement(v10);

  }
  -[UISystemInputAssistantViewController _customCenterBarButtonItem:](self, "_customCenterBarButtonItem:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController _customCenterViewController:](self, "_customCenterViewController:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
      || -[UISystemInputAssistantViewController showsRemoteInputDashViewController](self, "showsRemoteInputDashViewController"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "showsCandidateBar");

    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "showsCandidateBar");

      if ((v56 & 1) == 0)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "_layout");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "hasCandidateKeys");

        if ((v59 & 1) == 0)
        {
          if (_os_feature_enabled_impl())
          {
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "currentInputMode");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "showsTransliterationCandidates");

          }
        }
      }
    }
  }
  v14 = (objc_class *)objc_opt_class();
  -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15
    || (v16 = (void *)v15,
        -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_opt_class(),
        v17,
        v16,
        (objc_class *)v18 != v14))
  {
    NSStringFromClass(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController cachedPredictiveViewControllers](self, "cachedPredictiveViewControllers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v21 = (void *)objc_msgSend([v14 alloc], "initWithNibName:bundle:", 0, 0);
      if (v21)
      {
        -[UISystemInputAssistantViewController cachedPredictiveViewControllers](self, "cachedPredictiveViewControllers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v21, v19);

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v21, "setShowsRemoteInputDashViewController:", -[UISystemInputAssistantViewController showsRemoteInputDashViewController](self, "showsRemoteInputDashViewController"));
    -[UISystemInputAssistantViewController setPredictiveViewController:](self, "setPredictiveViewController:", v21);

  }
  if (-[UISystemInputAssistantViewController shouldShowEmojiSearchViewControllerForInputDelegate:](self, "shouldShowEmojiSearchViewControllerForInputDelegate:", v4))
  {
    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v63 = 0;
      v64 = &v63;
      v65 = 0x2050000000;
      v24 = (void *)getTUIEmojiSearchInputViewControllerClass_softClass_0;
      v66 = getTUIEmojiSearchInputViewControllerClass_softClass_0;
      if (!getTUIEmojiSearchInputViewControllerClass_softClass_0)
      {
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __getTUIEmojiSearchInputViewControllerClass_block_invoke_0;
        v62[3] = &unk_1E16B14C0;
        v62[4] = &v63;
        __getTUIEmojiSearchInputViewControllerClass_block_invoke_0((uint64_t)v62);
        v24 = (void *)v64[3];
      }
      v25 = objc_retainAutorelease(v24);
      _Block_object_dispose(&v63, 8);
      v26 = (void *)objc_msgSend([v25 alloc], "initWithNibName:bundle:", 0, 0);
      -[UISystemInputAssistantViewController setEmojiSearchViewController:](self, "setEmojiSearchViewController:", v26);

      -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDelegate:", self);

    }
    v28 = -[UISystemInputAssistantViewController _shouldCollapseEmojiSearchView](self, "_shouldCollapseEmojiSearchView");
    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "emojiSearchView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCollapsed:", v28);

    -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setChildPredictionViewController:", v31);

    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController setCenterViewController:](self, "setCenterViewController:", v33);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "autocorrectionController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addAutocorrectionObserver:", self);

    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "emojiSearchView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "searchTextField");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setKeyboardType:", 122);

    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "emojiSearchView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "searchTextField");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setReturnKeyType:", 9);

    v11 = 0;
  }
  else
  {
    -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v12)
    {

      if (v43 != v12)
        -[UISystemInputAssistantViewController setCenterViewController:](self, "setCenterViewController:", v12);
    }
    else
    {
      -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43 != v44)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "autocorrectionController");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "removeAutocorrectionObserver:", self);

        -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISystemInputAssistantViewController setCenterViewController:](self, "setCenterViewController:", v47);

      }
    }
  }
  objc_msgSend(v11, "customView");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[UISystemInputAssistantViewController compatibilityViewController](self, "compatibilityViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "customView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51 != v52)
    {
      objc_msgSend(v11, "customView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputAssistantViewController compatibilityViewController](self, "compatibilityViewController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setCustomView:", v53);

    }
  }
  -[UISystemInputAssistantViewController _updateViewsForAssistantBarStyle:](self, "_updateViewsForAssistantBarStyle:", v5);
  -[UISystemInputAssistantViewController updateCenterViewVisibilityStateForInputDelegate:](self, "updateCenterViewVisibilityStateForInputDelegate:", v4);
  -[UISystemInputAssistantViewController updateAssistantBarStyle:](self, "updateAssistantBarStyle:", v5);

}

- (id)predictionViewController
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v6 = 0;
      return v6;
    }
  }
  -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (UIPredictiveViewController)predictiveViewController
{
  return self->_predictiveViewController;
}

- (void)updateAssistantBarStyle:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  id obj;

  v5 = (unint64_t)(a3 - 2) <= 2 && (unint64_t)(self->_assistantBarStyle - 2) < 3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (self->_assistantBarStyle != a3
    || self->_isInputAssistantItemEmpty != -[UISystemInputAssistantViewController isInputAssistantItemEmpty](self, "isInputAssistantItemEmpty")|| self->_assistantBarStyle == 1&& !-[NSValue isEqualToValue:](self->_currentInputDelegatePointerValue, "isEqualToValue:", obj))
  {
    self->_isInputAssistantItemEmpty = -[UISystemInputAssistantViewController isInputAssistantItemEmpty](self, "isInputAssistantItemEmpty");
    if (!v5)
    {
      if (objc_msgSend((id)objc_opt_class(), "shouldShowSystemInputAssistantItems"))
      {
        +[UIAssistantBarButtonItemProvider unmodifiableSystemAssistantItem:](UIAssistantBarButtonItemProvider, "unmodifiableSystemAssistantItem:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSystemInputAssistantItem:", v6);

      }
      -[UISystemInputAssistantViewController _updateCenterViewWidthForInterfaceOrientation:](self, "_updateCenterViewWidthForInterfaceOrientation:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
    }
    self->_assistantBarStyle = a3;
    -[UISystemInputAssistantViewController setOverrideSafeAreaInsets](self, "setOverrideSafeAreaInsets");
    objc_storeStrong((id *)&self->_currentInputDelegatePointerValue, obj);
    -[UISystemInputAssistantViewController updateRemoteAssistantViewHidden](self, "updateRemoteAssistantViewHidden");
  }

}

- (BOOL)isInputAssistantItemEmpty
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInputAssistantItemHidden"))
  {
    -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isVisibleForInputDelegate:inputViews:", v5, 0) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)showsRemoteInputDashViewController
{
  return self->_showsRemoteInputDashViewController;
}

- (BOOL)shouldShowEmojiSearchViewControllerForInputDelegate:(id)a3
{
  id v4;
  char v5;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl()
    && !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (!v4)
    {
      -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = -[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode");
    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emojiSearchView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isActive");

    v5 = !v7;
    if (!v7)
    {
      v5 = v11;
    }
    else
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v12, "activeInputModes", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v19 != v16)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "supportsEmojiSearch") & 1) != 0)
            {
              v5 = 1;
              goto LABEL_20;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v15)
            continue;
          break;
        }
      }
      else
      {
        v5 = 0;
      }
LABEL_20:

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)layoutFromAssistantBarStyle:(int64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;

  if ((unint64_t)(a3 - 2) < 3)
  {
    -[UISystemInputAssistantViewController compactAssistantViewLayout](self, "compactAssistantViewLayout");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    return v5;
  }
  if (a3 == 1)
  {
    -[UISystemInputAssistantViewController floatAssistantViewLayout](self, "floatAssistantViewLayout");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[UISystemInputAssistantViewController standardAssistantViewLayout](self, "standardAssistantViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "showsCandidateBar")
    && +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "centerFilled");

    if ((v9 & 1) == 0)
    {
      -[UISystemInputAssistantViewController splitAssistantViewLayout](self, "splitAssistantViewLayout");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
  }
  else
  {

  }
  return v5;
}

- (int64_t)assistantBarStyle
{
  return self->_assistantBarStyle;
}

- (void)_updateViewsForAssistantBarStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[UISystemInputAssistantViewController layoutFromAssistantBarStyle:](self, "layoutFromAssistantBarStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLayout:", v5);

  -[UISystemInputAssistantViewController styleFromAssistantBarStyle:](self, "styleFromAssistantBarStyle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "setStyle:", v7);

  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAssistantBarStyle:", a3);

  }
}

- (id)styleFromAssistantBarStyle:(int64_t)a3
{
  void *v3;

  if ((unint64_t)(a3 - 2) >= 3)
  {
    if (a3 == 1)
      -[UISystemInputAssistantViewController floatStyle](self, "floatStyle");
    else
      -[UISystemInputAssistantViewController standardStyle](self, "standardStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UISystemInputAssistantViewController compactStyle](self, "compactStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (TUISystemInputAssistantStyleStandard)standardStyle
{
  TUISystemInputAssistantStyleStandard *standardStyle;
  void *v4;
  objc_class *v5;
  TUISystemInputAssistantStyleStandard *v6;
  TUISystemInputAssistantStyleStandard *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  standardStyle = self->_standardStyle;
  if (!standardStyle)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getTUISystemInputAssistantStyleStandardClass_softClass;
    v13 = getTUISystemInputAssistantStyleStandardClass_softClass;
    if (!getTUISystemInputAssistantStyleStandardClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantStyleStandardClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getTUISystemInputAssistantStyleStandardClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (TUISystemInputAssistantStyleStandard *)objc_alloc_init(v5);
    v7 = self->_standardStyle;
    self->_standardStyle = v6;

    standardStyle = self->_standardStyle;
  }
  return standardStyle;
}

- (id)_customCenterBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (!v4)
  {
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[UISystemInputAssistantViewController _canShowCenterBarButtonItem](self, "_canShowCenterBarButtonItem"))
  {
    -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIResponderFindInputAssistantItem(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_centerBarButtonGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "count");

    if (v8)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "showsCandidateBar")
        && (objc_msgSend(v9, "candidateController"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v10, "hasCandidates"),
            v10,
            (v11 & 1) != 0))
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v6, "_centerBarButtonGroups");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "barButtonItems");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)cachedPredictiveViewControllers
{
  return self->_cachedPredictiveViewControllers;
}

- (void)setPredictiveViewController:(id)a3
{
  objc_storeStrong((id *)&self->_predictiveViewController, a3);
}

- (void)setOverrideSafeAreaInsets
{
  void *v3;
  char v4;
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
  double v15;
  void *v16;
  id v17;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0 && +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (self->_assistantBarStyle)
    {
      -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeAreaInsets");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      v15 = v12 - *(double *)&UIFloatingAssistantBottomMargin;
    }
    else
    {
      -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 0.0;
      objc_msgSend(v16, "setSafeAreaInsets:", 0.0, 0.0, 0.0, 0.0);

      v10 = 0.0;
      v15 = 0.0;
      v14 = 0.0;
    }
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOverrideSafeAreaInsets:", v8, v10, v15, v14);

  }
}

+ (BOOL)shouldShowSystemInputAssistantItems
{
  void *v2;
  BOOL v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (void)_didChangePlacementOrInputSourceNotification:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTransitioning");

  if ((v5 & 1) == 0)
    -[UISystemInputAssistantViewController updateCenterViewVisibilityStateForInputDelegate:](self, "updateCenterViewVisibilityStateForInputDelegate:", 0);
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsValidation");

  -[UISystemInputAssistantViewController observedInputAssistantItem](self, "observedInputAssistantItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController _updateSystemInputAssistantViewStylingForInputAssistantItem:](self, "_updateSystemInputAssistantViewStylingForInputAssistantItem:", v7);

  -[UISystemInputAssistantViewController _updateLanguageIndicatorPointerInteractionAndImage](self, "_updateLanguageIndicatorPointerInteractionAndImage");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "_shouldMinimizeForHardwareKeyboard") & 1) != 0)
  {
    objc_msgSend(v11, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("UITextInputSourceDidChangeNotification"));

    if (v10)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_650);
  }
  else
  {

  }
}

- (UITextInputAssistantItem)observedInputAssistantItem
{
  return (UITextInputAssistantItem *)objc_loadWeakRetained((id *)&self->_observedInputAssistantItem);
}

- (void)_updateSystemInputAssistantViewStylingForInputAssistantItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
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

  v21 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isMinimized") & 1) != 0 || (objc_msgSend(v5, "isCustomInputView") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "inputView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8 == 0;

  }
  +[UIColor clearColor](UIColor, "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController _defaultTintColor](self, "_defaultTintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v21, "_detachedTintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v21, "_detachedTintColor");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      goto LABEL_9;
    objc_msgSend(v21, "_detachedBackgroundEffect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v13 != 0;
    if (v13)
    {
      objc_msgSend(v21, "_detachedBackgroundEffect");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "backdropView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setEffect:", v14);

    }
    else
    {
      objc_msgSend(v21, "_detachedBackgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
LABEL_9:
        v7 = 0;
LABEL_15:
        -[UISystemInputAssistantViewController _dismissEmojiSearch](self, "_dismissEmojiSearch");
        goto LABEL_16;
      }
      objc_msgSend(v21, "_detachedBackgroundColor");
      v14 = v9;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_15;
  }
LABEL_16:
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v10);

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBackgroundColor:", v9);

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundVisible:", v7);

}

- (void)_updateLanguageIndicatorPointerInteractionAndImage
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[UISystemInputAssistantViewController inputWindowController](self, "inputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAssistantViewPlacement(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v5;
  v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "systemInputAssistantItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leadingBarButtonGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v25)
  {
    v23 = v6 ^ 1;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v9);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v11, "barButtonItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v27 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              if (objc_msgSend(v17, "tag") == 1735287116)
              {
                objc_msgSend(v17, "view");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v17, "view");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setPointerInteractionEnabled:", v23);

                  +[UIAssistantBarButtonItemProvider languageIndicatorImage](UIAssistantBarButtonItemProvider, "languageIndicatorImage");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setImage:", v21);

                  goto LABEL_17;
                }
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v25);
  }

}

- (id)_defaultTintColor
{
  void *v2;
  void *v3;
  void *v4;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "lightKeyboard") & 1) != 0)
    +[UIColor blackColor](UIColor, "blackColor");
  else
    +[UIColor whiteColor](UIColor, "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_dismissEmojiSearch
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emojiSearchView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
  {
    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emojiSearchView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resignFirstResponder");

  }
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
  {
    -[TUIEmojiSearchInputViewController view](self->_emojiSearchViewController, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setLocalOverrideTraitCollection:", 0);

  }
}

+ (double)_defaultPreferredHeightForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_defaultPreferredHeightForTraitCollection:interfaceOrientation:", v4, objc_msgSend(a1, "keyboardOrientation"));
  v6 = v5;

  return v6;
}

+ (int64_t)keyboardOrientation
{
  void *v3;
  int64_t v4;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    return +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation");
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

+ (double)_defaultPreferredHeightForTraitCollection:(id)a3 interfaceOrientation:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v16;
  void *v17;
  int v18;
  int has_internal_diagnostics;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
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
  double v52;
  double v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  BOOL v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  BOOL v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint8_t buf[4];
  unint64_t v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rootInputWindowController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAssistantViewPlacement(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (objc_msgSend(v9, "isFloating") & 1) == 0 && (objc_msgSend(v9, "isHiddenForFloatingTransition") & 1) == 0)
  {
    v11 = objc_msgSend(v5, "userInterfaceIdiom");
    +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBScreenTraits traitsWithScreen:orientation:](UIKBScreenTraits, "traitsWithScreen:orientation:", v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == -1)
      v11 = objc_msgSend(v13, "idiom");
    v14 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(v13, v11, 0);
    v10 = 55.0;
    if ((unint64_t)(v14 - 23) < 4)
      goto LABEL_8;
    v16 = v14;
    if (v14 == 1)
      goto LABEL_8;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldShowCandidateBar");

    if (!v18)
    {
      if ((unint64_t)(a4 - 3) >= 2)
      {
        if (v16 != 21)
        {
          if (v16 == 22)
            v10 = 45.0;
          else
            v10 = __103__UISystemInputAssistantViewController__defaultPreferredHeightForTraitCollection_interfaceOrientation___block_invoke(v16);
          goto LABEL_8;
        }
        *(double *)&v39 = 44.0;
      }
      else
      {
        *(double *)&v39 = 38.0;
      }
      goto LABEL_38;
    }
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "candidateController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "screenTraits");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "idiom");
    if (!has_internal_diagnostics)
    {
      if (v23 != 1)
      {
        v91 = v21;
        v94 = v20;
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "candidateController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "screenTraits");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "idiom") != 24)
        {
          v82 = v25;
          v85 = v24;
          v88 = v22;
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "candidateController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "screenTraits");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "idiom") != 25)
          {
            v71 = v29;
            v74 = v28;
            v80 = v27;
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "candidateController");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "screenTraits");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "idiom") == 26)
            {
              v77 = 1;
            }
            else
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "candidateController");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "screenTraits");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v58, "idiom") == 23;

            }
            if (!v77)
              goto LABEL_25;
            goto LABEL_19;
          }

          v24 = v85;
          v22 = v88;
          v25 = v82;
        }

        v21 = v91;
        v20 = v94;
      }

LABEL_19:
      v30 = _defaultPreferredHeightForTraitCollection_interfaceOrientation____s_category;
      if (!_defaultPreferredHeightForTraitCollection_interfaceOrientation____s_category)
      {
        v30 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v30, (unint64_t *)&_defaultPreferredHeightForTraitCollection_interfaceOrientation____s_category);
      }
      v31 = *(NSObject **)(v30 + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = v31;
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v33 = objc_claimAutoreleasedReturnValue();
        -[NSObject candidateController](v33, "candidateController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "screenTraits");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218240;
        v98 = v16;
        v99 = 2048;
        v100 = objc_msgSend(v35, "idiom");
        _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "%ld != %ld", buf, 0x16u);

        goto LABEL_23;
      }
LABEL_25:
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "candidateController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "screenTraits");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "idiom") == 1)
      {

      }
      else
      {
        v95 = v36;
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "candidateController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "screenTraits");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v42, "idiom") == 24)
        {

        }
        else
        {
          v89 = v38;
          v92 = v37;
          v86 = v40;
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "candidateController");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "screenTraits");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v45, "idiom") != 25)
          {
            v76 = v45;
            v79 = v44;
            v83 = v43;
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "candidateController");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "screenTraits");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v46, "idiom") == 26)
            {
              v67 = 1;
            }
            else
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "candidateController");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "screenTraits");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend(v49, "idiom") == 23;

            }
            if (!v67)
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "candidateController");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "candidateBarHeight");
              v53 = v52;
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "candidateController");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "candidateBarEdgeInsetsForOrientation:", a4);
              v10 = v53 + v56;

              goto LABEL_8;
            }
            goto LABEL_37;
          }

        }
      }
LABEL_37:
      *(double *)&v39 = 42.0;
LABEL_38:
      v10 = *(double *)&v39;
LABEL_8:

      goto LABEL_9;
    }
    if (v23 != 1)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "candidateController");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "screenTraits");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "idiom") != 24)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "candidateController");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "screenTraits");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v84, "idiom") != 25)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "candidateController");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "screenTraits");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v75, "idiom") == 26)
          {
            v72 = 1;
          }
          else
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "candidateController");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "screenTraits");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend(v63, "idiom") == 23;

          }
          if (!v72)
            goto LABEL_25;
LABEL_57:
          __UIFaultDebugAssertLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
            goto LABEL_24;
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "candidateController");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "screenTraits");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218240;
          v98 = v16;
          v99 = 2048;
          v100 = objc_msgSend(v61, "idiom");
          _os_log_fault_impl(&dword_185066000, v33, OS_LOG_TYPE_FAULT, "%ld != %ld", buf, 0x16u);

LABEL_23:
LABEL_24:

          goto LABEL_25;
        }

      }
    }

    goto LABEL_57;
  }
  v10 = 38.0;
LABEL_9:

  return v10;
}

- (TUISystemInputAssistantLayoutStandard)standardAssistantViewLayout
{
  void *v3;
  objc_class *v4;
  TUISystemInputAssistantLayoutStandard *v5;
  TUISystemInputAssistantLayoutStandard *standardAssistantViewLayout;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  TUISystemInputAssistantLayoutStandard *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->_standardAssistantViewLayout)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v3 = (void *)getTUISystemInputAssistantLayoutStandardClass_softClass;
    v17 = getTUISystemInputAssistantLayoutStandardClass_softClass;
    if (!getTUISystemInputAssistantLayoutStandardClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getTUISystemInputAssistantLayoutStandardClass_block_invoke;
      v13[3] = &unk_1E16B14C0;
      v13[4] = &v14;
      __getTUISystemInputAssistantLayoutStandardClass_block_invoke((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v14, 8);
    v5 = (TUISystemInputAssistantLayoutStandard *)objc_alloc_init(v4);
    standardAssistantViewLayout = self->_standardAssistantViewLayout;
    self->_standardAssistantViewLayout = v5;

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (+[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"))
      v8 = objc_msgSend(v7, "centerFilled") ^ 1;
    else
      v8 = 0;
    -[TUISystemInputAssistantLayoutStandard setIsSplit:](self->_standardAssistantViewLayout, "setIsSplit:", v8);
    objc_msgSend(v7, "frameForKeylayoutName:", CFSTR("split-left"));
    -[TUISystemInputAssistantLayoutStandard setLeftSplitWidth:](self->_standardAssistantViewLayout, "setLeftSplitWidth:", v9);
    objc_msgSend(v7, "frameForKeylayoutName:", CFSTR("split-right"));
    -[TUISystemInputAssistantLayoutStandard setRightSplitWidth:](self->_standardAssistantViewLayout, "setRightSplitWidth:", v10);
  }
  v11 = self->_standardAssistantViewLayout;

  return v11;
}

- (void)_willChangePlacementNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[UISystemInputAssistantViewController expandedItemsController](self, "expandedItemsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UISystemInputAssistantViewController expandedItemsController](self, "expandedItemsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentedView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  -[UISystemInputAssistantViewController _updateCenterViewWidthForInterfaceOrientation:](self, "_updateCenterViewWidthForInterfaceOrientation:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
}

- (UIViewController)expandedItemsController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_expandedItemsController);
}

- (UISystemInputAssistantViewController)init
{
  UISystemInputAssistantViewController *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISystemInputAssistantViewController;
  v2 = -[UIInputViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[UISystemInputAssistantViewController setCachedPredictiveViewControllers:](v2, "setCachedPredictiveViewControllers:", v3);

    v2->_hasCheckedPreferences = 0;
    v2->_currentlyCheckingPreferences = 0;
    -[UISystemInputAssistantViewController updateAssistantPreferences](v2, "updateAssistantPreferences");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_preferencesControllerChanged_, *MEMORY[0x1E0DBE478], 0);

  }
  return v2;
}

- (void)updateAssistantPreferences
{
  NSObject *v3;
  _QWORD block[5];

  if (!-[UISystemInputAssistantViewController hasCheckedPreferences](self, "hasCheckedPreferences")
    && !-[UISystemInputAssistantViewController currentlyCheckingPreferences](self, "currentlyCheckingPreferences"))
  {
    -[UISystemInputAssistantViewController setCurrentlyCheckingPreferences:](self, "setCurrentlyCheckingPreferences:", 1);
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(v3, block);

  }
}

uint64_t __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentlyCheckingPreferences:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setHasCheckedPreferences:", 1);
}

- (void)setCurrentlyCheckingPreferences:(BOOL)a3
{
  self->_currentlyCheckingPreferences = a3;
}

- (void)setCachedPredictiveViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPredictiveViewControllers, a3);
}

- (BOOL)currentlyCheckingPreferences
{
  return self->_currentlyCheckingPreferences;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[UISystemInputAssistantViewController preferredHeightForTraitCollection:orientation:](self, "preferredHeightForTraitCollection:orientation:", v4, objc_msgSend((id)objc_opt_class(), "keyboardOrientation"));
  v6 = v5;

  return v6;
}

- (double)preferredHeightForTraitCollection:(id)a3 orientation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _UILayerHostView *remoteAssistantView;
  double v15;

  v6 = a3;
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController automaticallySetCenterViewControllerBasedOnInputDelegate:](self, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v8);

  }
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (-[UISystemInputAssistantViewController centerViewController](self, "centerViewController"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "preferredHeightForTraitCollection:", v6),
        v12 = v11,
        v10,
        v12 == -1.0))
  {
    objc_msgSend((id)objc_opt_class(), "_defaultPreferredHeightForTraitCollection:interfaceOrientation:", v6, a4);
    v12 = v13;
  }
  remoteAssistantView = self->_remoteAssistantView;
  if (remoteAssistantView)
  {
    if (!-[UIView isHidden](remoteAssistantView, "isHidden"))
    {
      -[UIRemoteInputViewInfo size](self->_remoteAssistantViewInfo, "size");
      if (v12 < v15)
        v12 = v15;
    }
  }

  return v12;
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__UISystemInputAssistantViewController__applicationDidBecomeActiveNotification___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queueDelayedTask:forKey:", v6, v5);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
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
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;

  v39 = a3;
  v8 = a5;
  if (objc_msgSend(v39, "isEqualToString:", CFSTR("bounds")))
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGRectValue");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CGRectValue");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    v40.origin.x = v11;
    v40.origin.y = v13;
    v40.size.width = v15;
    v40.size.height = v17;
    v41.origin.x = v20;
    v41.origin.y = v22;
    v41.size.width = v24;
    v41.size.height = v26;
    if (!CGRectEqualToRect(v40, v41))
    {
      -[UIViewController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "window");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        -[UIViewController view](self, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "window");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "_toWindowOrientation");

      }
      else
      {
        v31 = objc_msgSend((id)objc_opt_class(), "keyboardOrientation");
      }

      -[UISystemInputAssistantViewController _updateCenterViewWidthForInterfaceOrientation:](self, "_updateCenterViewWidthForInterfaceOrientation:", v31);
    }
  }
  else
  {
    if (objc_msgSend(v39, "isEqualToString:", CFSTR("centerBarButtonGroups")))
    {
      -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputAssistantViewController automaticallySetCenterViewControllerBasedOnInputDelegate:](self, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v32);
    }
    else
    {
      -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setNeedsValidation");

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "hasSuffix:", CFSTR("BarButtonGroups"))
        && (v34 != v32 || (objc_msgSend(v32, "isEqual:", v32) & 1) == 0))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "remoteTextInputPartner");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "documentTraitsChanged");

        -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UISystemInputAssistantViewController observedInputAssistantItem](self, "observedInputAssistantItem");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setInputAssistantItem:force:", v38, 1);

        }
      }

    }
  }

}

- (void)_updateCenterViewWidthAndRenderConfig
{
  void *v3;
  void *v4;
  id v5;

  -[UISystemInputAssistantViewController _updateCenterViewWidthForInterfaceOrientation:](self, "_updateCenterViewWidthForInterfaceOrientation:", +[UIKeyboardSceneDelegate interfaceOrientation](UIKeyboardSceneDelegate, "interfaceOrientation"));
  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRenderConfig:", v3);

}

- (void)setCenterViewController:(id)a3
{
  UIPredictiveViewController *v5;
  UIPredictiveViewController *centerViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIPredictiveViewController *v11;

  v5 = (UIPredictiveViewController *)a3;
  centerViewController = self->_centerViewController;
  v11 = v5;
  if (centerViewController != v5)
  {
    -[UIPredictiveViewController removeFromParentViewController](centerViewController, "removeFromParentViewController");
    -[UIPredictiveViewController view](self->_centerViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_storeStrong((id *)&self->_centerViewController, a3);
    if (v11)
    {
      -[UIPredictiveViewController view](v11, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

      -[UIViewController addChildViewController:](self, "addChildViewController:", v11);
      -[UIPredictiveViewController view](v11, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setCenterView:", v9);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIPredictiveViewController setAssistantBarStyle:](v11, "setAssistantBarStyle:", self->_assistantBarStyle);
  }

}

void __78__UISystemInputAssistantViewController__queueResponderChangedForNewResponder___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1008));
  v3 = objc_msgSend(WeakRetained, "__isKindOfUIView");

  if (v3)
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1008));
  else
    v4 = 0;
  v14 = v4;
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemInputAssistantViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  v8 = v14;
  if (v6 == v7)
  {
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1008));

    if (v9)
    {
      v10 = *(id **)(a1 + 32);
      v11 = objc_loadWeakRetained(v10 + 126);
      objc_msgSend(v10, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "_responderCapabilitiesChangedNotification:", 0);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1016);
    *(_QWORD *)(v12 + 1016) = 0;

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1008), 0);
    v8 = v14;
  }

}

- (void)_responderCapabilitiesChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsValidation");

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "showsExpandableButtonBarItems"))
    goto LABEL_22;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "centerViewHidden");

  if ((v7 & 1) == 0)
  {
    v8 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inputDelegateManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "forwardingInputDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 == 0;

    }
    else
    {
      v12 = 1;
    }
    objc_msgSend(v24, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("UITextInputResponderCapabilitiesChangedKeyboardOutputKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("UITextInputResponderCapabilitiesChangedSelectionDidChangeKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v5)
      v17 = 1;
    else
      v17 = v16;
    if ((v17 | v8) == 1)
    {
      if (((v16 | v8) & 1) != 0)
      {
        v18 = 0;
LABEL_18:
        if ((v12 & ((v18 || v8) | v16)) == 1)
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "shouldCollapseButtonBarForFeedbackUI") ^ 1;

        }
        else
        {
          v22 = 0;
        }
        -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setButtonBarItemsExpanded:animated:", v22, 1);

        goto LABEL_22;
      }
      if (!objc_msgSend(v5, "deletionCount"))
      {
        objc_msgSend(v5, "insertionText");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          v18 = objc_msgSend(v19, "rangeOfCharacterFromSet:", v20) != 0x7FFFFFFFFFFFFFFFLL;
        else
          v18 = 0;

        goto LABEL_18;
      }
    }
    else
    {
      v5 = 0;
    }
LABEL_22:

  }
}

void __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD block[5];

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAssistantEnabledPreference:", objc_msgSend(v3, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE1C0]));

  if (os_variant_has_internal_diagnostics())
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferencesActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setAssistantOniPhonePreference:", objc_msgSend(v5, "BOOLForPreferenceKey:", CFSTR("KeyboardAssistantOniPhone")));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__UISystemInputAssistantViewController_updateAssistantPreferences__block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;

  -[UISystemInputAssistantViewController _registerForAssistantViewNotifications](self, "_registerForAssistantViewNotifications");
  -[UIViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_inheritedRenderConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRenderConfig:", v3);

}

- (void)_registerForAssistantViewNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__responderChangedNotification_, CFSTR("UITextInputResponderDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__responderCapabilitiesChangedNotification_, CFSTR("UITextInputResponderCapabilitiesChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__responderChangedNotification_, CFSTR("UIKeyboardLayoutDidChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__showCandidates, CFSTR("UIKeyboardCandidatesAvailable"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__collapseBarItems, CFSTR("UIKeyboardPredictionsAvailable"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willChangeTextEffectsRotationNotification_, CFSTR("UITextEffectsWindowViewControllerWillRotateNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didChangeTextEffectsRotationNotification_, CFSTR("UITextEffectsWindowViewControllerDidRotateNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didChangePlacementOrInputSourceNotification_, CFSTR("UITextInputSourceDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willChangePlacementNotification_, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didChangePlacementOrInputSourceNotification_, CFSTR("UIKeyboardDidChangeFrameNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__expandBarItems, CFSTR("UIKeyboardShouldExpandAssistantBarItems"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActiveNotification_, CFSTR("UIApplicationDidBecomeActiveNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__candidatesChanged, CFSTR("UIKeyboardCandidatesChanged"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__inputModeChanged_, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__writingDirectionChanged_, 0x1E174CBE0, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__textDidChange, CFSTR("UITextFieldTextDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__textDidChange, CFSTR("UITextViewTextDidChangeNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willShowKeyboardSwitcher, 0x1E174CBC0, 0);
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__keyboardDictationAvailabilityDidChangeNotification_, CFSTR("UIKeyboardDictationAvailabilityDidChangeNotification"), 0);
  }

}

- (void)_writingDirectionChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEmojiInputMode") & 1) != 0
    || (-[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchViewController, "emojiSearchView"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "searchTextField"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isActive"),
        v7,
        v6,
        v8))
  {
    if (!+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled")|| (-[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchViewController, "emojiSearchView"), v9 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v9, "searchTextField"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "isActive"), v10, v9, (v11 & 1) != 0))
    {
      objc_msgSend(v17, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("writingDirection"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      -[TUIEmojiSearchInputViewController view](self->_emojiSearchViewController, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UITraitCollection traitCollectionWithLayoutDirection:](UITraitCollection, "traitCollectionWithLayoutDirection:", v14 == 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_setLocalOverrideTraitCollection:", v16);

LABEL_8:
      goto LABEL_9;
    }
LABEL_7:
    -[TUIEmojiSearchInputViewController view](self->_emojiSearchViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setLocalOverrideTraitCollection:", 0);
    goto LABEL_8;
  }
  if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled"))
    goto LABEL_7;
LABEL_9:

}

uint64_t __80__UISystemInputAssistantViewController__applicationDidBecomeActiveNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCenterViewWidthAndRenderConfig");
}

- (void)dismissLanguageIndicatorMenuIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemInputAssistantItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingBarButtonGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "barButtonItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              if (objc_msgSend(v12, "tag") == 1735287116)
              {
                objc_msgSend(v12, "view");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v12, "view");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "contextMenuInteraction");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "dismissMenu");

                  goto LABEL_17;
                }
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

}

- (void)dismissKeyboardItemIfNeeded
{
  -[UISystemInputAssistantViewController dismissLanguageIndicatorMenuIfNeeded](self, "dismissLanguageIndicatorMenuIfNeeded");
  -[UISystemInputAssistantViewController dismissDictationMenuIfNeeded](self, "dismissDictationMenuIfNeeded");
}

- (void)dismissDictationMenuIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemInputAssistantItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingBarButtonGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v19 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "barButtonItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              if (objc_msgSend(v12, "tag") == 1944175551)
              {
                objc_msgSend(v12, "view");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v12, "view");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "contextMenuInteraction");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "dismissMenu");

                  goto LABEL_17;
                }
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

}

- (void)_keyboardDictationAvailabilityDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsValidation");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController setInputAssistantButtonItemsForResponder:](self, "setInputAssistantButtonItemsForResponder:", v5);

}

- (void)_inputModeChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 isButtonBarItemsInlineVisible;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emojiSearchView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "isActive");
  if (-[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode"))
    -[UISystemInputAssistantViewController _dismissEmojiSearch](self, "_dismissEmojiSearch");
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("UITextInputFromInputModeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEmojiInputMode") & 1) == 0
    && (-[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode") | v8) == 1)
  {
    v19 = CFSTR("UIKeyboardSwitchToEmojiIsEmojiInputMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("UIKeyboardSwitchToEmoji"), 0, v12);

    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isButtonBarItemsInlineVisible = objc_msgSend(v14, "showsButtonBarItemsInline");

    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShowsButtonBarItemsInline:", 0);

LABEL_12:
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "isEmojiInputMode")
    && ((-[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode") | v8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("UIKeyboardSwitchedAwayFromEmoji"), 0);

    isButtonBarItemsInlineVisible = self->_isButtonBarItemsInlineVisible;
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setShowsButtonBarItemsInline:", isButtonBarItemsInlineVisible);

    self->_postedSwitchFromEmojiNotification = 1;
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "isEmojiInputMode")
    && !-[UISystemInputAssistantViewController _isEmojiInputMode](self, "_isEmojiInputMode")
    && ((v8 ^ 1) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("UIKeyboardSwitchToEmojiSearch"), 0);
    goto LABEL_12;
  }
LABEL_14:
  -[UISystemInputAssistantViewController dismissKeyboardItemIfNeeded](self, "dismissKeyboardItemIfNeeded");
  -[UISystemInputAssistantViewController updateRemoteAssistantViewHidden](self, "updateRemoteAssistantViewHidden");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[UISystemInputAssistantViewController _beginObservingInputAssistantItemForRelevantItemChanges:](self, "_beginObservingInputAssistantItemForRelevantItemChanges:", 0);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0DBE478], 0);

  v6.receiver = self;
  v6.super_class = (Class)UISystemInputAssistantViewController;
  -[UIInputViewController dealloc](&v6, sel_dealloc);
}

- (CGRect)barFrame
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

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerFrame");
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

double __103__UISystemInputAssistantViewController__defaultPreferredHeightForTraitCollection_interfaceOrientation___block_invoke(unint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  double v4;
  NSObject *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a1 < 9 && ((0x13Fu >> a1) & 1) != 0)
    return dbl_18667AF18[a1];
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 134217984;
      v8 = a1;
      _os_log_fault_impl(&dword_185066000, v6, OS_LOG_TYPE_FAULT, "Unexpected user interface idiom: %ld", (uint8_t *)&v7, 0xCu);
    }

    return -1.0;
  }
  else
  {
    v2 = kUISystemInputAssistantCenterViewLandscapeWidth_block_invoke___s_category;
    if (!kUISystemInputAssistantCenterViewLandscapeWidth_block_invoke___s_category)
    {
      v2 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v2, (unint64_t *)&kUISystemInputAssistantCenterViewLandscapeWidth_block_invoke___s_category);
    }
    v3 = *(NSObject **)(v2 + 8);
    v4 = -1.0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 134217984;
      v8 = a1;
      _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Unexpected user interface idiom: %ld", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (void)preferencesControllerChanged:(id)a3
{
  -[UISystemInputAssistantViewController setHasCheckedPreferences:](self, "setHasCheckedPreferences:", 0);
  -[UISystemInputAssistantViewController updateAssistantPreferences](self, "updateAssistantPreferences");
}

id __75__UISystemInputAssistantViewController__assistantItemsVisibleForResponder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    _UIResponderFindInputAssistantItem(*(void **)(a1 + 32));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

- (BOOL)_shouldCollapseEmojiSearchView
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emojiSearchView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActive") ^ 1;

  return v5;
}

- (void)_showCandidates
{
  void *v3;
  id v4;

  -[UISystemInputAssistantViewController candidateViewController](self, "candidateViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setButtonBarItemsExpanded:animated:", 0, 0);

  }
}

- (void)_candidatesChanged
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (-[UISystemInputAssistantViewController shouldShowEmojiSearchViewControllerForInputDelegate:](self, "shouldShowEmojiSearchViewControllerForInputDelegate:", 0))
  {
    -[UISystemInputAssistantViewController candidateViewController](self, "candidateViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "candidateController");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "hasCandidates")
        && (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v5, "hasMarkedText"),
            v5,
            v6))
      {
        -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "emojiSearchView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 1;
      }
      else
      {
        -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "emojiSearchView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = 0;
      }
      objc_msgSend(v8, "setPredictionViewVisible:animated:", v10, 1);

    }
  }
}

- (void)_expandBarItems
{
  id v2;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonBarItemsExpanded:animated:", 1, 1);

}

- (void)_collapseBarItems
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[UISystemInputAssistantViewController predictionViewController](self, "predictionViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "centerViewHidden");

    if ((v6 & 1) == 0)
    {
      -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setButtonBarItemsExpanded:animated:", 0, 1);

    }
  }
}

- (TUISystemInputAssistantLayout)floatAssistantViewLayout
{
  TUISystemInputAssistantLayout *floatAssistantViewLayout;
  void *v4;
  objc_class *v5;
  TUISystemInputAssistantLayout *v6;
  TUISystemInputAssistantLayout *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  floatAssistantViewLayout = self->_floatAssistantViewLayout;
  if (!floatAssistantViewLayout)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getTUISystemInputAssistantLayoutFloatClass_softClass;
    v13 = getTUISystemInputAssistantLayoutFloatClass_softClass;
    if (!getTUISystemInputAssistantLayoutFloatClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantLayoutFloatClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getTUISystemInputAssistantLayoutFloatClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (TUISystemInputAssistantLayout *)objc_alloc_init(v5);
    v7 = self->_floatAssistantViewLayout;
    self->_floatAssistantViewLayout = v6;

    floatAssistantViewLayout = self->_floatAssistantViewLayout;
  }
  return floatAssistantViewLayout;
}

- (TUISystemInputAssistantLayout)compactAssistantViewLayout
{
  void *v3;
  objc_class *v4;
  TUISystemInputAssistantLayout *v5;
  TUISystemInputAssistantLayout *compactAssistantViewLayout;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (!self->_compactAssistantViewLayout)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v3 = (void *)getTUISystemInputAssistantLayoutCompactClass_softClass;
    v12 = getTUISystemInputAssistantLayoutCompactClass_softClass;
    if (!getTUISystemInputAssistantLayoutCompactClass_softClass)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __getTUISystemInputAssistantLayoutCompactClass_block_invoke;
      v8[3] = &unk_1E16B14C0;
      v8[4] = &v9;
      __getTUISystemInputAssistantLayoutCompactClass_block_invoke((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v9, 8);
    v5 = (TUISystemInputAssistantLayout *)objc_alloc_init(v4);
    compactAssistantViewLayout = self->_compactAssistantViewLayout;
    self->_compactAssistantViewLayout = v5;

  }
  return self->_compactAssistantViewLayout;
}

- (TUISystemInputAssistantLayoutSplit)splitAssistantViewLayout
{
  void *v3;
  objc_class *v4;
  TUISystemInputAssistantLayoutSplit *v5;
  TUISystemInputAssistantLayoutSplit *splitAssistantViewLayout;
  void *v7;
  void *v8;
  double v9;
  double v10;
  TUISystemInputAssistantLayoutSplit *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (!self->_splitAssistantViewLayout)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v3 = (void *)getTUISystemInputAssistantLayoutSplitClass_softClass;
    v17 = getTUISystemInputAssistantLayoutSplitClass_softClass;
    if (!getTUISystemInputAssistantLayoutSplitClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getTUISystemInputAssistantLayoutSplitClass_block_invoke;
      v13[3] = &unk_1E16B14C0;
      v13[4] = &v14;
      __getTUISystemInputAssistantLayoutSplitClass_block_invoke((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v14, 8);
    v5 = (TUISystemInputAssistantLayoutSplit *)objc_alloc_init(v4);
    splitAssistantViewLayout = self->_splitAssistantViewLayout;
    self->_splitAssistantViewLayout = v5;

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "frameForKeylayoutName:", CFSTR("split-left"));
    -[TUISystemInputAssistantLayoutSplit setLeftSplitWidth:](self->_splitAssistantViewLayout, "setLeftSplitWidth:", v9);
    objc_msgSend(v8, "frameForKeylayoutName:", CFSTR("split-right"));
    -[TUISystemInputAssistantLayoutSplit setRightSplitWidth:](self->_splitAssistantViewLayout, "setRightSplitWidth:", v10);
  }
  v11 = self->_splitAssistantViewLayout;

  return v11;
}

- (TUISystemInputAssistantStyleFloat)floatStyle
{
  TUISystemInputAssistantStyleFloat *floatStyle;
  void *v4;
  objc_class *v5;
  TUISystemInputAssistantStyleFloat *v6;
  TUISystemInputAssistantStyleFloat *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  floatStyle = self->_floatStyle;
  if (!floatStyle)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getTUISystemInputAssistantStyleFloatClass_softClass;
    v13 = getTUISystemInputAssistantStyleFloatClass_softClass;
    if (!getTUISystemInputAssistantStyleFloatClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantStyleFloatClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getTUISystemInputAssistantStyleFloatClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (TUISystemInputAssistantStyleFloat *)objc_alloc_init(v5);
    v7 = self->_floatStyle;
    self->_floatStyle = v6;

    floatStyle = self->_floatStyle;
  }
  return floatStyle;
}

- (TUISystemInputAssistantStyleCompact)compactStyle
{
  TUISystemInputAssistantStyleCompact *compactStyle;
  void *v4;
  objc_class *v5;
  TUISystemInputAssistantStyleCompact *v6;
  TUISystemInputAssistantStyleCompact *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  compactStyle = self->_compactStyle;
  if (!compactStyle)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getTUISystemInputAssistantStyleCompactClass_softClass;
    v13 = getTUISystemInputAssistantStyleCompactClass_softClass;
    if (!getTUISystemInputAssistantStyleCompactClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getTUISystemInputAssistantStyleCompactClass_block_invoke;
      v9[3] = &unk_1E16B14C0;
      v9[4] = &v10;
      __getTUISystemInputAssistantStyleCompactClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (TUISystemInputAssistantStyleCompact *)objc_alloc_init(v5);
    v7 = self->_compactStyle;
    self->_compactStyle = v6;

    compactStyle = self->_compactStyle;
  }
  return compactStyle;
}

- (BOOL)updateFloatingAssistantRectEdge:(unint64_t)a3 position:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  y = a4.y;
  x = a4.x;
  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackHorizontalMovement:", x, y);

    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentRectEdge:", a3);

  }
  return v10 & 1;
}

- (void)prepareTransition:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];

  v4 = a4;
  UIAssistantViewPlacement(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = UIGetAssistantBarStyleFromPlacement(v6);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__UISystemInputAssistantViewController_prepareTransition_animated___block_invoke;
  v13[3] = &unk_1E16B1888;
  v13[4] = self;
  v13[5] = v7;
  v8 = _Block_copy(v13);
  v9 = v8;
  if (v4)
  {
    -[UISystemInputAssistantViewController layoutFromAssistantBarStyle:](self, "layoutFromAssistantBarStyle:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController styleFromAssistantBarStyle:](self, "styleFromAssistantBarStyle:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transitionToLayout:withStyle:start:", v10, v11, v9);

  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }
  -[UISystemInputAssistantViewController _updateViewsForAssistantBarStyle:](self, "_updateViewsForAssistantBarStyle:", v7);

}

void __67__UISystemInputAssistantViewController_prepareTransition_animated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updateAssistantBarStyle:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "observedInputAssistantItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateSystemInputAssistantViewStylingForInputAssistantItem:", v3);

}

- (void)setNeedsValidation
{
  id v2;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsValidation");

}

- (void)setRemoteAssistantViewInfo:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  double v18;
  int v19;
  _UILayerHostView *v20;
  _UILayerHostView *remoteAssistantView;
  UIView *v22;
  UIView *v23;
  UIView *remoteAssistantContainerView;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_storeStrong((id *)&self->_remoteAssistantViewInfo, a3);
  objc_msgSend(v31, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v31, "insets");
  v11 = v10;
  if (v9 <= 50.0)
    v12 = v9;
  else
    v12 = 50.0;
  if (objc_msgSend(v31, "contextId"))
  {
    v13 = v11 + fmin(v8, 120.0);
    -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UISystemInputAssistantViewController _shouldShowExpandableButtonBarItemsForResponder:](self, "_shouldShowExpandableButtonBarItemsForResponder:", v16))
    {
      v17 = objc_opt_respondsToSelector();
    }
    else
    {
      v17 = 0;
    }
    v18 = v13 + v12;
    v19 = objc_msgSend(v31, "contextId");
    if (v19 != -[_UILayerHostView contextID](self->_remoteAssistantView, "contextID"))
    {
      -[UIView removeFromSuperview](self->_remoteAssistantView, "removeFromSuperview");
      v20 = -[_UILayerHostView initWithFrame:pid:contextID:]([_UILayerHostView alloc], "initWithFrame:pid:contextID:", objc_msgSend(v31, "processId"), objc_msgSend(v31, "contextId"), 0.0, -v11, v6, v18);
      remoteAssistantView = self->_remoteAssistantView;
      self->_remoteAssistantView = v20;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_remoteAssistantView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView setClipsToBounds:](self->_remoteAssistantView, "setClipsToBounds:", 1);
      -[NSObject setAccessibilityIdentifier:](self->_remoteAssistantView, "setAccessibilityIdentifier:", CFSTR("RemoteAssistantView"));
      v22 = [UIView alloc];
      v23 = -[UIView initWithFrame:](v22, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v6, v18);
      remoteAssistantContainerView = self->_remoteAssistantContainerView;
      self->_remoteAssistantContainerView = v23;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_remoteAssistantContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[NSObject setAccessibilityIdentifier:](self->_remoteAssistantContainerView, "setAccessibilityIdentifier:", CFSTR("RemoteAssistantContainerView"));
      -[UIView addSubview:](self->_remoteAssistantContainerView, "addSubview:", self->_remoteAssistantView);
    }
    if ((v17 & 1) != 0)
    {
      objc_msgSend(v14, "setSecondaryView:", self->_remoteAssistantContainerView);
    }
    else
    {
      -[UIView superview](self->_remoteAssistantContainerView, "superview");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 != v14)
        objc_msgSend(v14, "insertSubview:atIndex:", self->_remoteAssistantContainerView, 0);
    }
    -[UIView frame](self->_remoteAssistantView, "frame");
    if (v6 != v27 || v18 != v26)
    {
      -[UIView setFrame:](self->_remoteAssistantContainerView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v6, v18);
      -[UIView frame](self->_remoteAssistantView, "frame");
      -[UIView setFrame:](self->_remoteAssistantView, "setFrame:");
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "containerRootController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "updateViewSizingConstraints");

    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_remoteAssistantView, "removeFromSuperview");
    v14 = self->_remoteAssistantView;
    self->_remoteAssistantView = 0;
  }

  if (self->_remoteAssistantView)
  {
    -[UISystemInputAssistantViewController updateRemoteAssistantViewHidden](self, "updateRemoteAssistantViewHidden");
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController automaticallySetCenterViewControllerBasedOnInputDelegate:](self, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v30);

  }
}

- (void)applyRemoteAssistantItem:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;

  v4 = a3;
  -[UISystemInputAssistantViewController UIAssistantItemForRTIAssistantItem:](self, "UIAssistantItemForRTIAssistantItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController setRemoteAssistantItem:](self, "setRemoteAssistantItem:", v5);

  -[UISystemInputAssistantViewController setShowsRemoteInputDashViewController:](self, "setShowsRemoteInputDashViewController:", objc_msgSend(v4, "showsInputDashboardViewController"));
  objc_msgSend(v4, "centerViewPreferredWidth");
  v7 = v6;

  -[UISystemInputAssistantViewController setRemoteCenterViewPreferredWidth:](self, "setRemoteCenterViewPreferredWidth:", v7);
}

- (id)placeholderItemOfWidth:(double)a3
{
  UIBarButtonItem *v4;
  UIView *v5;
  UIBarButtonItem *v6;

  v4 = [UIBarButtonItem alloc];
  v5 = objc_alloc_init(UIView);
  v6 = -[UIBarButtonItem initWithCustomView:](v4, "initWithCustomView:", v5);

  -[UIBarButtonItem setWidth:](v6, "setWidth:", a3);
  return v6;
}

- (id)UIGroupsForRTIGroups:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  UIBarButtonItemGroup *v9;
  float v10;
  float v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  void *v22;
  id obj;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v5)
  {
    v6 = v5;
    v25 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
        v9 = objc_alloc_init(UIBarButtonItemGroup);
        objc_msgSend(v8, "representativeItemWidth");
        if (v10 > 0.0)
        {
          objc_msgSend(v8, "representativeItemWidth");
          -[UISystemInputAssistantViewController placeholderItemOfWidth:](self, "placeholderItemOfWidth:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIBarButtonItemGroup setRepresentativeItem:](v9, "setRepresentativeItem:", v12);

        }
        v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v8, "itemWidths");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v8, "itemWidths");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v28;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v20), "floatValue");
              -[UISystemInputAssistantViewController placeholderItemOfWidth:](self, "placeholderItemOfWidth:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addObject:", v22);

              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v18);
        }

        -[UIBarButtonItemGroup setBarButtonItems:](v9, "setBarButtonItems:", v15);
        objc_msgSend(v26, "addObject:", v9);

        ++v7;
      }
      while (v7 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v6);
  }

  return v26;
}

- (id)UIAssistantItemForRTIAssistantItem:(id)a3
{
  id v4;
  UITextInputAssistantItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    v4 = a3;
    v5 = objc_alloc_init(UITextInputAssistantItem);
    -[UITextInputAssistantItem _setShowsBarButtonItemsInline:](v5, "_setShowsBarButtonItemsInline:", objc_msgSend(v4, "showsBarButtonItemsInline"));
    objc_msgSend(v4, "detachedTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputAssistantItem _setDetachedTintColor:](v5, "_setDetachedTintColor:", v6);

    objc_msgSend(v4, "detachedBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputAssistantItem _setDetachedBackgroundColor:](v5, "_setDetachedBackgroundColor:", v7);

    -[UITextInputAssistantItem _setVisibleWhenMinimized:](v5, "_setVisibleWhenMinimized:", objc_msgSend(v4, "visibleWhenMinimized"));
    objc_msgSend(v4, "leadingBarButtonGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController UIGroupsForRTIGroups:](self, "UIGroupsForRTIGroups:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputAssistantItem setLeadingBarButtonGroups:](v5, "setLeadingBarButtonGroups:", v9);

    objc_msgSend(v4, "trailingBarButtonGroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UISystemInputAssistantViewController UIGroupsForRTIGroups:](self, "UIGroupsForRTIGroups:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextInputAssistantItem setTrailingBarButtonGroups:](v5, "setTrailingBarButtonGroups:", v11);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_willChangeTextEffectsRotationNotification:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("UITextEffectsWindow_toOrientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[UISystemInputAssistantViewController _updateCenterViewWidthForInterfaceOrientation:](self, "_updateCenterViewWidthForInterfaceOrientation:", v6);
}

- (void)_didChangeTextEffectsRotationNotification:(id)a3
{
  id v3;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsValidation");

}

- (void)_beginObservingInputAssistantItemForRelevantItemChanges:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ECD774C0 != -1)
    dispatch_once(&qword_1ECD774C0, &__block_literal_global_637);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (id)_MergedGlobals_18;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[UISystemInputAssistantViewController observedInputAssistantItem](self, "observedInputAssistantItem", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[UISystemInputAssistantViewController observedInputAssistantItem](self, "observedInputAssistantItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObserver:forKeyPath:", self, v10);

        }
        if (v4)
          objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, v10, 3, 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[UISystemInputAssistantViewController setObservedInputAssistantItem:](self, "setObservedInputAssistantItem:", v4);
}

void __96__UISystemInputAssistantViewController__beginObservingInputAssistantItemForRelevantItemChanges___block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = (uint64_t)&unk_1E1A93368;

}

void __85__UISystemInputAssistantViewController__didChangePlacementOrInputSourceNotification___block_invoke()
{
  id v0;

  +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded](UIAssistantBarButtonItemProvider, "updateFloatingAssistantBarIfNeeded");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateAssistantView");

}

- (double)_centerViewWidthForTraitCollection:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  -[UISystemInputAssistantViewController _centerViewWidthForTraitCollection:interfaceOrientation:](self, "_centerViewWidthForTraitCollection:interfaceOrientation:", v4, objc_msgSend((id)objc_opt_class(), "keyboardOrientation"));
  v6 = v5;

  return v6;
}

- (id)_popoverViewControllerForBarButtonItemGroup:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  UIExpandedBarItemsTableViewController *v13;
  void *v14;
  uint64_t v15;
  _UIButtonGroupViewController *v16;
  void *v17;
  _UIButtonGroupViewController *v18;
  double v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "_expandStyle");
  if (v5 == 1)
  {
LABEL_14:
    -[UISystemInputAssistantViewController popoverSourceView](self, "popoverSourceView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_lightStyleRenderConfig");

    v16 = [_UIButtonGroupViewController alloc];
    v27 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_UIButtonGroupViewController initWithBarButtonItemGroups:overLightKeyboard:](v16, "initWithBarButtonItemGroups:overLightKeyboard:", v17, v15);

    v13 = v18;
    v19 = 0.2;
    if ((_DWORD)v15)
      v19 = 1.0;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v19, 0.8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIExpandedBarItemsTableViewController setBackgroundColor:](v13, "setBackgroundColor:", v20);

    -[UISystemInputAssistantViewController _defaultTintColor](self, "_defaultTintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIExpandedBarItemsTableViewController setTintColor:](v13, "setTintColor:", v21);

  }
  else
  {
    if (!v5)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v4, "barButtonItems", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "title");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "length");

            if (!v12)
            {

              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v8)
            continue;
          break;
        }
      }

    }
    v13 = -[UIExpandedBarItemsTableViewController initWithBarButtonGroup:]([UIExpandedBarItemsTableViewController alloc], "initWithBarButtonGroup:", v4);
  }

  return v13;
}

- (void)systemInputAssistantView:(id)a3 wantsToShowCollapsedItemGroup:(id)a4 fromView:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  -[UISystemInputAssistantViewController setPopoverSourceView:](self, "setPopoverSourceView:", a5);
  -[UISystemInputAssistantViewController _popoverViewControllerForBarButtonItemGroup:](self, "_popoverViewControllerForBarButtonItemGroup:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setModalPresentationStyle:", 7);
  objc_msgSend(v9, "presentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  -[UISystemInputAssistantViewController setExpandedItemsController:](self, "setExpandedItemsController:", v9);

}

- (void)prepareForPopoverPresentation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UISystemInputAssistantViewController popoverSourceView](self, "popoverSourceView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSourceView:", v4);

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UISystemInputAssistantViewController popoverSourceView](self, "popoverSourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v6, "setSourceRect:");

  }
  objc_msgSend(v6, "setPermittedArrowDirections:", 2);

}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  -[UISystemInputAssistantViewController setPopoverSourceView:](self, "setPopoverSourceView:", 0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  void *v3;
  id v4;

  -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emojiSearchView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollapsed:", 0);

}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v3;
  id v4;

  self->_postedSwitchFromEmojiNotification = 0;
  v3 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changePreferredEmojiSearchInputModeForInputDelegate:", v3);

}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  id v3;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearForwardingInputDelegateAndResign:", 0);

}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  void *v4;
  void *v5;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateAssistantView");

  if (!self->_postedSwitchFromEmojiNotification)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("UIKeyboardSwitchedAwayFromEmoji"), 0);

    self->_postedSwitchFromEmojiNotification = 1;
  }
}

- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emojiSearchWillInsertEmoji:forSearchQuery:", v6, v5);

}

- (void)autocorrectionController:(id)a3 didUpdateAutocorrectionList:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[UISystemInputAssistantViewController emojiSearchViewController](self, "emojiSearchViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "autocorrectionListDidBecomeAvailable:", v10);

    }
  }

}

- (BOOL)shouldUseCustomBackground:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;

  v4 = a3;
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Playgrounds"));

  if (v6)
  {
    if (!v4)
    {
      -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[UISystemInputAssistantViewController remoteAssistantItem](self, "remoteAssistantItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _UIResponderFindInputAssistantItem(v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = UIShouldUseCustomBackground(v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_usesCustomBackground
{
  void *v2;
  void *v3;

  -[UISystemInputAssistantViewController systemInputAssistantView](self, "systemInputAssistantView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAssistantItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = UIShouldUseCustomBackground(v3);
  return (char)v2;
}

- (BOOL)isVisibleWhenMinimized
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    -[UISystemInputAssistantViewController remoteAssistantItem](self, "remoteAssistantItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UISystemInputAssistantViewController _currentInputDelegate](self, "_currentInputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISystemInputAssistantViewController _inputDelegateAsResponder:](self, "_inputDelegateAsResponder:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UIResponderFindInputAssistantItem(v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(v3, "_isVisibleWhenMinimized");

  return v6;
}

- (id)candidateViewController
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)compatibilityViewController
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UISystemInputAssistantViewController predictiveViewController](self, "predictiveViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  self->_assistantBarStyle = a3;
}

- (UIView)popoverSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_popoverSourceView);
}

- (void)setPopoverSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_popoverSourceView, a3);
}

- (void)setObservedInputAssistantItem:(id)a3
{
  objc_storeWeak((id *)&self->_observedInputAssistantItem, a3);
}

- (void)setStandardAssistantViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_standardAssistantViewLayout, a3);
}

- (void)setSplitAssistantViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_splitAssistantViewLayout, a3);
}

- (void)setFloatAssistantViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_floatAssistantViewLayout, a3);
}

- (void)setCompactAssistantViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_compactAssistantViewLayout, a3);
}

- (void)setStandardStyle:(id)a3
{
  objc_storeStrong((id *)&self->_standardStyle, a3);
}

- (void)setFloatStyle:(id)a3
{
  objc_storeStrong((id *)&self->_floatStyle, a3);
}

- (void)setCompactStyle:(id)a3
{
  objc_storeStrong((id *)&self->_compactStyle, a3);
}

- (UITextInputAssistantItem)remoteAssistantItem
{
  return self->_remoteAssistantItem;
}

- (void)setRemoteAssistantItem:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssistantItem, a3);
}

- (void)setShowsRemoteInputDashViewController:(BOOL)a3
{
  self->_showsRemoteInputDashViewController = a3;
}

- (void)setRemoteCenterViewPreferredWidth:(double)a3
{
  self->_remoteCenterViewPreferredWidth = a3;
}

- (void)setEmojiSearchViewController:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSearchViewController, a3);
}

- (void)setExpandedItemsController:(id)a3
{
  objc_storeWeak((id *)&self->_expandedItemsController, a3);
}

- (BOOL)assistantOniPhonePreference
{
  return self->_assistantOniPhonePreference;
}

- (void)setAssistantOniPhonePreference:(BOOL)a3
{
  self->_assistantOniPhonePreference = a3;
}

- (NSValue)currentInputDelegatePointerValue
{
  return self->_currentInputDelegatePointerValue;
}

- (void)setCurrentInputDelegatePointerValue:(id)a3
{
  objc_storeStrong((id *)&self->_currentInputDelegatePointerValue, a3);
}

- (_UILayerHostView)remoteAssistantView
{
  return self->_remoteAssistantView;
}

- (void)setRemoteAssistantView:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssistantView, a3);
}

- (UIView)remoteAssistantContainerView
{
  return self->_remoteAssistantContainerView;
}

- (void)setRemoteAssistantContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAssistantContainerView, a3);
}

- (UIRemoteInputViewInfo)remoteAssistantViewInfo
{
  return self->_remoteAssistantViewInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAssistantViewInfo, 0);
  objc_storeStrong((id *)&self->_remoteAssistantContainerView, 0);
  objc_storeStrong((id *)&self->_remoteAssistantView, 0);
  objc_storeStrong((id *)&self->_currentInputDelegatePointerValue, 0);
  objc_destroyWeak((id *)&self->_expandedItemsController);
  objc_storeStrong((id *)&self->_predictiveViewController, 0);
  objc_storeStrong((id *)&self->_emojiSearchViewController, 0);
  objc_storeStrong((id *)&self->_remoteAssistantItem, 0);
  objc_storeStrong((id *)&self->_compactStyle, 0);
  objc_storeStrong((id *)&self->_floatStyle, 0);
  objc_storeStrong((id *)&self->_standardStyle, 0);
  objc_storeStrong((id *)&self->_compactAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_floatAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_splitAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_standardAssistantViewLayout, 0);
  objc_storeStrong((id *)&self->_cachedPredictiveViewControllers, 0);
  objc_destroyWeak((id *)&self->_observedInputAssistantItem);
  objc_destroyWeak((id *)&self->_popoverSourceView);
  objc_storeStrong((id *)&self->_centerViewController, 0);
  objc_storeStrong((id *)&self->_pendingResponderChangedTimer, 0);
  objc_destroyWeak((id *)&self->_pendingResponderForChangedNotification);
}

- (void)showEmojiSearch:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  if (a3)
  {
    -[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchViewController, "emojiSearchView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCollapsed:", 0);

    -[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchViewController, "emojiSearchView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "searchTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
  else
  {
    v6 = -[UISystemInputAssistantViewController _shouldCollapseEmojiSearchView](self, "_shouldCollapseEmojiSearchView");
    -[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchViewController, "emojiSearchView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCollapsed:", v6);
  }

}

- (void)prepareForFloating:(BOOL)a3
{
  _BOOL8 v3;
  TUIEmojiSearchInputViewController *v5;
  TUIEmojiSearchInputViewController *emojiSearchViewController;

  v3 = a3;
  -[UISystemInputAssistantViewController centerViewController](self, "centerViewController");
  v5 = (TUIEmojiSearchInputViewController *)objc_claimAutoreleasedReturnValue();
  emojiSearchViewController = self->_emojiSearchViewController;

  if (v5 == emojiSearchViewController)
    -[TUIEmojiSearchInputViewController setUsesFloatingStyle:](self->_emojiSearchViewController, "setUsesFloatingStyle:", v3);
  if (self->_remoteAssistantView)
    -[UISystemInputAssistantViewController updateRemoteAssistantViewHidden](self, "updateRemoteAssistantViewHidden");
}

- (id)_emojiSearchField
{
  void *v2;
  void *v3;

  -[TUIEmojiSearchInputViewController emojiSearchView](self->_emojiSearchViewController, "emojiSearchView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
