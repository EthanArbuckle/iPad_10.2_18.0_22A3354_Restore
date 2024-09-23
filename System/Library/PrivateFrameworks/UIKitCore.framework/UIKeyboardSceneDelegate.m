@implementation UIKeyboardSceneDelegate

+ (id)automaticKeyboardArbiterClient
{
  void *v2;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard supportsAutoFillPanel](UIKeyboard, "supportsAutoFillPanel")
    && +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)keyboardWindow
{
  void *v3;
  void *v4;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
    {
      -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyboardWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)activeKeyboardSceneDelegate
{
  void *v2;
  void *v3;

  +[UIWindowScene _keyWindowScene]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasActiveKeyboardResponder
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 == v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (UIKeyboardSceneDelegate)initWithScene:(id)a3
{
  id v4;
  UIKeyboardSceneDelegate *v5;
  UIKeyboardSceneDelegate *v6;
  UIKeyboardVisualModeManager *v7;
  UIKeyboardVisualModeManager *visualModeManager;
  NSMutableArray *v9;
  NSMutableArray *animationStyleStack;
  NSMutableSet *v11;
  NSMutableSet *pinningResponders;
  uint64_t v13;
  UIInputViewSet *inputViewSet;
  UITextFormattingCoordinator *v15;
  UITextFormattingCoordinator *textFormattingCoordinator;
  uint64_t v17;
  NSMutableArray *postWaitingForInputUIBlocks;
  UIKBLocalAuthenticationObserver *v19;
  UIKBLocalAuthenticationObserver *localAuthenticationObserver;
  void *v21;
  UIRemoteInputViewHost *v22;
  UIRemoteInputViewHost *remoteInputViewHost;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIKeyboardSceneDelegate;
  v5 = -[UIKeyboardSceneDelegate init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = objc_alloc_init(UIKeyboardVisualModeManager);
    visualModeManager = v6->_visualModeManager;
    v6->_visualModeManager = v7;

    -[UIKeyboardVisualModeManager setDelegate:](v6->_visualModeManager, "setDelegate:", v6);
    *(_WORD *)&v6->_automaticAppearanceEnabled = 257;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    animationStyleStack = v6->_animationStyleStack;
    v6->_animationStyleStack = v9;

    v6->_reloadInputViewsForcedIsAllowed = 1;
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    pinningResponders = v6->_pinningResponders;
    v6->_pinningResponders = v11;

    +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
    v13 = objc_claimAutoreleasedReturnValue();
    inputViewSet = v6->_inputViewSet;
    v6->_inputViewSet = (UIInputViewSet *)v13;

    v15 = -[UITextFormattingCoordinator initWithWindowScene:]([UITextFormattingCoordinator alloc], "initWithWindowScene:", v4);
    textFormattingCoordinator = v6->_textFormattingCoordinator;
    v6->_textFormattingCoordinator = v15;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    postWaitingForInputUIBlocks = v6->_postWaitingForInputUIBlocks;
    v6->_postWaitingForInputUIBlocks = (NSMutableArray *)v17;

    v19 = objc_alloc_init(UIKBLocalAuthenticationObserver);
    localAuthenticationObserver = v6->_localAuthenticationObserver;
    v6->_localAuthenticationObserver = v19;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel_keyboardSceneDelegateWillResume_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel_inputModeChangedForRenderConfig_, CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel_windowDidBecomeKey_, CFSTR("UIWindowDidBecomeKeyNotification"), 0);
    objc_msgSend(v21, "addObserver:selector:name:object:", v6, sel_firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    {
      v22 = objc_alloc_init(UIRemoteInputViewHost);
      remoteInputViewHost = v6->_remoteInputViewHost;
      v6->_remoteInputViewHost = v22;

    }
  }

  return v6;
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (UIKBRenderConfig)restorableRenderConfig
{
  return self->_restorableRenderConfig;
}

- (void)setKeyWindowSceneInputViews:(id)a3 animationStyle:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  void *v35;
  os_signpost_id_t v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  NSObject *v72;
  void *v73;
  int v74;
  uint64_t v75;
  id v76;
  NSObject *v77;
  os_signpost_id_t v78;
  os_signpost_id_t v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  id v93;
  _QWORD v94[5];
  id v95;
  id v96;
  uint8_t buf[4];
  int v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  kdebug_trace();
  kac_get_log();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, v8);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "setInputViews", ", buf, 2u);
    }
  }

  if (!+[UIDictationController viewMode](UIDictationController, "viewMode"))
  {
    kdebug_trace();
    kac_get_log();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, v8);
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_35;
    v16 = v15;
    if (!os_signpost_enabled(v14))
      goto LABEL_35;
    *(_WORD *)buf = 0;
LABEL_34:
    _os_signpost_emit_with_name_impl(&dword_185066000, v14, OS_SIGNPOST_INTERVAL_END, v16, "setInputViews", ", buf, 2u);
LABEL_35:
    v37 = v14;
    v38 = v8;
    goto LABEL_69;
  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "handlingRemoteEvent");

  }
  else
  {
    v13 = objc_msgSend(v8, "isInputViewPlaceholder");
  }
  if (!-[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled")
    && (v13 & 1) == 0
    && (objc_msgSend(v7, "force") & 1) == 0)
  {
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textInputTraits");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "keyboardType");

      if (v30 == 127)
        -[UIKeyboardSceneDelegate forceOrderOutAutomaticAnimated:](self, "forceOrderOutAutomaticAnimated:", 1);
    }
    else
    {

    }
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isRotating");

    if (v34)
    {
      v94[0] = MEMORY[0x1E0C809B0];
      v94[1] = 3221225472;
      v94[2] = __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke;
      v94[3] = &unk_1E16B47A8;
      v94[4] = self;
      v95 = v8;
      v96 = v7;
      -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPostRotationPendingBlock:", v94);

    }
    kdebug_trace();
    kac_get_log();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v36 = os_signpost_id_make_with_pointer(v14, v8);
    if (v36 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_35;
    v16 = v36;
    if (!os_signpost_enabled(v14))
      goto LABEL_35;
    *(_WORD *)buf = 0;
    goto LABEL_34;
  }
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPostRotationPendingBlock:", 0);

  objc_msgSend(v8, "refreshPresentation");
  -[UIKeyboardSceneDelegate updateRenderConfigForCurrentResponder](self, "updateRenderConfigForCurrentResponder");
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:](self, "setTextEffectsWindowLevelForInputView:responder:", v8, v18);

  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    v24 = 0;
    v25 = 0;
    v26 = v8;
    goto LABEL_65;
  }
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "keyboardVisible"))
    {
      -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "keyboardActive");

      if ((v23 & 1) != 0)
        goto LABEL_47;
      goto LABEL_45;
    }
LABEL_46:

    goto LABEL_47;
  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (-[UIKeyboardSceneDelegate isWaitingForInputUI](self, "isWaitingForInputUI"))
    {
      -[UIKeyboardSceneDelegate nextAnimationStyle](self, "nextAnimationStyle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "animated");

      if ((v32 & 1) != 0)
        goto LABEL_47;
LABEL_45:
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v21 = v7;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "placement");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v40, "accessoryViewWillAppear") & 1) != 0)
    {
      -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "placement");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "showsKeyboard");

      if (!v43)
        goto LABEL_47;
    }
    else
    {

    }
    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "currentUIState");
    v44 = objc_claimAutoreleasedReturnValue();
    if (!v44)
      goto LABEL_46;
    v45 = (void *)v44;
    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "currentUIState");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "animated");

    if ((v48 & 1) != 0)
      goto LABEL_47;
    goto LABEL_45;
  }
  if (objc_msgSend(v20, "keyboardVisible") && (objc_msgSend(v20, "keyboardActive") & 1) == 0)
    goto LABEL_45;
LABEL_47:
  v87 = v19;
  -[UIKeyboardSceneDelegate prepareToMoveKeyboardForInputViewSet:animationStyle:](self, "prepareToMoveKeyboardForInputViewSet:animationStyle:", v8, v7);
  -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_opt_respondsToSelector();

  if ((v50 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "removeObserver:name:object:", v52, 0x1E1764C40, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addObserver:selector:name:object:", v54, sel_applicationWindowRotated_, 0x1E1764C40, 0);

  }
  objc_msgSend(v20, "keyboardWindow");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "rootViewController");
  v24 = objc_claimAutoreleasedReturnValue();

  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v56 = objc_claimAutoreleasedReturnValue();
  v57 = v56 | v24;

  if (v57)
  {
    v86 = v20;
    -[UIKeyboardSceneDelegate scene](self, "scene");
    v58 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputView");
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputAccessoryView");
    v60 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputAssistantView");
    v61 = objc_claimAutoreleasedReturnValue();
    v84 = (void *)v58;
    if (v59 | v61)
    {
      +[_UIRemoteKeyboardPlaceholderView placeholderWithWidthSizer:heightWithScene:](_UIRemoteKeyboardPlaceholderView, "placeholderWithWidthSizer:heightWithScene:", &__block_literal_global_565, v58);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = 0;
    }
    objc_msgSend(v62, "setFallbackView:", v59);
    objc_msgSend(v62, "setAssociatedView:", v61);
    v68 = (void *)v60;
    +[_UIRemoteKeyboardPlaceholderView placeholderForView:](_UIRemoteKeyboardPlaceholderView, "placeholderForView:", v60);
    v85 = objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v8, "isCustomInputView");
    objc_msgSend(v8, "hostedCustomInputView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v8, "isRemoteKeyboard");
    v82 = objc_msgSend(v8, "shouldShowDockView");
    -[UIKeyboardSceneDelegate visualModeManager](self, "visualModeManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "shouldShowWithinAppWindow");

    -[UIKeyboardSceneDelegate visualModeManager](self, "visualModeManager");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "visualModeLog");
    v72 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v98 = v70;
      _os_log_impl(&dword_185066000, v72, OS_LOG_TYPE_DEFAULT, "Show keyboard with visual mode windowed (%d)", buf, 8u);
    }

    if (+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard")
      || (+[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards"),
          v73 = (void *)objc_claimAutoreleasedReturnValue(),
          v74 = objc_msgSend(v73, "oldPathForSnapshot") | v70,
          v73,
          v74 == 1))
    {
      +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v62, v85, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v68;
      +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v59, v68, v61);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v59, v85, v61);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inheritNullState:", v8);
      v66 = v68;
      +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v62, v68, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "inheritNullState:", v25);
    }
    objc_msgSend(v25, "setIsCustomInputView:", v80);
    objc_msgSend(v26, "setIsCustomInputView:", v80);
    objc_msgSend(v26, "setHostedCustomInputView:", v83);
    objc_msgSend(v25, "setIsRemoteKeyboard:", v81);
    objc_msgSend(v26, "setIsRemoteKeyboard:", v81);
    objc_msgSend(v25, "setShouldShowDockView:", v82);
    objc_msgSend(v26, "setShouldShowDockView:", v82);

    v64 = v84;
    v67 = (void *)v85;
    goto LABEL_63;
  }
  objc_msgSend(v8, "keyboard");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    v86 = v20;
    objc_msgSend(v8, "inputView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIRemoteKeyboardPlaceholderView placeholderForView:](_UIRemoteKeyboardPlaceholderView, "placeholderForView:", v64);
    v59 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputAccessoryView");
    v65 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputAssistantView");
    v61 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)v65;
    +[_UIRemoteKeyboardPlaceholderView placeholderForView:](_UIRemoteKeyboardPlaceholderView, "placeholderForView:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v59, v65, v62);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v67 = v8;
LABEL_63:

    v20 = v86;
    goto LABEL_64;
  }
  v25 = 0;
  v26 = v8;
LABEL_64:

  v19 = v87;
LABEL_65:
  v75 = MEMORY[0x1E0C809B0];
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_567;
  v91[3] = &unk_1E16B1B50;
  v92 = (id)v24;
  v93 = v25;
  v37 = (id)v24;
  v14 = v25;
  -[NSObject performOperations:withAnimationStyle:](v37, "performOperations:withAnimationStyle:", v91, v7);
  v88[0] = v75;
  v88[1] = 3221225472;
  v88[2] = __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_2;
  v88[3] = &unk_1E16B1B50;
  v89 = v19;
  v38 = v26;
  v90 = v38;
  v76 = v19;
  objc_msgSend(v76, "performOperations:withAnimationStyle:", v88, v7);
  kdebug_trace();
  kac_get_log();
  v77 = (id)objc_claimAutoreleasedReturnValue();
  v78 = os_signpost_id_make_with_pointer(v77, v8);
  if (v78 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v79 = v78;
    if (os_signpost_enabled(v77))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v77, OS_SIGNPOST_INTERVAL_END, v79, "setInputViews", ", buf, 2u);
    }
  }

LABEL_69:
}

- (UIInputViewSet)inputViews
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  if (!self->_containerWindow)
  {
    v11 = 0;
    return (UIInputViewSet *)v11;
  }
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    -[UIKeyboardSceneDelegate visualModeManager](self, "visualModeManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldShowWithinAppWindow");

    if ((v4 & 1) == 0)
    {
      -[UIKeyboardSceneDelegate keyboardWindow](self, "keyboardWindow");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rootViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputViewSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v7, "inputView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_opt_respondsToSelector();

        if ((v9 & 1) == 0)
        {
          v10 = v7;
          goto LABEL_9;
        }

      }
    }
  }
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputViewSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
LABEL_9:
  objc_msgSend(v10, "normalizePlaceholders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInputViewSet *)v11;
}

- (UIKeyboardVisualModeManager)visualModeManager
{
  return self->_visualModeManager;
}

- (UIInputWindowController)containerRootController
{
  void *v2;
  void *v3;

  -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIInputWindowController *)v3;
}

- (UITextEffectsWindow)containerWindow
{
  return (UITextEffectsWindow *)-[UIKeyboardSceneDelegate containerWindowForViewService:](self, "containerWindowForViewService:", 0);
}

- (id)containerWindowForViewService:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v10;
  id *v11;
  id v12;
  id *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v3 = a3;
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("_UISceneSessionRoleKeyboard"));

  if ((v8 & 1) != 0)
    return 0;
  v10 = 16;
  if (v3)
    v10 = 24;
  v11 = (id *)((char *)&self->super.isa + v10);
  v12 = *(id *)((char *)&self->super.isa + v10);
  if (v12)
  {
    if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
      return v12;
    if ((objc_msgSend(v12, "_isHostedInAnotherProcess") & 1) == 0)
      goto LABEL_11;
LABEL_9:
    -[UIKeyboardSceneDelegate scene](self, "scene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "activeTextEffectsWindowForWindowScene:forViewService:", v16, v3);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  +[UIWindowScene _keyWindowScene]();
  v13 = (id *)objc_claimAutoreleasedReturnValue();
  -[UIWindowScene _keyWindow](v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_isHostedInAnotherProcess");

  if (v15)
    goto LABEL_9;
LABEL_11:
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:forViewService:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:forViewService:", v16, v3);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v18 = (void *)v17;

  objc_msgSend(v18, "setHidden:", 0);
  if (!v12 && v18 && self->_disableAnimationsCount >= 1)
  {
    v19 = 0;
    do
    {
      objc_msgSend(v18, "rootViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pushAnimationStyle:", v21);

      ++v19;
    }
    while (v19 < self->_disableAnimationsCount);
  }
  objc_storeStrong(v11, v18);
  return v18;
}

- (BOOL)enhancedWindowingModeIsEnabled
{
  void *v2;
  char v3;

  -[UIKeyboardSceneDelegate scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_enhancedWindowingEnabled");

  return v3;
}

- (UIWindowScene)scene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (BOOL)automaticAppearanceReallyEnabled
{
  return self->_automaticAppearanceEnabled && self->_automaticAppearanceEnabledInternal;
}

- (void)updateRenderConfigForCurrentResponder
{
  id v3;

  -[UIKeyboardSceneDelegate responder](self, "responder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate updateRenderConfigForResponder:](self, "updateRenderConfigForResponder:", v3);

}

- (void)updateRenderConfigForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(void *, void *);
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD aBlock[4];
  id v16;
  UIKeyboardSceneDelegate *v17;
  id v18;

  v4 = a3;
  if ((objc_msgSend(v4, "_requiresKeyboardWhenFirstResponder") & 1) != 0
    || objc_msgSend(v4, "_ownsInputAccessoryView"))
  {
    -[UIKeyboardSceneDelegate _renderConfigForResponder:](self, "_renderConfigForResponder:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UIKeyboardSceneDelegate_updateRenderConfigForResponder___block_invoke;
    aBlock[3] = &unk_1E16C6130;
    v7 = v6;
    v16 = v7;
    v17 = self;
    v8 = v5;
    v18 = v8;
    v9 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (objc_msgSend(v8, "lightKeyboard"))
      v10 = 1;
    else
      v10 = 2;
    -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOverrideUserInterfaceStyle:", v10);

    if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled")
      && (-[UIKeyboardSceneDelegate scene](self, "scene"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "_isKeyWindowScene"),
          v12,
          v13))
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "performOnControllers:", v9);
    }
    else
    {
      -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v14);
    }

  }
}

- (id)_renderConfigForResponder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (v5 = objc_msgSend(v4, "keyboardAppearance")) == 0)
    v5 = -[UIKeyboardSceneDelegate _preferredAppearanceForResponder:](self, "_preferredAppearanceForResponder:", v4);
  if (objc_msgSend(v4, "_isDisplayingWritingToolsSessionInUCB")
    && (objc_msgSend(v4, "_wantsMagicBackgroundInUCB") & 1) != 0)
  {
    v5 = 13;
  }
  else if (!v5)
  {
    objc_msgSend(v4, "_responderWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceStyle");

    if ((objc_msgSend(v4, "_isView") & 1) != 0 || objc_msgSend(v4, "_isViewController"))
    {
      objc_msgSend(v4, "_window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_isTextEffectsWindow");

      if ((v11 & 1) == 0)
      {
        objc_msgSend(v4, "traitCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "userInterfaceStyle"))
          v9 = objc_msgSend(v12, "userInterfaceStyle");

      }
    }
    if (v9 == 2)
      v5 = 1;
    else
      v5 = 2 * (v9 == 1);
  }
  v13 = v4;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v13;
  if (v14 == v13)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputDelegateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "forwardingInputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v13;
    if (!v18)
      goto LABEL_21;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputDelegateManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "forwardingInputDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = objc_msgSend(v15, "keyboardType");
  else
    v20 = 0;
  if (TIGetEmojiSearchAlternateBackgroundValue_onceToken != -1)
    dispatch_once(&TIGetEmojiSearchAlternateBackgroundValue_onceToken, &__block_literal_global_1047);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForPreferenceKey:", CFSTR("EmojiSearchAlternateBackground"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "BOOLValue");
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) != 0 || !v23)
  {

    goto LABEL_31;
  }

  if (v20 != 122)
  {
LABEL_31:
    +[UITextInputTraits traitEnvironmentFromTraits:](UITextInputTraits, "traitEnvironmentFromTraits:", v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "currentInputMode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKBRenderConfig configForAppearance:inputMode:traitEnvironment:](UIKBRenderConfig, "configForAppearance:inputMode:traitEnvironment:", v5, v27, v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  +[UIKBRenderConfig defaultEmojiConfig](UIKBRenderConfig, "defaultEmojiConfig");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v24;
}

- (id)systemInputAssistantViewControllerForResponder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  UISystemInputAssistantViewController *v9;
  UISystemInputAssistantViewController *systemInputAssistantViewController;
  void *v11;
  UISystemInputAssistantViewController *v12;

  v4 = a3;
  v5 = v4;
  if (!self->_systemInputAssistantViewController)
  {
    objc_msgSend(v4, "_keyboardResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE22B80))
    {

LABEL_5:
      v9 = objc_alloc_init(UISystemInputAssistantViewController);
      systemInputAssistantViewController = self->_systemInputAssistantViewController;
      self->_systemInputAssistantViewController = v9;

      -[UIViewController view](self->_systemInputAssistantViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      goto LABEL_6;
    }
    objc_msgSend(v5, "_keyboardResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EE0CE228);

    if (v8)
      goto LABEL_5;
  }
LABEL_6:
  v12 = self->_systemInputAssistantViewController;

  return v12;
}

- (UISystemInputAssistantViewController)systemInputAssistantViewController
{
  return (UISystemInputAssistantViewController *)-[UIKeyboardSceneDelegate systemInputAssistantViewControllerForResponder:](self, "systemInputAssistantViewControllerForResponder:", self->_responder);
}

- (void)completeMoveKeyboardForWindow:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    v4 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess");
    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "completeKeyboardChange");
    else
      objc_msgSend(v5, "completeMoveKeyboard");
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "completeMoveKeyboardForWindow:", v7);
  }

}

- (void)setAutomaticAppearanceInternalEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabledInternal = a3;
}

+ (int64_t)interfaceOrientation
{
  int64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend((id)UIApp, "_frontMostAppInterfaceOrientationIsSignificant"))
  {
    v3 = objc_msgSend((id)UIApp, "_frontMostAppOrientation");
    v4 = CFSTR("Front most app's orientation is significant.");
  }
  else
  {
    if (!__interfaceOrientation || !objc_msgSend((id)UIApp, "_isWindowServerHostingManaged"))
    {
      if ((objc_msgSend((id)UIApp, "_isSpringBoard") & 1) != 0)
        goto LABEL_16;
      +[UIWindowScene _keyWindowScene]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = v5;
        v3 = objc_msgSend(v5, "interfaceOrientation");
        objc_msgSend(a1, "logInterfaceOrientation:withDescription:", v3, CFSTR("Using key window scene"));
      }
      else
      {
        objc_msgSend(a1, "applicationConnectedWindowScenes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v7, "anyObject");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = objc_msgSend(v6, "interfaceOrientation");
          objc_msgSend(a1, "logInterfaceOrientation:withDescription:", v3, CFSTR("Available non-key window scene"));
        }
        else
        {
          v6 = 0;
          v3 = 0;
        }

      }
      if (!v3)
        goto LABEL_16;
      return v3;
    }
    v3 = __interfaceOrientation;
    v4 = CFSTR("Using cache for app with managed window server hosting.");
  }
  objc_msgSend(a1, "logInterfaceOrientation:withDescription:", v3, v4);
  if (!v3)
  {
LABEL_16:
    v3 = objc_msgSend((id)UIApp, "activeInterfaceOrientation");
    objc_msgSend(a1, "logInterfaceOrientation:withDescription:", v3, CFSTR("Fallback case. Using the app's active interface orientation."));
  }
  return v3;
}

+ (void)logInterfaceOrientation:(int64_t)a3 withDescription:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (__lastLoggedInterfaceOrientation != a3)
  {
    _UIKeyboardSceneDelegateLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", __lastLoggedInterfaceOrientation);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "[Interface Orientation] was:%@ now:%@ reason:%@", (uint8_t *)&v9, 0x20u);

    }
    __lastLoggedInterfaceOrientation = a3;
  }

}

- (id)_inputViewsForResponder:(id)a3 withAutomaticKeyboard:(BOOL)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  NSMutableDictionary *persistentInputAccessoryResponders;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  id v34;
  const char *v35;
  const char *v36;
  UIKeyboardSceneDelegate *v37;
  _BOOL4 v38;
  int v39;
  void *v40;
  _BOOL4 v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  id v45;
  _BOOL4 v46;
  int v47;
  NSObject *v48;
  _BOOL4 v49;
  id v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  id v57;
  _BOOL4 v58;
  _BOOL4 dontNeedAssistantBar;
  NSObject *v60;
  id v61;
  _BOOL4 automaticAppearanceEnabled;
  void *v63;
  int v64;
  UIInputViewSet *inputViewSet;
  uint64_t v66;
  NSObject *v67;
  id v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  BOOL v73;
  _BOOL4 v74;
  int v75;
  id v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  _BOOL4 v85;
  void *v86;
  NSObject *v87;
  _BOOL4 v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  int v96;
  NSObject *v97;
  void *v98;
  int v99;
  void *v100;
  void *v101;
  uint64_t v102;
  char v103;
  _BOOL4 v104;
  void *v105;
  double v106;
  NSObject *v107;
  id v108;
  void *v109;
  uint64_t v110;
  int v111;
  int v112;
  NSObject *v113;
  id v114;
  id v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  char v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  _BOOL4 v127;
  _BOOL4 v128;
  void *v129;
  double v130;
  int v131;
  NSObject *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  int v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  NSObject *v141;
  id obj;
  _BOOL4 v144;
  unsigned int v145;
  void *v146;
  int v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  uint8_t buf[4];
  _BYTE v155[26];
  _BYTE v156[6];
  _BOOL4 v157;
  uint64_t v158;

  v5 = a5;
  v6 = a4;
  v158 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  _UIKeyboardSceneDelegateLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _responderDescriptionForLogging:](self, "_responderDescriptionForLogging:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v155 = v11;
    *(_WORD *)&v155[8] = 1024;
    *(_DWORD *)&v155[10] = v6;
    *(_WORD *)&v155[14] = 1024;
    *(_DWORD *)&v155[16] = v5;
    _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder: %@, automaticKeyboard: %d, force: %d", buf, 0x18u);

  }
  if (objc_msgSend(v9, "_disableAutomaticKeyboardUI"))
  {
    _UIKeyboardSceneDelegateLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, disableAutomaticKeyboardUI return empty", buf, 2u);
    }

    +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_159;
  }
  obj = a3;
  v144 = v5;
  v14 = v9;
  v149 = v9;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[_UITextServiceSession textServiceIsDisplaying](_UITextServiceSession, "textServiceIsDisplaying"))
  {

  }
  else
  {
    v15 = v14;
    if (v14)
      goto LABEL_16;
  }
  if (-[UIKeyboardSceneDelegate preservingInputViews](self, "preservingInputViews")
    || !-[NSMutableArray count](self->_persistentInputAccessoryResponderOrder, "count"))
  {
    v15 = 0;
  }
  else
  {
    persistentInputAccessoryResponders = self->_persistentInputAccessoryResponders;
    -[NSMutableArray lastObject](self->_persistentInputAccessoryResponderOrder, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](persistentInputAccessoryResponders, "objectForKey:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:
  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v14, "inputViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(v18, "nextResponder");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        objc_msgSend(v19, "_overrideInputViewNextResponderWithResponder:", v14);
    }
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v14, "inputView");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v21, "nextResponder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v22 = 0;
  }
  if (v19 || !v21 || v22)
  {
    if (!v21)
    {
      objc_msgSend(v19, "view");
      v21 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend((id)v21, "_overrideInputViewNextResponderWithResponder:", v14);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v145 = objc_msgSend((id)v21, "shouldShowDockView");
  else
    v145 = 0;
  v150 = v19;
  _UIKeyboardSceneDelegateLogger();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](self, "_simpleViewDescriptionForLogging:", v21);
    v24 = v6;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](self, "_simpleViewDescriptionForLogging:", v150);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v155 = v25;
    *(_WORD *)&v155[8] = 2112;
    *(_QWORD *)&v155[10] = v26;
    _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, found custom inputView: %@, customInputViewController: %@", buf, 0x16u);

    v6 = v24;
  }

  if (dyld_program_sdk_at_least())
  {
    objc_msgSend(v15, "inputAccessoryViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "nextResponder");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        objc_msgSend(v28, "_overrideInputAccessoryViewNextResponderWithResponder:", v15);
    }
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(v15, "inputAccessoryView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "nextResponder");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v31 = 0;
  }
  if (v28 || !v30 || v31)
  {
    if (!v30)
    {
      objc_msgSend(v28, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v30, "_overrideInputAccessoryViewNextResponderWithResponder:", v15);
  }
  v151 = v28;
  _UIKeyboardSceneDelegateLogger();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](self, "_simpleViewDescriptionForLogging:", v30);
    v33 = v6;
    v34 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v155 = v34;
    _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, found inputAccessoryView: %@", buf, 0xCu);

    v6 = v33;
  }

  -[UIView _clearBecomeFirstResponderWhenCapableOnSubtree]((void *)v21, v35);
  -[UIView _clearBecomeFirstResponderWhenCapableOnSubtree](v30, v36);
  v153 = v14;
  v37 = self;
  v146 = v30;
  if (v6)
  {
    v38 = v6;
    v39 = objc_msgSend(v14, "_requiresKeyboardWhenFirstResponder");
  }
  else
  {
    +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 || -[UIKeyboardSceneDelegate isOnScreen](self, "isOnScreen"))
    {
      v38 = v6;
      v39 = objc_msgSend(v14, "_requiresKeyboardWhenFirstResponder");
    }
    else
    {
      v38 = v6;
      v39 = 0;
    }

  }
  v41 = v21 != 0;
  if (v21)
    v42 = 0;
  else
    v42 = v39;
  _UIKeyboardSceneDelegateLogger();
  v43 = objc_claimAutoreleasedReturnValue();
  v148 = v15;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v44);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v46 = -[UIKeyboardSceneDelegate isOnScreen](v37, "isOnScreen");
    v47 = objc_msgSend(v153, "_requiresKeyboardWhenFirstResponder");
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v155 = v39;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)&v155[6] = v38;
    *(_WORD *)&v155[10] = 2112;
    *(_QWORD *)&v155[12] = v45;
    *(_WORD *)&v155[20] = 1024;
    *(_DWORD *)&v155[22] = v46;
    *(_WORD *)v156 = 1024;
    *(_DWORD *)&v156[2] = v47;
    _os_log_impl(&dword_185066000, v43, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, responderRequiresKeyboard %d (automaticKeyboardEnabled: %d, activeInstance: %@, self.isOnScreen: %d, requiresKBWhenFirstResponder: %d)", buf, 0x24u);

  }
  _UIKeyboardSceneDelegateLogger();
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = v42;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v21);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v155 = v42;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)&v155[6] = 1;
    *(_WORD *)&v155[10] = 2112;
    *(_QWORD *)&v155[12] = v50;
    *(_WORD *)&v155[20] = 1024;
    *(_DWORD *)&v155[22] = v39;
    _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, useKeyboard %d (allowsSystemInputView: %d, !inputView %@, responderRequiresKeyboard %d)", buf, 0x1Eu);

  }
  v51 = v146;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_msgSend((id)v21, "frame");
    v41 = v52 > 0.0;
  }
  if ((v41 | v39) == 1)
  {
    v53 = v153;
    -[UIKeyboardSceneDelegate systemInputAssistantViewControllerForResponder:](v37, "systemInputAssistantViewControllerForResponder:", v153);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "view");
    v152 = objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (!-[UIKeyboardSceneDelegate shouldSuppressInputAssistantUpdates](v37, "shouldSuppressInputAssistantUpdates")
      && !v37->_dontNeedAssistantBar)
    {
      objc_msgSend(v55, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v153);
      objc_msgSend(v55, "setInputAssistantButtonItemsForResponder:", v153);
    }
    _UIKeyboardSceneDelegateLogger();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v55);
      v57 = (id)objc_claimAutoreleasedReturnValue();
      v58 = -[UIKeyboardSceneDelegate shouldSuppressInputAssistantUpdates](v37, "shouldSuppressInputAssistantUpdates");
      dontNeedAssistantBar = v37->_dontNeedAssistantBar;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v155 = v57;
      *(_WORD *)&v155[8] = 1024;
      *(_DWORD *)&v155[10] = v58;
      *(_WORD *)&v155[14] = 1024;
      *(_DWORD *)&v155[16] = dontNeedAssistantBar;
      _os_log_impl(&dword_185066000, v56, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, found assistantVC: %@ (should suppress: %d, _dontNeed: %d)", buf, 0x18u);

    }
  }
  else
  {
    v152 = 0;
    v55 = 0;
    v53 = v153;
  }
  if (!v37->_automaticAppearanceEnabled)
    objc_storeStrong((id *)&v37->_responderWithoutAutomaticAppearanceEnabled, obj);
  _UIKeyboardSceneDelegateLogger();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v37->_responderWithoutAutomaticAppearanceEnabled);
    v61 = (id)objc_claimAutoreleasedReturnValue();
    automaticAppearanceEnabled = v37->_automaticAppearanceEnabled;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v155 = v61;
    *(_WORD *)&v155[8] = 1024;
    *(_DWORD *)&v155[10] = automaticAppearanceEnabled;
    _os_log_impl(&dword_185066000, v60, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, configuring _responderWithoutAutomaticAppearanceEnabled: %@ (_automaticAppearEnabled: %d)", buf, 0x12u);

  }
  -[UIInputViewSet inputAccessoryView](v37->_inputViewSet, "inputAccessoryView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "_containsResponder:", v53);

  inputViewSet = v37->_inputViewSet;
  if (v64)
  {
    -[UIInputViewSet inputAccessoryView](inputViewSet, "inputAccessoryView");
    v66 = objc_claimAutoreleasedReturnValue();

    _UIKeyboardSceneDelegateLogger();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v66);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v155 = v68;
      _os_log_impl(&dword_185066000, v67, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, updating inputAccessoryView: %@", buf, 0xCu);

    }
  }
  else
  {
    -[UIInputViewSet inputView](inputViewSet, "inputView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v69, "_containsResponder:", v53);

    if (!v70)
      goto LABEL_87;
    -[UIInputViewSet inputView](v37->_inputViewSet, "inputView");
    v71 = objc_claimAutoreleasedReturnValue();

    -[UIInputViewSet keyboard](v37->_inputViewSet, "keyboard");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v72 != 0;

    _UIKeyboardSceneDelegateLogger();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      v73 = v72 == 0;
      v74 = v72 != 0;
      v75 = !v73;
      -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v71);
      v76 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v155 = v76;
      *(_WORD *)&v155[8] = 1024;
      *(_DWORD *)&v155[10] = v75;
      v49 = v74;
      _os_log_impl(&dword_185066000, v67, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, updating inputView: %@, useKeyboard: %d", buf, 0x12u);

    }
    v66 = (uint64_t)v146;
    v21 = v71;
  }

  v51 = (void *)v66;
  v53 = v153;
LABEL_87:
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (v49)
    {
      +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:assistantView:](UIInputViewSet, "inputSetWithKeyboardAndAccessoryView:assistantView:", v51, v152);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      _UIKeyboardSceneDelegateLogger();
      v78 = objc_claimAutoreleasedReturnValue();
      v79 = v150;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v77);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v155 = v80;
        _os_log_impl(&dword_185066000, v78, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, useKeyboard ivs: %@", buf, 0xCu);

      }
    }
    else
    {
      v79 = v150;
      if (!v21)
      {
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v86, "keyboardActive"))
        {

        }
        else
        {
          +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = objc_msgSend(v121, "snapshotting");

          if ((v122 & 1) == 0)
          {
            +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v123, "keyboardVisible"))
            {
              +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIKeyboardSceneDelegate scene](v37, "scene");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "intersectionHeightForWindowScene:", v125);
              v127 = v126 > 0.0;

            }
            else
            {
              v127 = 0;
            }

            if (v51)
            {
              v128 = 0;
            }
            else
            {
              +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "heightForRemoteIAVPlaceholderIfNecessary");
              v128 = v130 != 0.0;

            }
            v131 = v127 || v128;
            _UIKeyboardSceneDelegateLogger();
            v132 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v155 = v127;
              *(_WORD *)&v155[4] = 1024;
              *(_DWORD *)&v155[6] = v128;
              *(_WORD *)&v155[10] = 1024;
              *(_DWORD *)&v155[12] = v127 || v128;
              _os_log_impl(&dword_185066000, v132, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsIVPlaceholder: %d, needsIAVPlaceholder: %d, needsInputSetWithPlaceholder: %d", buf, 0x14u);
            }

            v79 = v150;
            if (v131)
            {
              +[UIInputViewSet inputSetWithPlaceholderAndAccessoryView:](UIInputViewSet, "inputSetWithPlaceholderAndAccessoryView:", v51);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "setIsRemoteKeyboard:", 1);
              objc_msgSend(v77, "setShouldShowDockView:", v145);
LABEL_153:
              v90 = v151;
              goto LABEL_154;
            }
          }
        }
      }
      +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v21, v51, v152);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setInputViewController:", v79);
      objc_msgSend(v77, "inputView");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setIsCustomInputView:", v133 != 0);

      objc_msgSend(v77, "setShouldShowDockView:", v145);
      -[UIKeyboardSceneDelegate existingContainerWindow](v37, "existingContainerWindow");
      v134 = objc_claimAutoreleasedReturnValue();
      if (!v134)
        goto LABEL_153;
      v135 = (void *)v134;
      v136 = objc_msgSend(v77, "isEmpty");

      if (!v136)
        goto LABEL_153;
      -[UIKeyboardSceneDelegate containerRootController](v37, "containerRootController");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "inputViewSet");
      v78 = objc_claimAutoreleasedReturnValue();

      if ((-[NSObject isEmpty](v78, "isEmpty") & 1) == 0
        && -[NSObject isRemoteKeyboard](v78, "isRemoteKeyboard"))
      {
        objc_msgSend(v77, "setIsRemoteKeyboard:", 1);
      }
    }

    goto LABEL_153;
  }
  if (v49)
  {
    if (+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard"))
      +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:assistantView:](UIInputViewSet, "inputSetWithKeyboardAndAccessoryView:assistantView:", v51, v152);
    else
      +[UIInputViewSet inputSetWithPlaceholderAndAccessoryView:assistantView:](UIInputViewSet, "inputSetWithPlaceholderAndAccessoryView:assistantView:", v51, v152);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    _UIKeyboardSceneDelegateLogger();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      v88 = +[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard");
      -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v77);
      v89 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v155 = 1;
      *(_WORD *)&v155[4] = 1024;
      *(_DWORD *)&v155[6] = v88;
      *(_WORD *)&v155[10] = 2112;
      *(_QWORD *)&v155[12] = v89;
      _os_log_impl(&dword_185066000, v87, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, useKeyboard: %d, usesLocal: %d, ivs: %@", buf, 0x18u);

    }
    v79 = v150;
    v90 = v151;
    goto LABEL_135;
  }
  if (v144)
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "keyboardVisible"))
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSceneDelegate scene](v37, "scene");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "intersectionHeightForWindowScene:", v83);
      v85 = v84 > 0.0;

    }
    else
    {
      v85 = 0;
    }

  }
  else
  {
    v85 = 0;
  }
  -[UIKeyboardSceneDelegate keyboardArbiterClient](v37, "keyboardArbiterClient");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "currentUIState");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "applicationIdentifier");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v93, "containsString:", v94);

  if (v85 && v21 == 0)
    v96 = v85 & ~v95;
  else
    v96 = v85;
  v147 = v96;
  _UIKeyboardSceneDelegateLogger();
  v97 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v98, "keyboardVisible");
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate scene](v37, "scene");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "intersectionHeightForWindowScene:", v101);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v155 = v147;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)&v155[6] = v99;
    *(_WORD *)&v155[10] = 2048;
    *(_QWORD *)&v155[12] = v102;
    *(_WORD *)&v155[20] = 1024;
    *(_DWORD *)&v155[22] = v144;
    _os_log_impl(&dword_185066000, v97, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsInputViewPlaceholder: %d (visible: %d, height: %f, force: %d)", buf, 0x1Eu);

  }
  if (v51)
    v103 = 1;
  else
    v103 = v95;
  if ((v103 & 1) != 0)
  {
    v104 = 0;
  }
  else
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "heightForRemoteIAVPlaceholderIfNecessary");
    v104 = v106 != 0.0;

  }
  v53 = v153;
  _UIKeyboardSceneDelegateLogger();
  v107 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v51);
    v108 = (id)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "heightForRemoteIAVPlaceholderIfNecessary");
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v155 = v104;
    *(_WORD *)&v155[4] = 2112;
    *(_QWORD *)&v155[6] = v108;
    *(_WORD *)&v155[14] = 2048;
    *(_QWORD *)&v155[16] = v110;
    *(_WORD *)&v155[24] = 1024;
    *(_DWORD *)v156 = v95;
    _os_log_impl(&dword_185066000, v107, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsInputAccessoryViewPlaceholder: %d (%@, %f, %d)", buf, 0x22u);

  }
  if (v21 | v152)
    v111 = 1;
  else
    v111 = v147;
  v112 = v111 | v104;
  _UIKeyboardSceneDelegateLogger();
  v113 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v21);
    v114 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate _simpleViewDescriptionForLogging:](v37, "_simpleViewDescriptionForLogging:", v152);
    v115 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v155 = v112;
    *(_WORD *)&v155[4] = 2112;
    *(_QWORD *)&v155[6] = v114;
    *(_WORD *)&v155[14] = 2112;
    *(_QWORD *)&v155[16] = v115;
    *(_WORD *)&v155[24] = 1024;
    *(_DWORD *)v156 = v147;
    *(_WORD *)&v156[4] = 1024;
    v157 = v104;
    v53 = v153;
    _os_log_impl(&dword_185066000, v113, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsPlaceholder: %d (%@, %@, %d, %d)", buf, 0x28u);

  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    v79 = v150;
    v90 = v151;
    if (v112)
    {
      v116 = v21;
      v117 = v51;
      v118 = v152;
      goto LABEL_132;
    }
LABEL_133:
    +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", 0, v51, 0);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_134;
  }
  v79 = v150;
  v90 = v151;
  if (!v112)
    goto LABEL_133;
  v116 = v21;
  v117 = v51;
  v118 = 0;
LABEL_132:
  +[UIInputViewSet inputSetWithPlaceholderAndCustomInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithPlaceholderAndCustomInputView:accessoryView:assistantView:", v116, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_134:
  v77 = v119;
  objc_msgSend(v119, "setInputViewController:", v79);
  objc_msgSend(v77, "hostedCustomInputView");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setIsCustomInputView:", v120 != 0);

  objc_msgSend(v77, "setShouldShowDockView:", v145);
LABEL_135:
  objc_msgSend(v77, "setIsRemoteKeyboard:", 1);
LABEL_154:
  objc_msgSend(v77, "setAssistantViewController:", v55);
  objc_msgSend(v77, "setAccessoryViewController:", v90);
  if (v55)
  {
    objc_msgSend(v53, "_keyboardResponder");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend(v55, "shouldBeShownForInputDelegate:inputViews:", v138, v77) ^ 1;
    objc_msgSend(v55, "view");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "setHidden:", v139);

    v90 = v151;
  }
  _UIKeyboardSceneDelegateLogger();
  v141 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v155 = v77;
    _os_log_impl(&dword_185066000, v141, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder returning: %@", buf, 0xCu);
  }

  v13 = v77;
  v9 = v149;
LABEL_159:

  return v13;
}

- (BOOL)isOnScreen
{
  void *v2;
  char v3;

  -[UITextEffectsWindow rootViewController](self->_containerWindow, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnScreen");

  return v3;
}

- (UITextEffectsWindow)existingContainerWindow
{
  return self->_containerWindow;
}

- (NSDate)_transitionStartTime
{
  return self->_transitionStartTime;
}

- (BOOL)preservingInputViews
{
  return self->_preservingInputViews;
}

- (BOOL)shouldSuppressInputAssistantUpdates
{
  return self->_shouldSuppressInputAssistantUpdates;
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  id v7;
  id WeakRetained;
  _QWORD block[5];

  v7 = a3;
  if (a4 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);

    if (WeakRetained)
      -[UIKeyboardSceneDelegate setKeyWindowCandidate:](self, "setKeyWindowCandidate:", 0);
  }
  else if (!a4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__UIKeyboardSceneDelegate__scene_willTransitionToActivationState_withReasonsMask___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

+ (void)performOnControllers:(id)a3
{
  void (**v3)(id, _QWORD);
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, _QWORD))a3;
  +[UIScene _scenesIncludingInternal:](UIWindowScene, "_scenesIncludingInternal:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v10), "keyboardSceneDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        v3[2](v3, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v14);
  }

}

- (void)_clearEligibilityToRequestKeyboardFocusWithoutUserInteraction
{
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = 0;
}

- (void)setKeyWindowCandidate:(id)a3
{
  objc_storeWeak((id *)&self->_keyWindowCandidate, a3);
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = 0;
}

- (BOOL)ignoresPinning
{
  return self->_ignoresPinning;
}

- (void)setIgnoresPinning:(BOOL)a3
{
  self->_ignoresPinning = a3;
}

- (UIInputWindowController)existingContainerRootController
{
  return (UIInputWindowController *)-[UITextEffectsWindow rootViewController](self->_containerWindow, "rootViewController");
}

- (void)firstResponderDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  id obj;

  v4 = a3;
  objc_msgSend(v4, "object");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("UIWindowFirstResponderUserInfoKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
    if (WeakRetained)
    {

    }
    else
    {
      objc_msgSend(obj, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSceneDelegate scene](self, "scene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == v9 && (objc_msgSend(obj, "isKeyWindow") & 1) != 0)
      {
        v10 = objc_msgSend(v6, "_requiresKeyboardWhenFirstResponder");

        if (v10)
          objc_storeWeak((id *)&self->_keyWindowCandidate, obj);
      }
      else
      {

      }
    }
  }
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = 0;

}

- (void)windowDidBecomeKey:(id)a3
{
  void *v4;
  void *WeakRetained;
  BOOL v6;
  char v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
  if (!WeakRetained
    && (-[UIKeyboardSceneDelegate scene](self, "scene"),
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue(),
        v4 == WeakRetained))
  {
    v7 = objc_msgSend(v4, "_isConnecting");

    if ((v7 & 1) != 0)
    {
      v6 = 1;
      goto LABEL_5;
    }
  }
  else
  {

  }
  v6 = 0;
LABEL_5:
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = v6;

}

- (void)_reloadInputViewsForWindowSceneResponder:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v7;
  void *v8;
  UIInputViewPostPinningReloadState *v9;
  UIInputViewPostPinningReloadState *postPinningReloadState;
  int v11;
  UIResponder *selfHostingTrigger;
  UIResponder *v13;
  UIResponder *responder;
  void *v15;
  UIInputViewPostPinningReloadState *v16;
  UIResponder *v17;

  v4 = a4;
  v17 = (UIResponder *)a3;
  -[UIKeyboardSceneDelegate disableInterfaceAutorotation:](self, "disableInterfaceAutorotation:", 0);
  v7 = (!self->_automaticAppearanceEnabled || self->_responderWithoutAutomaticAppearanceEnabled != v17)
    && -[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled");
  -[UIKeyboardSceneDelegate _inputViewsForResponder:withAutomaticKeyboard:force:](self, "_inputViewsForResponder:withAutomaticKeyboard:force:", v17, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIKeyboardSceneDelegate pinningPreventsInputViews:](self, "pinningPreventsInputViews:", v8))
  {
    +[UIInputViewPostPinningReloadState stateWithResponder:](UIInputViewPostPinningReloadState, "stateWithResponder:", v17);
    v9 = (UIInputViewPostPinningReloadState *)objc_claimAutoreleasedReturnValue();
    postPinningReloadState = self->_postPinningReloadState;
    self->_postPinningReloadState = v9;

    -[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:](self, "setTextEffectsWindowLevelForInputView:responder:", v8, v17);
    goto LABEL_19;
  }
  if (!-[UIKeyboardSceneDelegate _isIgnoringReloadInputViews](self, "_isIgnoringReloadInputViews"))
  {
    v11 = objc_msgSend(v8, "containsResponder:", v17);
    selfHostingTrigger = self->_selfHostingTrigger;
    if (v11)
    {
      if (selfHostingTrigger)
        goto LABEL_13;
      -[UIKeyboardSceneDelegate responder](self, "responder");
      v13 = (UIResponder *)objc_claimAutoreleasedReturnValue();
      selfHostingTrigger = self->_selfHostingTrigger;
    }
    else
    {
      v13 = 0;
    }
    self->_selfHostingTrigger = v13;

  }
LABEL_13:
  responder = self->_responder;
  if (responder && responder != v17)
  {
    -[UIResponder _responderWindow](responder, "_responderWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_removeWindowLevelChangedObserver:", self);

  }
  objc_storeStrong((id *)&self->_responder, a3);
  v16 = self->_postPinningReloadState;
  self->_postPinningReloadState = 0;

  -[UIKeyboardSceneDelegate _updateTextInputSession](self, "_updateTextInputSession");
  if (-[UIKeyboardSceneDelegate _isIgnoringReloadInputViews](self, "_isIgnoringReloadInputViews"))
    ++self->_ignoredReloads;
  else
    -[UIKeyboardSceneDelegate setInputViews:](self, "setInputViews:", v8);
LABEL_19:

}

- (void)_reloadInputViewsForKeyWindowSceneResponder:(id)a3 force:(BOOL)a4 fromBecomeFirstResponder:(BOOL)a5
{
  _BOOL8 v5;
  UIResponder *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD);
  NSDate *v14;
  NSDate *transitionStartTime;
  void *v16;
  int v17;
  UIResponder *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  int v29;
  _BOOL4 v30;
  int v31;
  void *v32;
  void *v33;
  _BOOL8 v34;
  NSObject *v35;
  id v36;
  UIResponder *responder;
  UIResponder **p_responder;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  os_signpost_id_t v48;
  os_signpost_id_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  UIKeyboardSceneDelegate *v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  _BOOL4 v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  _BOOL8 v71;
  void *v72;
  _BOOL8 v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  UIInputViewSet *transientInputViewSet;
  UIInputViewPostPinningReloadState *v84;
  UIInputViewPostPinningReloadState *postPinningReloadState;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  int v102;
  UIResponder *selfHostingTrigger;
  UIResponder *v104;
  UIResponder *v105;
  void *v106;
  UIInputViewPostPinningReloadState *v107;
  _BOOL4 v108;
  _BOOL4 v109;
  unsigned int v110;
  void *v111;
  uint64_t v112;
  BOOL v113;
  void *v114;
  _BOOL8 v115;
  int v116;
  int v117;
  void *v118;
  void *v119;
  int v120;
  void *v121;
  int v122;
  int v123;
  NSObject *v124;
  _BOOL4 v125;
  NSObject *v126;
  void *v127;
  NSUUID *v128;
  NSUUID *sessionID;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  _BOOL8 v135;
  _BOOL4 v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  char v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  NSObject *v156;
  void (**v157)(_QWORD);
  void *v158;
  void *v159;
  int v160;
  void *v161;
  uint64_t v162;
  void *v163;
  char v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  void *v169;
  void *v170;
  double v171;
  double v172;
  NSObject *v173;
  _BOOL4 v174;
  id obj;
  void *v176;
  unsigned int v177;
  void *v178;
  _BOOL4 v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void (**v184)(_QWORD);
  id v185;
  void *v186;
  void *v187;
  id v188;
  void *v189;
  _BOOL4 v190;
  _QWORD v191[5];
  id v192;
  _QWORD aBlock[5];
  uint8_t buf[4];
  _BYTE v195[10];
  _BYTE v196[6];
  __int16 v197;
  int v198;
  __int16 v199;
  _QWORD v200[4];

  v190 = a5;
  v5 = a4;
  *(_QWORD *)((char *)&v200[2] + 4) = *MEMORY[0x1E0C80C00];
  v8 = (UIResponder *)a3;
  _UIKeyboardSceneDelegateLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[UIKeyboardSceneDelegate _responderDescriptionForLogging:](self, "_responderDescriptionForLogging:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v195 = v10;
    *(_WORD *)&v195[8] = 1024;
    *(_DWORD *)v196 = v5;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Reloading input views for: %@ force: %d", buf, 0x12u);

  }
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "reload", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = 0xEEEEB0B5B2B2EEEELL;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
  transitionStartTime = self->_transitionStartTime;
  self->_transitionStartTime = v14;

  +[UIDictationView activeInstance](UIDictationView, "activeInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "visible");

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !-[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"))
    {
      self->_blockedReloadInputViewsForDictation = 1;
      goto LABEL_22;
    }
    if (self->_blockedReloadInputViewsForDictation)
    {
      -[UIKeyboardSceneDelegate responder](self, "responder");
      v18 = (UIResponder *)objc_claimAutoreleasedReturnValue();

      if (v18 == v8)
      {
        self->_blockedReloadInputViewsForDictation = 0;
        goto LABEL_22;
      }
    }
  }
  self->_blockedReloadInputViewsForDictation = 0;
  -[UIKeyboardSceneDelegate disableInterfaceAutorotation:](self, "disableInterfaceAutorotation:", 0);
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    if (v8 && !v5)
      +[UIKeyboard clearLastKeyboardApplicationIdentifier](UIKeyboard, "clearLastKeyboardApplicationIdentifier");
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isRotating");

    if (v20)
    {
      -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "clearRotationState");

    }
  }
  if (!v5)
  {
    if (-[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"))
    {
      -[UIResponder inputView](v8, "inputView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {

      }
      else
      {
        -[UIResponder inputViewController](v8, "inputViewController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_25;
      }
    }
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clearKeyboardSnapshot");

  }
LABEL_25:
  v184 = v13;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v25 = objc_claimAutoreleasedReturnValue();
  v182 = v12;
  obj = a3;
  if ((unint64_t)v8 | v25)
    goto LABEL_30;
  -[UIInputViewPostPinningReloadState responderToReload](self->_postPinningReloadState, "responderToReload");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
    goto LABEL_30;
  if (-[UIKeyboardSceneDelegate isOnScreen](self, "isOnScreen")
    || -[UIKeyboardSceneDelegate isUndocked](self, "isUndocked"))
  {
    v25 = 0;
LABEL_30:

LABEL_31:
    -[UIResponder _keyboardResponder](v8, "_keyboardResponder");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "delegate");
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    v178 = v26;
    v28 = -[UIKeyboardSceneDelegate isOnScreen](self, "isOnScreen");
    if (!-[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder")
      || !-[UIResponder isFirstResponder](v8, "isFirstResponder")
      || v28
      || -[UIKeyboardSceneDelegate isUndocked](self, "isUndocked"))
    {
      v29 = 0;
    }
    else
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v60, "disableInputBars") ^ 1;

    }
    if (-[UIResponder _requiresKeyboardResetOnReload](v8, "_requiresKeyboardResetOnReload")
      && self->_reloadInputViewsForcedIsAllowed)
    {
      v30 = v29 && !-[UIKeyboardSceneDelegate isWaitingForInputUI](self, "isWaitingForInputUI") || v178 != v176;
    }
    else
    {
      v30 = 0;
    }
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") && self->_responder == v8)
    {
      -[UIResponder inputView](v8, "inputView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        v59 = 1;
      }
      else
      {
        -[UIResponder inputViewController](v8, "inputViewController");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v78 != 0;

      }
      -[UIRemoteInputViewHost inputViewSet](self->_remoteInputViewHost, "inputViewSet");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v59 ^ objc_msgSend(v79, "isCustomInputView");

    }
    else
    {
      v31 = 0;
    }
    if ((v30 | v31) == 1)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textSuggestions");
      v186 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDelegate:force:delayEndInputSession:", 0, 0, v190);

    }
    else
    {
      v186 = 0;
    }
    v34 = (!self->_automaticAppearanceEnabled || self->_responderWithoutAutomaticAppearanceEnabled != v8)
       && -[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled");
    _UIKeyboardSceneDelegateLogger();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v195 = v8 != 0;
      *(_WORD *)&v195[4] = 1024;
      *(_DWORD *)&v195[6] = v5;
      *(_WORD *)v196 = 1024;
      *(_DWORD *)&v196[2] = v190;
      v197 = 1024;
      v198 = v34;
      v199 = 2112;
      v200[0] = v12;
      _os_log_impl(&dword_185066000, v35, OS_LOG_TYPE_DEFAULT, "_reloadInputViewsForKeyWindowSceneResponder: %d force: %d, fromBecomeFirstResponder: %d (automaticKeyboard: %d, reloadIdentifier: %@)", buf, 0x24u);
    }

    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v34;
    -[UIKeyboardSceneDelegate _inputViewsForResponder:withAutomaticKeyboard:force:](self, "_inputViewsForResponder:withAutomaticKeyboard:force:", v8, v34, v5);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_transientInputViewSet, v36);
    p_responder = &self->_responder;
    responder = self->_responder;
    if (responder)
    {
      -[UIResponder _window](responder, "_window");
      v39 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = 0;
    }
    v185 = v39;
    objc_msgSend(v39, "screen");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UIResponder _window](v8, "_window");
      v41 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v41 = 0;
    }
    v181 = v41;
    objc_msgSend(v41, "screen");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboard activeKeyboardForScreen:](UIKeyboard, "activeKeyboardForScreen:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      v188 = v42;
    }
    else
    {
      objc_msgSend(v36, "keyboard");
      v188 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((void *)v40 != v189 && v40 && v189)
    {
      +[UIKeyboard activeKeyboardForScreen:](UIKeyboard, "activeKeyboardForScreen:", v40);
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44 && v188 && v44 != v188)
        objc_msgSend(v44, "deactivate");

    }
    v46 = v188;
    if (v188 && (objc_msgSend(v188, "isActive") & 1) != 0)
      goto LABEL_284;
    if (-[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"))
    {
      if (v190 && !+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
      {
        kdebug_trace();
        kac_get_log();
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v48 = os_signpost_id_make_with_pointer(v47, 0);
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v49 = v48;
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_185066000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v49, "appBringup", " enableTelemetry=YES ", buf, 2u);
          }
        }

        keyboardui_system_get_log_STAGING();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_185066000, v50, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "keyboardUIBringup", ", buf, 2u);
        }

        _UIKeyboardSceneDelegateLogger();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v195 = 0xEEEEB0B5B2B2EEEELL;
          _os_log_debug_impl(&dword_185066000, v51, OS_LOG_TYPE_DEBUG, "START app and keyboard bringup signpost (first responder); ID: %llu",
            buf,
            0xCu);
        }

        qword_1ECD7D940 = mach_absolute_time();
        v46 = v188;
      }
      _MergedGlobals_1033 = v190;
    }
    if (v46)
    {
LABEL_284:
      if ((objc_msgSend(v46, "isActive") & 1) == 0
        && -[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"))
      {
        objc_msgSend(v46, "activate");
      }
    }
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "_trackInputModeIfNecessary:", v8);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v53 = (UIKeyboardSceneDelegate *)objc_claimAutoreleasedReturnValue();

    if (v53 != self)
    {
      -[UIRemoteInputViewHost setInputViewSet:](self->_remoteInputViewHost, "setInputViewSet:", 0);
      goto LABEL_99;
    }
    if (v5)
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "currentInputMode");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "identifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v56, "isEqualToString:", CFSTR("autofillsignup")) & 1) != 0)
      {
        v57 = -[UIRemoteInputViewHost shouldShowDockView](self->_remoteInputViewHost, "shouldShowDockView");

        if (v57)
        {
LABEL_99:
          v61 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess") | v190;
          v187 = (void *)v40;
          if (!-[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"))
          {
LABEL_104:
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "delegate");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v68 != 0;

            objc_msgSend(v67, "_shouldClearTextSuggestions:", v61);
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v190 || -[UIKeyboardSceneDelegate pinningPreventsInputViews:](self, "pinningPreventsInputViews:", v36);
            objc_msgSend(v70, "setDelegate:force:delayEndInputSession:", 0, 0, v71);
LABEL_141:

            transientInputViewSet = self->_transientInputViewSet;
            self->_transientInputViewSet = 0;

            if (-[UIKeyboardSceneDelegate pinningPreventsInputViews:](self, "pinningPreventsInputViews:", v36))
            {
              +[UIInputViewPostPinningReloadState stateWithResponder:](UIInputViewPostPinningReloadState, "stateWithResponder:", v8);
              v84 = (UIInputViewPostPinningReloadState *)objc_claimAutoreleasedReturnValue();
              postPinningReloadState = self->_postPinningReloadState;
              self->_postPinningReloadState = v84;

              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              +[UIDictationController activeInstance](UIDictationController, "activeInstance");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "shouldStayInDictationInputMode");

              if (-[UIKeyboardSceneDelegate hasDictationKeyboard](self, "hasDictationKeyboard") && (v88 & 1) == 0)
              {
                +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v89, "currentInputModeInPreference");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v86, "setKeyboardInputMode:userInitiated:", v90, 0);

              }
              -[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:](self, "setTextEffectsWindowLevelForInputView:responder:", v36, v8);
              v13 = v184;
              v184[2](v184);

              v91 = v185;
              v92 = v187;
LABEL_270:

              v12 = v182;
              goto LABEL_271;
            }
            if (objc_msgSend(v189, "_userInterfaceIdiom") == 3)
            {
LABEL_159:
              v91 = v185;
              if (!-[UIKeyboardSceneDelegate _isIgnoringReloadInputViews](self, "_isIgnoringReloadInputViews"))
              {
                v102 = objc_msgSend(v36, "containsResponder:", v8);
                selfHostingTrigger = self->_selfHostingTrigger;
                if (!v102)
                {
                  v104 = 0;
                  goto LABEL_164;
                }
                if (!selfHostingTrigger)
                {
                  -[UIKeyboardSceneDelegate responder](self, "responder");
                  v104 = (UIResponder *)objc_claimAutoreleasedReturnValue();
                  selfHostingTrigger = self->_selfHostingTrigger;
LABEL_164:
                  self->_selfHostingTrigger = v104;

                }
              }
              v105 = *p_responder;
              if (*p_responder && v105 != v8)
              {
                -[UIResponder _responderWindow](v105, "_responderWindow");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "_removeWindowLevelChangedObserver:", self);

              }
              objc_storeStrong((id *)&self->_responder, obj);
              v107 = self->_postPinningReloadState;
              self->_postPinningReloadState = 0;

              -[UIKeyboardSceneDelegate _updateTextInputSession](self, "_updateTextInputSession");
              v92 = v187;
              if (!v5 && +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
              {
                v108 = -[UIResponder isFirstResponder](v8, "isFirstResponder");
                v109 = -[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder");
                v110 = objc_msgSend(v36, "isCustomInputView");
                v177 = v110;
                if (v108)
                {
                  objc_msgSend(v36, "inputAccessoryView");
                  v111 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v111 && (objc_msgSend(v36, "isInputAccessoryViewPlaceholder") & 1) == 0)
                  {
                    objc_msgSend(v183, "inputAccessoryView");
                    v112 = objc_claimAutoreleasedReturnValue();
                    if (v112)
                      v113 = 1;
                    else
                      v113 = v185 == 0;
                    if (v113)
                      v114 = (void *)v112;
                    else
                      v114 = 0;

                  }
                  v115 = -[UIKeyboardSceneDelegate showingKeyboardForInputViewSet:](self, "showingKeyboardForInputViewSet:", v36);
                  v116 = v69 || v109;
                  if ((((v69 || v109) | v177) & 1) == 0)
                  {
                    if (v115)
                    {
                      v117 = self->_sessionID == 0;
                      v115 = 1;
                      goto LABEL_195;
                    }
                    goto LABEL_194;
                  }
                }
                else
                {
                  v116 = v69 || v109;
                  if ((((v69 || v109) | v110) & 1) == 0)
                  {
LABEL_194:
                    v115 = 0;
                    v117 = self->_sessionID != 0;
LABEL_195:
                    v120 = v108 && !v174;
                    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
                    v121 = (void *)objc_claimAutoreleasedReturnValue();
                    v122 = objc_msgSend(v121, "shouldIgnoreInputDestinationChange:withIAVHeight:", v115, 0.0);

                    v179 = v115;
                    if (-[UIKeyboardSceneDelegate isWaitingForInputUI](self, "isWaitingForInputUI"))
                    {
                      v123 = 1;
                      v92 = v187;
                    }
                    else
                    {
                      v92 = v187;
                      if ((v69 | v117) == 1)
                        v123 = (v120 | v122) ^ 1;
                      else
                        v123 = 0;
                    }
                    _UIKeyboardSceneDelegateLogger();
                    v124 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                    {
                      v125 = -[UIKeyboardSceneDelegate isWaitingForInputUI](self, "isWaitingForInputUI");
                      *(_DWORD *)buf = 67110400;
                      *(_DWORD *)v195 = v125;
                      *(_WORD *)&v195[4] = 1024;
                      *(_DWORD *)&v195[6] = v69;
                      *(_WORD *)v196 = 1024;
                      *(_DWORD *)&v196[2] = v117;
                      v197 = 1024;
                      v198 = v120;
                      v199 = 1024;
                      LODWORD(v200[0]) = v122;
                      WORD2(v200[0]) = 1024;
                      *(_DWORD *)((char *)v200 + 6) = v123;
                      _os_log_impl(&dword_185066000, v124, OS_LOG_TYPE_DEFAULT, "shouldUpdateKeyboardArbiter (waitingForInputUI: %d, didSetDelegate: %d, shouldUpdateRTI: %d, showingManualKeyboard: %d, shouldIgnoreInputDestinationChange: %d) -> %d", buf, 0x26u);
                    }

                    v13 = v184;
                    if (v117)
                    {
                      _UIKeyboardSceneDelegateLogger();
                      v126 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_185066000, v126, OS_LOG_TYPE_DEFAULT, "Updating RTI manually", buf, 2u);
                      }

                      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                      v127 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v127)
                      {
                        +[UIKeyboardImpl sharedInstanceForCustomInputView:](UIKeyboardImpl, "sharedInstanceForCustomInputView:", v177);
                        v127 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      if (v179)
                      {
                        -[UIRemoteInputViewHost updateInputViewsIfNecessary](self->_remoteInputViewHost, "updateInputViewsIfNecessary");
                        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                        v128 = (NSUUID *)objc_claimAutoreleasedReturnValue();
                        sessionID = self->_sessionID;
                        self->_sessionID = v128;

                        objc_msgSend(v127, "remoteTextInputPartner");
                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v130, "beginAllowingRemoteTextInput:", self->_sessionID);

                        objc_msgSend(v127, "remoteTextInputPartner");
                        v131 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v131, "beginInputSessionWithIdentifier:", self->_sessionID);
                      }
                      else
                      {
                        if (os_variant_has_internal_diagnostics())
                        {
                          _UIKeyboardExtendedLog();
                          v173 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl(&dword_185066000, v173, OS_LOG_TYPE_DEFAULT, "ending session for shouldShow==NO for non-UIKeyInput", buf, 2u);
                          }

                          v13 = v184;
                        }
                        objc_msgSend(v127, "remoteTextInputPartnerPrivate");
                        v132 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v132, "endInputSessionWithIdentifier:", self->_sessionID);

                        objc_msgSend(v127, "remoteTextInputPartnerPrivate");
                        v133 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v133, "endAllowingRemoteTextInput:", self->_sessionID);

                        v131 = self->_sessionID;
                        self->_sessionID = 0;
                      }

                      v92 = v187;
                    }
                    if (!v123)
                    {
                      LOBYTE(v137) = 0;
                      goto LABEL_239;
                    }
                    objc_msgSend(v36, "inputAccessoryView");
                    v134 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v134)
                    {
                      v135 = v179;
                      if ((objc_msgSend(v36, "isInputAccessoryViewPlaceholder") & 1) != 0)
                      {
                        v136 = 0;
                      }
                      else
                      {
                        objc_msgSend(v183, "inputAccessoryView");
                        v141 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v36, "inputAccessoryView");
                        v142 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v141 == v142)
                        {
                          v136 = 0;
                        }
                        else
                        {
                          objc_msgSend(v36, "inputAccessoryView");
                          v143 = (void *)objc_claimAutoreleasedReturnValue();
                          if ((objc_msgSend(v143, "isFirstResponder") & 1) != 0)
                          {
                            v136 = 0;
                          }
                          else
                          {
                            objc_msgSend(v36, "inputAccessoryView");
                            v145 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v145, "window");
                            v146 = (void *)objc_claimAutoreleasedReturnValue();
                            v136 = v146 == 0;

                          }
                        }

                      }
                    }
                    else
                    {
                      v136 = 0;
                      v135 = v179;
                    }

                    -[UIKeyboardSceneDelegate setWaitingForInputUI:](self, "setWaitingForInputUI:", v182);
                    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
                    v147 = (void *)objc_claimAutoreleasedReturnValue();
                    -[UIKeyboardSceneDelegate scene](self, "scene");
                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                    v137 = objc_msgSend(v147, "inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:", v135, 0, 1, v148, 0.0);

                    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
                    v149 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v149, "currentUIState");
                    v150 = (void *)objc_claimAutoreleasedReturnValue();
                    v151 = 0;
                    if (objc_msgSend(v150, "isLocal"))
                    {
                      -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
                      v152 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v152, "currentUIState");
                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                      v151 = objc_msgSend(v153, "keyboardOnScreen");

                    }
                    if (objc_msgSend(v36, "isInputViewPlaceholder"))
                    {
                      v92 = v187;
                      if ((v151 & 1) != 0 || !v136)
                      {
                        v13 = v184;
                        goto LABEL_238;
                      }
                      v13 = v184;
                      if (((v137 ^ 1) & 1) != 0)
                      {
LABEL_238:
                        -[UIKeyboardSceneDelegate _updateContainerWindowLevel](self, "_updateContainerWindowLevel");
LABEL_239:
                        _UIKeyboardSceneDelegateLogger();
                        v156 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)v195 = v36;
                          _os_log_impl(&dword_185066000, v156, OS_LOG_TYPE_DEFAULT, "Will set input views %@", buf, 0xCu);
                        }

                        v91 = v185;
                        if ((v137 & 1) != 0)
                          goto LABEL_243;
                        goto LABEL_242;
                      }
                      objc_msgSend(v36, "inputAccessoryView");
                      v154 = (void *)objc_claimAutoreleasedReturnValue();
                      +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", 0, v154, 0);
                      v155 = objc_claimAutoreleasedReturnValue();

                      v36 = (id)v155;
                    }
                    else
                    {
                      v13 = v184;
                    }
                    v92 = v187;
                    goto LABEL_238;
                  }
                  v115 = 0;
                }
                v117 = v116 ^ 1;
                goto LABEL_195;
              }
              if (!self->_sessionID)
              {
                v13 = v184;
LABEL_242:
                -[UIKeyboardSceneDelegate cleanUpWaitingForInputUI](self, "cleanUpWaitingForInputUI");
LABEL_243:
                if (-[UIKeyboardSceneDelegate _isIgnoringReloadInputViews](self, "_isIgnoringReloadInputViews"))
                {
                  ++self->_ignoredReloads;
                  v13[2](v13);
                }
                else
                {
                  v191[0] = MEMORY[0x1E0C809B0];
                  v191[1] = 3221225472;
                  v191[2] = __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_535;
                  v191[3] = &unk_1E16B1B50;
                  v191[4] = self;
                  v36 = v36;
                  v192 = v36;
                  v157 = (void (**)(_QWORD))_Block_copy(v191);
                  if (qword_1ECD7D948 != -1)
                    dispatch_once(&qword_1ECD7D948, &__block_literal_global_536);
                  if (dyld_program_sdk_at_least() && !_UIIsPrivateMainBundle())
                  {
                    v160 = !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
                  }
                  else
                  {
                    if (qword_1ECD7D960 != -1)
                      dispatch_once(&qword_1ECD7D960, &__block_literal_global_1054);
                    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
                    v158 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v158, "valueForPreferenceKey:", CFSTR("NewKeyboardNotificationOrder"));
                    v159 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v159, "BOOLValue"))
                      v160 = !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
                    else
                      v160 = 0;
                    v92 = v187;

                  }
                  if (byte_1ECD7D929 || v160)
                  {
                    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                    v162 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend((id)v162, "inputDelegateManager");
                    v163 = (void *)objc_claimAutoreleasedReturnValue();
                    v164 = objc_msgSend(v163, "hasAsyncCapableInputDelegate");

                    LOBYTE(v162) = objc_msgSend(v36, "isEmpty");
                    v180 = -[NSMutableArray count](self->_animationStyleStack, "count");
                    objc_msgSend((id)UIApp, "_touchesEvent");
                    v165 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v165, "allTouches");
                    v166 = (void *)objc_claimAutoreleasedReturnValue();
                    v167 = objc_msgSend(v166, "count");

                    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
                    v168 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v162 & 1) == 0
                      && (v164 & 1) == 0
                      && ((v160 & 1) != 0
                       || !v180 && (v167 || objc_msgSend(v161, "hasDelayedTasksForKey:", v168))))
                    {
                      if (byte_1ECD7D929)
                        objc_msgSend(v161, "queueDelayedTask:forKey:", v157, v168);
                      else
                        objc_msgSend(v161, "queueDelayedTask:forKey:delay:", v157, v168, 0.01);
                    }
                    else
                    {
                      objc_msgSend(v161, "flushDelayedTasksForKey:", v168);
                      v157[2](v157);
                    }
                    v13 = v184;
                    v92 = v187;

                  }
                  else
                  {
                    v157[2](v157);
                    v161 = self->_transitionStartTime;
                    self->_transitionStartTime = 0;
                  }

                  if (!v190)
                  {
                    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                    v169 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v169, "restoreTextSuggestions");

                    v92 = v187;
                  }
                  v13[2](v13);

                  v91 = v185;
                }
                goto LABEL_270;
              }
              v13 = v184;
              if (!objc_msgSend(v36, "isCustomInputView")
                || -[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"))
              {
                goto LABEL_242;
              }
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v118)
              {
                v92 = v187;
                +[UIKeyboardImpl sharedInstanceForCustomInputView:](UIKeyboardImpl, "sharedInstanceForCustomInputView:", objc_msgSend(v36, "isCustomInputView"));
                v118 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v118, "inputDelegate");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v119)
              {
                objc_msgSend(v118, "remoteTextInputPartner");
                v139 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v139, "rtiClient");
                v140 = (void *)objc_claimAutoreleasedReturnValue();

                v92 = v187;
                if (v140)
                  goto LABEL_220;
                objc_msgSend(v118, "remoteTextInputPartner");
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v144, "beginAllowingRemoteTextInput:", self->_sessionID);

                v92 = v187;
                objc_msgSend(v118, "remoteTextInputPartner");
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "beginInputSessionWithIdentifier:", self->_sessionID);
              }

LABEL_220:
              v91 = v185;
              goto LABEL_242;
            }
            if (!-[UIResponder _requiresKeyboardWhenFirstResponder](v8, "_requiresKeyboardWhenFirstResponder"))
              goto LABEL_150;
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "currentInputMode");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v94, "isExtensionInputMode") & 1) != 0)
            {
              v95 = objc_msgSend(v36, "isCustomInputView");

              if ((v95 & 1) != 0)
              {
LABEL_150:
                if (-[UIKeyboardSceneDelegate _isIgnoringReloadInputViews](self, "_isIgnoringReloadInputViews"))
                  goto LABEL_159;
                objc_msgSend(v183, "inputViewController");
                v96 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v96, "_compatibilityController");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "setTearingDownInputController");
                goto LABEL_157;
              }
            }
            else
            {

            }
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "currentInputMode");
            v96 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v96, "identifier");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v99, "isEqualToString:", CFSTR("autofillsignup"));

            if (v100)
            {
              if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
              {
LABEL_158:

                goto LABEL_159;
              }
              -[UIKeyboardSceneDelegate remoteHostInputViewSet:](self, "remoteHostInputViewSet:", v36);
              v97 = v36;
              v36 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v36, "inputViewController");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "_compatibilityController");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "setInputMode:", v96);

            }
LABEL_157:

            goto LABEL_158;
          }
          if (!+[UIKeyboard isInHardwareKeyboardMode](UIKeyboard, "isInHardwareKeyboardMode"))
          {
            objc_msgSend(v36, "hostedCustomInputView");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v62;
            if (v62 && (objc_msgSend(v62, "frame"), v64 == 0.0))
            {
              objc_msgSend(v63, "subviews");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v65, "count");

              if (!v66)
                goto LABEL_104;
            }
            else
            {

            }
          }
          -[UIKeyboardSceneDelegate updateRenderConfigForResponder:](self, "updateRenderConfigForResponder:", v8);
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v67)
          {
            if (-[UIKeyboardSceneDelegate automaticAppearanceEnabled](self, "automaticAppearanceEnabled"))
            {
              -[UIResponder inputView](v8, "inputView");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = v72 != 0;

            }
            else
            {
              v73 = 0;
            }
            +[UIKeyboardImpl sharedInstanceForCustomInputView:](UIKeyboardImpl, "sharedInstanceForCustomInputView:", v73);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[UIResponder _keyboardResponder](v8, "_keyboardResponder");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
            && !self->_automaticAppearanceEnabledInternal)
          {
            objc_msgSend(v67, "delegate");
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            if (v77 == v70)
            {
              objc_msgSend(v67, "setDelegate:", v70);
              v69 = 1;
            }
            else
            {
              v69 = 0;
            }
LABEL_140:
            objc_msgSend(v67, "geometryDelegate");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "syncMinimizedStateToHardwareKeyboardAttachedState");

            goto LABEL_141;
          }
          objc_msgSend(v67, "geometryDelegate");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v74)
          {
            if ((objc_msgSend(v67, "forCustomInputView") & 1) != 0)
              goto LABEL_118;
            objc_msgSend(v36, "keyboard");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (v74)
            {
              objc_msgSend(v67, "setGeometryDelegate:", v74);
            }
            else
            {
              +[UIKeyboardAutomatic sharedInstance](UIKeyboardAutomatic, "sharedInstance");
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "setGeometryDelegate:", v138);

            }
          }

LABEL_118:
          if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
          {
            _UIKeyboardSceneDelegateLogger();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v67, "geometryDelegate");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v195 = v76;
              _os_log_impl(&dword_185066000, v75, OS_LOG_TYPE_DEFAULT, "_reloadInputViewsForKeyWindowSceneResponder, updateInputViewsIfNecessary for geometryDelegate: %@", buf, 0xCu);

            }
            -[UIRemoteInputViewHost updateInputViewsIfNecessary](self->_remoteInputViewHost, "updateInputViewsIfNecessary");
          }
          objc_msgSend(v67, "_shouldClearTextSuggestions:", v61);
          objc_msgSend(v67, "setDelegate:force:delayEndInputSession:", v70, 0, v190);
          v69 = 1;
          if (v178 == v176 && v186)
            objc_msgSend(v67, "setSuggestions:", v186);
          goto LABEL_140;
        }
      }
      else
      {

      }
    }
    -[UIRemoteInputViewHost setInputViewSet:](self->_remoteInputViewHost, "setInputViewSet:", v36);
    -[UIRemoteInputViewHost setShouldShowDockView:](self->_remoteInputViewHost, "setShouldShowDockView:", 0);
    goto LABEL_99;
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v25 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v25, "keyboardVisible") & 1) != 0)
    goto LABEL_30;
  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v80, "isInputViewPlaceholder") & 1) != 0)
  {
LABEL_138:

    goto LABEL_30;
  }
  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v81, "isInputAccessoryViewPlaceholder") & 1) != 0 || self->_allowNilResponderReload)
  {

    goto LABEL_138;
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "heightForRemoteIAVPlaceholderIfNecessary");
  v172 = v171;

  v12 = v182;
  if (v172 != 0.0)
    goto LABEL_31;
LABEL_22:
  v13[2](v13);
LABEL_271:

}

- (UIResponder)responder
{
  return self->_responder;
}

- (BOOL)_isIgnoringReloadInputViews
{
  return self->_ignoringReloadInputViews > 0;
}

- (id)_responderDescriptionForLogging:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_kb_description");
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; >"), objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)pinningPreventsInputViews:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[NSMutableSet count](self->_pinningResponders, "count") && !self->_ignoresPinning)
  {
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isStrictSupersetOfViewSet:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)disableInterfaceAutorotation:(BOOL)a3
{
  BOOL v4;
  char **v5;
  void *v6;

  if (a3)
  {
    if (self->_interfaceAutorotationDisabled)
      return;
    v4 = 1;
    v5 = &selRef_beginDisablingInterfaceAutorotation;
  }
  else
  {
    if (!self->_interfaceAutorotationDisabled)
      return;
    v4 = 0;
    v5 = &selRef_endDisablingInterfaceAutorotation;
  }
  objc_msgSend((id)UIApp, "windows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "makeObjectsPerformSelector:", *v5);

  self->_interfaceAutorotationDisabled = v4;
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (_MergedGlobals_1033)
  {
    *(_QWORD *)buf = 0;
    v9 = buf;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__84;
    v12 = __Block_byref_object_dispose__84;
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_525;
    v7[3] = &unk_1E16C6178;
    v3 = *(_QWORD *)(a1 + 32);
    v7[4] = buf;
    v7[5] = v3;
    objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", 0x1E174E060, 0, 0, v7);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v9 + 5);
    *((_QWORD *)v9 + 5) = v4;

    _Block_object_dispose(buf, 8);
  }
  kdebug_trace();
  kac_get_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "reload", ", buf, 2u);
  }

}

- (void)_updateTextInputSession
{
  void *v3;
  void *v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  UIResponder *responder;
  _BOOL4 v9;
  UITextInputSessionActionAnalytics *sessionAnalytics;
  UITextInputSessionActionAnalytics *v11;
  UITextInputSessionActionAnalytics *v12;
  UITextInputSessionActionAnalytics *v13;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSecureTextEntry");

  v6 = -[UIResponder _requiresKeyboardWhenFirstResponder](self->_responder, "_requiresKeyboardWhenFirstResponder");
  if (v5)
    goto LABEL_14;
  v7 = v6;
  responder = self->_responder;
  if (responder)
    v9 = v7;
  else
    v9 = 0;
  sessionAnalytics = self->_sessionAnalytics;
  if (v9)
  {
    if (!sessionAnalytics)
    {
      v11 = objc_alloc_init(UITextInputSessionActionAnalytics);
      v12 = self->_sessionAnalytics;
      self->_sessionAnalytics = v11;

      -[UITextInputSessionActionAnalytics setDelegateSource:](self->_sessionAnalytics, "setDelegateSource:", self);
      -[UITextInputSessionActionAnalytics didBegin](self->_sessionAnalytics, "didBegin");
      return;
    }
  }
  else
  {
    if (!sessionAnalytics)
      return;
    if (!responder)
      goto LABEL_13;
  }
  if ((_UIResponderRequiresTextInput(responder) & 1) == 0)
  {
    sessionAnalytics = self->_sessionAnalytics;
LABEL_13:
    -[UITextInputSessionActionAnalytics writeAnalytics](sessionAnalytics, "writeAnalytics");
LABEL_14:
    v13 = self->_sessionAnalytics;
    self->_sessionAnalytics = 0;

  }
}

- (void)_endPersistingInputAccessoryViewWithId:(id)a3
{
  NSMutableArray *persistentInputAccessoryResponderOrder;
  id v5;
  _QWORD v6[5];

  persistentInputAccessoryResponderOrder = self->_persistentInputAccessoryResponderOrder;
  v5 = a3;
  LODWORD(persistentInputAccessoryResponderOrder) = -[NSMutableArray containsObject:](persistentInputAccessoryResponderOrder, "containsObject:", v5);
  -[NSMutableArray removeObject:](self->_persistentInputAccessoryResponderOrder, "removeObject:", v5);
  -[NSMutableDictionary removeObjectForKey:](self->_persistentInputAccessoryResponders, "removeObjectForKey:", v5);

  if ((_DWORD)persistentInputAccessoryResponderOrder)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__UIKeyboardSceneDelegate__endPersistingInputAccessoryViewWithId___block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    -[UIKeyboardSceneDelegate performWithAllowingNilResponderReload:](self, "performWithAllowingNilResponderReload:", v6);
  }
}

- (void)_clearPreservedInputViewsWithId:(id)a3 clearKeyboard:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  NSMutableSet *pinningResponders;
  void *v9;
  id v10;
  _QWORD v11[5];

  v4 = a4;
  v10 = a3;
  -[NSMutableDictionary objectForKey:](self->_preservedViewSets, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "restorableResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    pinningResponders = self->_pinningResponders;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__UIKeyboardSceneDelegate__clearPreservedInputViewsWithId_clearKeyboard___block_invoke;
    v11[3] = &unk_1E16C6210;
    v11[4] = self;
    -[NSMutableSet enumerateObjectsUsingBlock:](pinningResponders, "enumerateObjectsUsingBlock:", v11);
    if (-[UIKeyboardSceneDelegate isOnScreen](self, "isOnScreen"))
    {
      if (-[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled"))
      {
        -[UIKeyboardSceneDelegate nextAnimationStyle:](self, "nextAnimationStyle:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate orderOutWithAnimationStyle:](self, "orderOutWithAnimationStyle:", v9);

      }
    }
  }
  -[UIKeyboardSceneDelegate _clearMultiDocumentTokenIfNecessary:withId:](self, "_clearMultiDocumentTokenIfNecessary:withId:", v7, v10);
  if (-[NSMutableDictionary count](self->_preservedViewSets, "count"))
    -[NSMutableDictionary removeObjectForKey:](self->_preservedViewSets, "removeObjectForKey:", v10);

}

- (void)_clearMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE06D890))
  {
    v6 = v5;
    v7 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "_clearToken:", v6);

  }
}

- (void)_clearPreservedInputViewsWithRestorableResponder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *preservedViewSets;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  v5 = -[NSMutableDictionary count](self->_preservedViewSets, "count");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    preservedViewSets = self->_preservedViewSets;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke;
    v25[3] = &unk_1E16C6238;
    v26 = v4;
    -[NSMutableDictionary keysOfEntriesPassingTest:](preservedViewSets, "keysOfEntriesPassingTest:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = self->_preservedViewSets;
      objc_msgSend(v8, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectsForKeys:](v9, "removeObjectsForKeys:", v10);

    }
  }
  if (self->_containerWindow)
  {
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_nextResponderOverride");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v4)
    {
      -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inputView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_clearOverrideNextResponder");

    }
    if (self->_containerWindow)
    {
      -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "inputAccessoryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_nextResponderOverride");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18 == v4)
      {
        -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "inputAccessoryView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_clearOverrideNextResponder");

      }
    }
  }
  v21 = self->_preservedViewSets;
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke_2;
  v23[3] = &unk_1E16C6260;
  v24 = v4;
  v22 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v21, "enumerateKeysAndObjectsUsingBlock:", v23);

}

- (void)forceReloadInputViews
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint8_t v19[16];

  _UIKeyboardSceneDelegateLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "forceReloadInputViews", v19, 2u);
  }

  -[UIKeyboardSceneDelegate clearWaitingForInputUIIfNeeded](self, "clearWaitingForInputUIIfNeeded");
  self->_restoringInputViewsAndWaitingForInputUI = 0;
  if (self->_postPinningReloadState)
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "_requiresKeyboardWhenFirstResponder") & 1) != 0)
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "handlingRemoteEvent");

      if (v6)
      {
        -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate responder](self, "responder");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:](self, "setTextEffectsWindowLevelForInputView:responder:", v7, v8);

        -[UIKeyboardSceneDelegate _performPostWaitingForInputUIBlocks](self, "_performPostWaitingForInputUIBlocks");
        return;
      }
    }
    else
    {

    }
  }
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "oldPathForSnapshot"))
    goto LABEL_15;
  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputAssistantView");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  v12 = (void *)v11;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inputAssistantView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "isDescendantOfView:", v16);

  if ((v17 & 1) == 0)
  {
LABEL_16:
    self->_keepInputSession = 1;
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:force:](self, "_reloadInputViewsForResponder:force:", v18, 1);

    -[UIKeyboardSceneDelegate _performPostWaitingForInputUIBlocks](self, "_performPostWaitingForInputUIBlocks");
    self->_keepInputSession = 0;
  }
}

- (void)cleanUpWaitingForInputUI
{
  if (-[UIKeyboardSceneDelegate clearWaitingForInputUIIfNeeded](self, "clearWaitingForInputUIIfNeeded"))
    -[UIKeyboardSceneDelegate _performPostWaitingForInputUIBlocks](self, "_performPostWaitingForInputUIBlocks");
}

- (BOOL)clearWaitingForInputUIIfNeeded
{
  NSUUID *waitingForInputUI;

  waitingForInputUI = self->_waitingForInputUI;
  if (waitingForInputUI)
  {
    self->_waitingForInputUI = 0;

  }
  return waitingForInputUI != 0;
}

- (void)_reloadInputViewsForResponder:(id)a3 force:(BOOL)a4
{
  -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:force:fromBecomeFirstResponder:](self, "_reloadInputViewsForResponder:force:fromBecomeFirstResponder:", a3, a4, 0);
}

- (void)_performPostWaitingForInputUIBlocks
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[UIKeyboardSceneDelegate isWaitingForInputUI](self, "isWaitingForInputUI")
    && -[NSMutableArray count](self->_postWaitingForInputUIBlocks, "count"))
  {
    v3 = (void *)-[NSMutableArray copy](self->_postWaitingForInputUIBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_postWaitingForInputUIBlocks, "removeAllObjects");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)isUndocked
{
  void *v2;
  char v3;

  -[UITextEffectsWindow rootViewController](self->_containerWindow, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUndocked");

  return v3;
}

void __58__UIKeyboardSceneDelegate_updateRenderConfigForResponder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v15 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "owner");
    v3 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v3;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v15;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_13;
  }
  if (v4)
  {
    v16 = v4;
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) != 0)
    {
LABEL_12:
      v4 = v16;
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 40), "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "screen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_userInterfaceIdiom");

    if (v8 == 3)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "windowScene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "scene");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 != v12)
      {
LABEL_11:
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
        goto LABEL_12;
      }
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v16, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    objc_msgSend(v13, "_setRenderConfig:", *(_QWORD *)(a1 + 48));

    goto LABEL_11;
  }
LABEL_13:

}

- (void)_reloadInputViewsForResponder:(id)a3
{
  -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:force:fromBecomeFirstResponder:](self, "_reloadInputViewsForResponder:force:fromBecomeFirstResponder:", a3, 0, 0);
}

- (UIView)containerView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (UIView *)v7;
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("iPhone8,1"), CFSTR("iPhone8,2"), CFSTR("iPhone8,4"), CFSTR("iPad6,7"), CFSTR("iPad6,8"), CFSTR("iPad7,1"), CFSTR("iPad7,2"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_deviceInfoForKey:", CFSTR("ProductType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECD7D929 = objc_msgSend(v2, "containsObject:", v1);

}

- (void)_setIgnoresPinning:(BOOL)a3 allowImmediateReload:(BOOL)a4
{
  UIInputViewPostPinningReloadState *postPinningReloadState;
  id v6;

  if (self->_ignoresPinning != a3)
  {
    self->_ignoresPinning = a3;
    if (a3 && a4)
    {
      postPinningReloadState = self->_postPinningReloadState;
      if (postPinningReloadState)
      {
        -[UIInputViewPostPinningReloadState responderToReload](postPinningReloadState, "responderToReload");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:](self, "_reloadInputViewsForResponder:", v6);

      }
    }
  }
}

- (void)pushAnimationStyle:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_animationStyleStack, "addObject:");
}

- (void)popAnimationStyle
{
  if (-[NSMutableArray count](self->_animationStyleStack, "count"))
    -[NSMutableArray removeLastObject](self->_animationStyleStack, "removeLastObject");
}

uint64_t __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInputViewSet:", *(_QWORD *)(a1 + 40));
}

- (void)prepareToMoveKeyboardForInputViewSet:(id)a3 animationStyle:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL8 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
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
  id v38;

  v38 = a3;
  v6 = a4;
  -[UIKeyboardSceneDelegate _windowScene](self, "_windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_isKeyWindowScene");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    v8 = v8 & (objc_msgSend(v38, "isInputAccessoryViewPlaceholder") ^ 1);
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "handlingRemoteEvent");

    v8 = v8 & ~v10;
  }
  objc_msgSend(v6, "endPlacementForInputViewSet:windowScene:", v38, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIKeyboardSceneDelegate _showKeyboardWindowForInputViewSet:placement:windowScene:](self, "_showKeyboardWindowForInputViewSet:placement:windowScene:", v38, v11, v7);
  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      v12 = -[UIKeyboardSceneDelegate showingKeyboardForInputViewSet:](self, "showingKeyboardForInputViewSet:", v38);
    objc_msgSend(v11, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v38, 0);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v11, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v38, 1);
    -[UIKeyboardSceneDelegate updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:](self, "updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:", v8, v12, v8, v7, v14, v16, v18, v20, v21, v22, v23, v24);
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v38, 0);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(v11, "remoteIntrinsicContentSizeForInputViewInSet:includingIAV:", v38, 1);
    objc_msgSend(v25, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", objc_msgSend(v38, "isInputAccessoryViewPlaceholder") ^ 1, v12, v8, v7, v27, v29, v31, v33, v34, v35, v36, v37);

  }
}

- (id)nextAnimationStyle
{
  return -[UIKeyboardSceneDelegate nextAnimationStyle:](self, "nextAnimationStyle:", 1);
}

- (void)setInputViews:(id)a3
{
  id v4;

  v4 = a3;
  -[UIKeyboardSceneDelegate setInputViews:animated:](self, "setInputViews:animated:", v4, -[UIKeyboardSceneDelegate animationsEnabled](self, "animationsEnabled"));

}

- (void)setInputViews:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIKeyboardSceneDelegate nextAnimationStyle:](self, "nextAnimationStyle:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate setInputViews:animationStyle:](self, "setInputViews:animationStyle:", v6, v7);

}

- (void)setInputViews:(id)a3 animationStyle:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->_containerWindow
    || !objc_msgSend(v10, "isEmpty")
    || -[UIResponder _disableAutomaticKeyboardUI](self->_responder, "_disableAutomaticKeyboardUI"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "handlingRemoteEvent");

    if ((v8 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
    -[UIKeyboardSceneDelegate scene](self, "scene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "_isKeyWindowScene"))
      -[UIKeyboardSceneDelegate setKeyWindowSceneInputViews:animationStyle:](self, "setKeyWindowSceneInputViews:animationStyle:", v10, v6);
    else
      -[UIKeyboardSceneDelegate setWindowSceneInputViews:animationStyle:](self, "setWindowSceneInputViews:animationStyle:", v10, v6);

  }
}

- (BOOL)animationsEnabled
{
  BOOL result;
  void *v4;
  void *v5;
  char v6;

  if (+[UIKeyboard usesLocalKeyboard](UIKeyboard, "usesLocalKeyboard"))
    return 0;
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "useHostedInstance");

  result = (v6 & 1) != 0
        || objc_msgSend((id)UIApp, "applicationState") != 2
        || +[UIWindow _allWindowsKeepContextInBackground](UIWindow, "_allWindowsKeepContextInBackground");
  if (self->_disableAnimationsCount >= 1)
    return 0;
  return result;
}

- (BOOL)useHostedInstance
{
  return self->_hostedUseCount != 0;
}

- (void)_reloadInputViewsForResponder:(id)a3 force:(BOOL)a4 fromBecomeFirstResponder:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_isKeyWindowScene"))
    -[UIKeyboardSceneDelegate _reloadInputViewsForKeyWindowSceneResponder:force:fromBecomeFirstResponder:](self, "_reloadInputViewsForKeyWindowSceneResponder:force:fromBecomeFirstResponder:", v8, v6, v5);
  else
    -[UIKeyboardSceneDelegate _reloadInputViewsForWindowSceneResponder:force:](self, "_reloadInputViewsForWindowSceneResponder:force:", v8, v6);

}

- (id)_windowScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[UIKeyboardSceneDelegate responder](self, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_responderWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[UIKeyboardSceneDelegate scene](self, "scene");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (BOOL)_showKeyboardWindowForInputViewSet:(id)a3 placement:(id)a4 windowScene:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;

  v7 = a3;
  v8 = a4;
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    objc_msgSend(v7, "inputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10 || objc_msgSend(v7, "isInputViewPlaceholder"))
    {
      objc_msgSend(v7, "inputAssistantView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11 || (objc_msgSend(v7, "isInputAssistantViewPlaceholder") & 1) != 0)
      {
        v12 = objc_msgSend(v7, "isNullInputView");

        if ((v12 & 1) == 0)
          goto LABEL_16;
        goto LABEL_11;
      }

    }
LABEL_11:
    if ((objc_msgSend(v8, "showsInputViews") & 1) != 0)
      goto LABEL_15;
    if ((objc_msgSend(v8, "isUndocked") & 1) != 0)
      goto LABEL_15;
    objc_msgSend(v7, "keyboard");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v7, "keyboard");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isMinimized");

      if ((v16 & 1) != 0)
      {
LABEL_15:
        v9 = 1;
        goto LABEL_17;
      }
    }
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v9 = -[UIKeyboardSceneDelegate showingKeyboardForInputViewSet:](self, "showingKeyboardForInputViewSet:", v7);
LABEL_17:

  return v9;
}

- (id)nextAnimationStyle:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if (-[NSMutableArray count](self->_animationStyleStack, "count"))
  {
    -[NSMutableArray lastObject](self->_animationStyleStack, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_hasCustomAnimationProperties)
  {
    +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", 1, self->_nextAutomaticOrderInDirection, self->_nextAutomaticOrderInDuration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
      +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
    else
      +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_endDisablingAnimations
{
  id v2;

  --self->_disableAnimationsCount;
  if (self->_containerWindow)
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "popAnimationStyle");

  }
}

uint64_t __67__UIKeyboardSceneDelegate_setWindowSceneInputViews_animationStyle___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInputViewSet:", *(_QWORD *)(a1 + 40));
}

- (BOOL)hasVisibleAssistantBar
{
  void *v2;
  char v3;

  -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldBeShownForInputDelegate:inputViews:", 0, 0);

  return v3;
}

- (BOOL)takingSnapshot
{
  return self->_takingSnapshot;
}

- (UIKBLocalAuthenticationObserver)localAuthenticationObserver
{
  return self->_localAuthenticationObserver;
}

- (int)_endIgnoringReloadInputViews
{
  int v2;

  v2 = self->_ignoringReloadInputViews - 1;
  self->_ignoringReloadInputViews = v2;
  if (v2)
    return 0;
  else
    return self->_ignoredReloads;
}

- (void)_beginIgnoringReloadInputViews
{
  int ignoringReloadInputViews;

  ignoringReloadInputViews = self->_ignoringReloadInputViews;
  if (!ignoringReloadInputViews)
    self->_ignoredReloads = 0;
  self->_ignoringReloadInputViews = ignoringReloadInputViews + 1;
}

- (void)_reloadInputViewsForResponder:(id)a3 fromBecomeFirstResponder:(BOOL)a4
{
  -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:force:fromBecomeFirstResponder:](self, "_reloadInputViewsForResponder:force:fromBecomeFirstResponder:", a3, 0, a4);
}

- (BOOL)_isTrackingResponder:(id)a3
{
  UIInputViewPostPinningReloadState *postPinningReloadState;
  id v5;
  id v6;

  postPinningReloadState = self->_postPinningReloadState;
  v5 = a3;
  if (postPinningReloadState)
    -[UIInputViewPostPinningReloadState responderToReload](postPinningReloadState, "responderToReload");
  else
    -[UIKeyboardSceneDelegate responder](self, "responder");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (BOOL)hasCustomInputViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      -[UIKeyboardSceneDelegate _delegateAsResponder](self, "_delegateAsResponder");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    objc_msgSend(v6, "inputViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasCustomInputViewController = v7 != 0;

  }
  return self->_hasCustomInputViewController;
}

- (BOOL)automaticAppearanceEnabled
{
  return self->_automaticAppearanceEnabled;
}

- (UIWindow)keyWindowCandidate
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
}

- (BOOL)hideSystemInputAssistantView
{
  return self->_hideSystemInputAssistantView;
}

- (BOOL)isWaitingForInputUI
{
  return self->_waitingForInputUI != 0;
}

- (void)_beginDisablingAnimations
{
  void *v2;
  id v3;

  ++self->_disableAnimationsCount;
  if (self->_containerWindow)
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushAnimationStyle:", v2);

  }
}

- (CGRect)visibleFrameInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIKeyboardSceneDelegate *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v4 = a3;
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUndocked"))
  {

LABEL_4:
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_5;
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "activeKeyboardSceneDelegate");
  v7 = (UIKeyboardSceneDelegate *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "remoteKeyboardUndocked:", v7 != self);

  if (v8)
    goto LABEL_4;
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visibleFrame");
  v9 = v18;
  v10 = v19;
  v11 = v20;
  v12 = v21;

  objc_msgSend(v4, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "coordinateSpace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "windowScene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "coordinateSpace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertRect:toCoordinateSpace:", v29, v9, v10, v11, v12);
    v9 = v30;
    v10 = v31;
    v11 = v32;
    v12 = v33;

  }
LABEL_5:

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)verticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  _BOOL4 v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double MaxY;
  unint64_t v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  char v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint8_t buf[16];
  uint8_t v101[16];
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v6 = a3;
  v7 = a4;
  v8 = 0.0;
  if (UIKeyboardAutomaticIsOnScreen())
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isUndocked"))
    {
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "_inputViewIsSplit"))
    {
LABEL_13:

      goto LABEL_14;
    }
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && !objc_msgSend(v10, "isFloating"))
    {
      v17 = 0;
    }
    else
    {
      -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "inputAccessoryView");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = 1;
      if (!v16)
      {
        v23 = 0;
        goto LABEL_21;
      }
      v96 = (void *)v16;
      v97 = v15;
    }
    objc_msgSend(v6, "_window");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      v98 = v14;
      v99 = v10;
      -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "inputView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isDescendantOfView:", v21) & 1) == 0)
      {
        -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "inputAccessoryView");
        v95 = v13;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v17;
        LOBYTE(v17) = objc_msgSend(v6, "isDescendantOfView:", v24);

        v13 = v95;
        v14 = v98;
        v10 = v99;
        v23 = v96;
        v15 = v97;
        if ((v94 & 1) == 0)
          goto LABEL_22;
        goto LABEL_21;
      }

      v14 = v98;
      v10 = v99;
      if ((v17 & 1) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else if (!v17)
    {
      goto LABEL_12;
    }
    LOBYTE(v17) = 1;
    v23 = v96;
    v15 = v97;
LABEL_21:

LABEL_22:
    if ((v17 & 1) != 0)
      goto LABEL_15;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("UIKeyboardFrameEndUserInfoKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "CGRectValue");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      -[UIKeyboardSceneDelegate scene](self, "scene");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "coordinateSpace");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSceneDelegate scene](self, "scene");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "screen");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "coordinateSpace");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "convertRect:fromCoordinateSpace:", v38, v27, v29, v31, v33);
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;

      -[UIKeyboardSceneDelegate scene](self, "scene");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "coordinateSpace");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "convertRect:toCoordinateSpace:", v6, v40, v42, v44, v46);
      v50 = v49;
      v52 = v51;
      v54 = v53;
      v56 = v55;

LABEL_32:
      v103.origin.x = v50;
      v103.origin.y = v52;
      v103.size.width = v54;
      v103.size.height = v56;
      if (!CGRectIsEmpty(v103))
      {
        objc_msgSend(v6, "bounds");
        MaxY = CGRectGetMaxY(v104);
        v105.origin.x = v50;
        v105.origin.y = v52;
        v105.size.width = v54;
        v105.size.height = v56;
        v8 = fmax(MaxY - CGRectGetMinY(v105), 0.0);
      }
      goto LABEL_15;
    }
    v57 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    if (v57
      && (objc_msgSend(v6, "window"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "_isTextEffectsWindow")))
    {
      -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "visibleInputViewFrame");
      v60 = v59;
      v62 = v61;
      v64 = v63;
      v66 = v65;

    }
    else
    {
      -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "visibleFrame");
      v60 = v68;
      v62 = v69;
      v64 = v70;
      v66 = v71;

      if (!v57)
      {
LABEL_30:
        v102.origin.x = v60;
        v102.origin.y = v62;
        v102.size.width = v64;
        v102.size.height = v66;
        if (CGRectGetMinY(v102) == 0.0)
        {
          if (os_variant_has_internal_diagnostics())
          {
            __UIFaultDebugAssertLog();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v101 = 0;
              _os_log_fault_impl(&dword_185066000, v92, OS_LOG_TYPE_FAULT, "Keyboard frame should not be on top of the screen", v101, 2u);
            }

          }
          else
          {
            v90 = verticalOverlapForView_usingKeyboardInfo____s_category;
            if (!verticalOverlapForView_usingKeyboardInfo____s_category)
            {
              v90 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v90, (unint64_t *)&verticalOverlapForView_usingKeyboardInfo____s_category);
            }
            v91 = *(NSObject **)(v90 + 8);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_185066000, v91, OS_LOG_TYPE_ERROR, "Keyboard frame should not be on top of the screen", buf, 2u);
            }
          }
          goto LABEL_15;
        }
        -[UIKeyboardSceneDelegate scene](self, "scene");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "coordinateSpace");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate scene](self, "scene");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "screen");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "coordinateSpace");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "convertRect:fromCoordinateSpace:", v76, v60, v62, v64, v66);
        v78 = v77;
        v80 = v79;
        v82 = v81;
        v84 = v83;

        -[UIKeyboardSceneDelegate scene](self, "scene");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "coordinateSpace");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "convertRect:toCoordinateSpace:", v6, v78, v80, v82, v84);
        v50 = v85;
        v52 = v86;
        v54 = v87;
        v56 = v88;
        goto LABEL_32;
      }
    }

    goto LABEL_30;
  }
LABEL_16:

  return v8;
}

- (int64_t)_preferredAppearanceForResponder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  int64_t v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = 0;
    v11 = 0;
    goto LABEL_18;
  }
  v5 = v3;
  while (objc_msgSend(v5, "_isViewController"))
  {
    v6 = objc_msgSend(v5, "overrideUserInterfaceStyle");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "_containsResponder:", v4);

      if ((v9 & 1) != 0)
        goto LABEL_15;
    }
LABEL_11:
    objc_msgSend(v5, "nextResponder");
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
    if (!v11)
      goto LABEL_18;
  }
  if (!objc_msgSend(v5, "_isView"))
    goto LABEL_11;
  v7 = objc_msgSend(v5, "overrideUserInterfaceStyle");
  objc_msgSend(v5, "_localOverrideTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (objc_msgSend(v5, "_containsResponder:", v4) & 1) == 0)
  {

    goto LABEL_11;
  }

LABEL_15:
  if (v7 == 2)
    v11 = 1;
  else
    v11 = 2 * (v7 == 1);
LABEL_18:

  return v11;
}

void __82__UIKeyboardSceneDelegate__scene_willTransitionToActivationState_withReasonsMask___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_supportsPencil");

  if (v3)
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "containerWindow");
}

+ (void)initialize
{
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_198);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    +[UIScene _registerSceneComponentClass:withKey:predicate:](UIScene, "_registerSceneComponentClass:withKey:predicate:", a1, CFSTR("_UIKeyboardSceneDelegateSceneComponentKey"), v3);

  }
}

+ (void)_pinInputViewsForKeyboardSceneDelegate:(id)a3 onBehalfOfResponder:(id)a4 duringBlock:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void (*v9)(void);
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v11 && v7)
  {
    v8 = (void (**)(_QWORD))a5;
    objc_msgSend(v11, "_beginPinningInputViewsOnBehalfOfResponder:", v7);
    v8[2](v8);

    objc_msgSend(v11, "_stopPinningInputViewsOnBehalfOfResponder:", v7);
  }
  else
  {
    v9 = (void (*)(void))*((_QWORD *)a5 + 2);
    v10 = a5;
    v9();

  }
}

- (void)_stopPinningInputViewsOnBehalfOfResponder:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIInputViewPostPinningReloadState *postPinningReloadState;
  void *v9;
  void *v10;
  _BOOL4 v11;
  UIInputViewPostPinningReloadState *v12;
  id v13;

  v13 = a3;
  v4 = -[NSMutableSet count](self->_pinningResponders, "count");
  v5 = v13;
  if (v4)
  {
    -[NSMutableSet removeObject:](self->_pinningResponders, "removeObject:", v13);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardSceneDelegate:stoppedPinningInputViewsOnBehalfOfResponder:", self, v13);

    v7 = -[NSMutableSet count](self->_pinningResponders, "count");
    v5 = v13;
    if (!v7)
    {
      postPinningReloadState = self->_postPinningReloadState;
      if (postPinningReloadState)
      {
        -[UIInputViewPostPinningReloadState responderToReload](postPinningReloadState, "responderToReload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate waitingForInputUI](self, "waitingForInputUI");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[UIKeyboardSceneDelegate clearWaitingForInputUIIfNeeded](self, "clearWaitingForInputUIIfNeeded");
        -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:](self, "_reloadInputViewsForResponder:", v9);
        if (v11 && v10)
          -[UIKeyboardSceneDelegate setWaitingForInputUI:](self, "setWaitingForInputUI:", v10);
        v12 = self->_postPinningReloadState;
        self->_postPinningReloadState = 0;

        v5 = v13;
      }
    }
  }

}

- (void)_beginPinningInputViewsOnBehalfOfResponder:(id)a3
{
  NSMutableSet *pinningResponders;
  id v5;
  id v6;

  pinningResponders = self->_pinningResponders;
  v5 = a3;
  -[NSMutableSet addObject:](pinningResponders, "addObject:", v5);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyboardSceneDelegate:startedPinningInputViewsOnBehalfOfResponder:", self, v5);

}

uint64_t __37__UIKeyboardSceneDelegate_initialize__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "role");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3 == CFSTR("UIWindowSceneSessionRoleExternalDisplayNonInteractive"))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "role");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("CHWindowSceneSessionRoleAvocado")) ^ 1;

  }
  return v5;
}

- (id)_delegateAsResponder
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateAsResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sessionIdentifier
{
  void *v2;
  void *v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sessionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setWindowSceneInputViews:(id)a3 animationStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v26 = a3;
  v6 = a4;
  objc_msgSend(v26, "refreshPresentation");
  -[UIKeyboardSceneDelegate updateRenderConfigForCurrentResponder](self, "updateRenderConfigForCurrentResponder");
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:](self, "setTextEffectsWindowLevelForInputView:responder:", v26, v7);

  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", v13, 0x1E1764C40, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v15, sel_applicationWindowRotated_, 0x1E1764C40, 0);

  }
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "keyboardVisible");

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v26, "inputView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "inputAccessoryView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "inputAssistantView");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v18 || v20 || v17)
  {
    +[_UIRemoteKeyboardPlaceholderView placeholderWithWidthSizer:heightWithScene:](_UIRemoteKeyboardPlaceholderView, "placeholderWithWidthSizer:heightWithScene:", &__block_literal_global_568, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v22, "setFallbackView:", v18);
  objc_msgSend(v22, "setAssociatedView:", v21);
  +[UIInputViewSet inputSetWithInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithInputView:accessoryView:assistantView:", v22, v19, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "inheritNullState:", v26);
  objc_msgSend(v23, "setIsCustomInputView:", objc_msgSend(v26, "isCustomInputView"));
  objc_msgSend(v23, "setIsRemoteKeyboard:", objc_msgSend(v26, "isRemoteKeyboard"));
  objc_msgSend(v23, "setShouldShowDockView:", objc_msgSend(v26, "shouldShowDockView"));
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__UIKeyboardSceneDelegate_setWindowSceneInputViews_animationStyle___block_invoke_2;
  v27[3] = &unk_1E16B1B50;
  v28 = v8;
  v29 = v23;
  v24 = v23;
  v25 = v8;
  objc_msgSend(v25, "performOperations:withAnimationStyle:", v27, v6);

}

- (void)setTextEffectsWindowLevelForInputView:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id *v15;
  void *v16;
  char v17;
  id *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id *WeakRetained;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *log;
  void *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasNonPlaceholderViews") & 1) != 0
    || +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    && !objc_msgSend(v6, "isEmpty")
    || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v8, "hasWindowHostingCallerID:", v9), v9, v8, v10))
  {
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
      || (objc_msgSend(v6, "hasNonPlaceholderViews") & 1) != 0)
    {
      goto LABEL_13;
    }
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasAnyHostedViews"))
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "handlingRemoteEvent") & 1) != 0)
      {
        +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "handlingViewServiceEvent");

        if ((v14 & 1) == 0)
          goto LABEL_34;
LABEL_13:
        objc_msgSend(v7, "_responderWindow");
        v15 = (id *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "_isHostedInAnotherProcess");

        if ((v17 & 1) != 0)
        {
LABEL_33:

          goto LABEL_34;
        }
        if (!v15
          || (-[UIKeyboardSceneDelegate containerWindow](self, "containerWindow"),
              v18 = (id *)objc_claimAutoreleasedReturnValue(),
              v18,
              v15 == v18))
        {
          -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "inputAccessoryView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "_responderWindow");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31 == v32)
          {
            -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "_restoreWindowLevel");

          }
          goto LABEL_33;
        }
        objc_msgSend(v15, "level");
        v20 = v19;
        objc_msgSend(v15[101], "_FBSScene");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "settings");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "level");
        v24 = v23;

        objc_opt_class();
        -[UIKeyboardSceneDelegate containerWindowForViewService:](self, "containerWindowForViewService:", objc_opt_isKindOfClass() & 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "_setWindowLevel:", v20 + 1.0);

        objc_msgSend(v15, "_addWindowLevelChangedObserver:", self);
        objc_msgSend(v15, "windowScene");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "_isKeyWindowScene");

        objc_msgSend(v15, "windowScene");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "_isKeyWindowScene"))
        {

          goto LABEL_22;
        }
        WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_keyWindowCandidate);

        if (v15 == WeakRetained)
        {
          v27 = 1;
          if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
          {
            +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIRemoteKeyboards performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:](v35, self);
            goto LABEL_28;
          }
          if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
          {
            -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:](v35, self);
LABEL_28:

            goto LABEL_29;
          }
        }
LABEL_22:
        if ((v27 & 1) == 0)
          goto LABEL_33;
LABEL_29:
        v36 = setTextEffectsWindowLevelForInputView_responder____s_category;
        if (!setTextEffectsWindowLevelForInputView_responder____s_category)
        {
          v36 = __UILogCategoryGetNode("KeyboardFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v36, (unint64_t *)&setTextEffectsWindowLevelForInputView_responder____s_category);
        }
        if ((*(_BYTE *)v36 & 1) != 0)
        {
          v37 = *(NSObject **)(v36 + 8);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            log = v37;
            v46 = (void *)objc_opt_class();
            v52 = v46;
            +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)objc_opt_class();
            v51 = v45;
            +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
            v39 = (void *)objc_opt_class();
            v48 = v39;
            v40 = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
            -[UIKeyboardSceneDelegate _scene](self, "_scene");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardSceneDelegate _scene](self, "_scene");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "_FBSScene");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "identityToken");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136317186;
            v54 = "-[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:]";
            v55 = 2112;
            v56 = v46;
            v57 = 2048;
            v58 = v15;
            v59 = 2112;
            v60 = v45;
            v61 = 2048;
            v62 = v38;
            v63 = 2112;
            v64 = v39;
            v65 = 2048;
            v66 = v40;
            v67 = 2048;
            v68 = v41;
            v69 = 2112;
            v70 = v43;
            _os_log_impl(&dword_185066000, log, OS_LOG_TYPE_ERROR, "%s: Updating required scene for responderWindow: <%@: %p>; keyWindow: <%@: %p>; keyWindowCandidate: <%@: %"
              "p>; windowScene: %p; scene identity: %@",
              buf,
              0x5Cu);

          }
        }
        -[UIKeyboardSceneDelegate setWindowLevel:sceneLevel:forResponder:](self, "setWindowLevel:sceneLevel:forResponder:", v7, v20 + 2.0, v24 + 2.0);
        goto LABEL_33;
      }

    }
    goto LABEL_13;
  }
LABEL_34:

}

double __67__UIKeyboardSceneDelegate_setWindowSceneInputViews_animationStyle___block_invoke()
{
  double result;
  void *v1;
  double v2;
  double v3;

  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bounds");
    v3 = v2;

    return v3;
  }
  return result;
}

- (void)setWindowLevel:(double)a3 sceneLevel:(double)a4 forResponder:(id)a5
{
  void *v8;
  id v9;

  v9 = a5;
  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWindowLevel:sceneLevel:forResponder:", v9, a3 + 2.0, a4 + 2.0);
    goto LABEL_5;
  }
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:](v8, self);
    objc_msgSend(v8, "updateWindowState");
LABEL_5:

  }
}

- (UIInputViewSet)transientInputViews
{
  return self->_transientInputViewSet;
}

- (unint64_t)deactivationCount
{
  return self->_deactivationCount;
}

- (BOOL)isKeyboardOnEmbeddedScreen
{
  void *v2;
  void *v3;
  char v4;

  -[UIKeyboardSceneDelegate scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isEmbeddedScreen");

  return v4;
}

- (BOOL)_keepInputSession
{
  _BOOL4 v2;
  void *v4;
  BOOL v5;

  if (self->_keepInputSession)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
    if (v2)
    {
      -[UIKeyboardSceneDelegate responder](self, "responder");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[UIKeyboardSceneDelegate _isPinningInputViewsOnBehalfOfResponder:](self, "_isPinningInputViewsOnBehalfOfResponder:", v4);

      LOBYTE(v2) = v5;
    }
  }
  return v2;
}

- (BOOL)_hasPostPinningReloadState
{
  void *v2;
  BOOL v3;

  -[UIInputViewPostPinningReloadState responderToReload](self->_postPinningReloadState, "responderToReload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_textInputSessionAnalytics
{
  return self->_sessionAnalytics;
}

- (id)requestAnimationAssertionWithDirection:(int)a3
{
  return -[UIKeyboardSceneDelegate requestAnimationAssertionWithDirection:animated:](self, "requestAnimationAssertionWithDirection:animated:", *(_QWORD *)&a3, 1);
}

- (id)requestAnimationAssertionWithDirection:(int)a3 animated:(BOOL)a4
{
  return +[_UIInputViewAnimationAssertion _assertionWithDirection:animated:sceneDelegate:](_UIInputViewAnimationAssertion, "_assertionWithDirection:animated:sceneDelegate:", *(_QWORD *)&a3, a4, self);
}

- (void)inputModeChangedForRenderConfig:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  if (pthread_main_np())
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_inheritedRenderConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardSceneDelegate responder](self, "responder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSceneDelegate _renderConfigForResponder:](self, "_renderConfigForResponder:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v8, "backdropStyle");
      if (v11 != objc_msgSend(v10, "backdropStyle"))
        -[UIKeyboardSceneDelegate updateRenderConfigForCurrentResponder](self, "updateRenderConfigForCurrentResponder");

    }
  }
  else
  {
    -[UIKeyboardSceneDelegate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, v12, 0);
  }

}

- (void)keyboardSceneDelegateWillResume:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
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
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  UIResponder *v23;
  UIResponder *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v29 = a3;
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_isKeyWindowScene");

  if (!v6)
    goto LABEL_17;
  +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
  }
  else
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "_requiresKeyboardWhenFirstResponder");

    if (!v11)
      goto LABEL_10;
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_keyboardResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v13);

    objc_msgSend(v7, "geometryDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGeometryDelegate:", v15);

    }
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_compatibilityController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "willResume:", v29);
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentInputMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInputMode:", v19);

  }
LABEL_10:
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v4 = (void *)v20;
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
LABEL_16:

      goto LABEL_17;
    }
    v22 = (void *)v21;
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v23 = (UIResponder *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23 != self->_responderWithoutAutomaticAppearanceEnabled)
    {

      goto LABEL_16;
    }
    +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "inputView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 != v27)
    {
      -[UIKeyboardSceneDelegate responder](self, "responder");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:](self, "_reloadInputViewsForResponder:", v28);

      +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updateLayout");
      goto LABEL_16;
    }
  }
LABEL_17:

}

- (BOOL)_restoreInputViewsWithId:(id)a3 animated:(BOOL)a4
{
  id v6;
  NSMutableDictionary *preservedViewSets;
  void *v8;
  NSMutableSet *keysBeingRestored;
  NSMutableSet *v10;
  NSMutableSet *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  char v59;
  char v60;
  void *v61;
  int v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  _BOOL4 v81;
  BOOL v82;
  void *v83;
  void *v84;

  v6 = a3;
  preservedViewSets = self->_preservedViewSets;
  if (preservedViewSets && -[NSMutableDictionary count](preservedViewSets, "count"))
  {
    -[NSMutableDictionary objectForKey:](self->_preservedViewSets, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (-[NSMutableSet containsObject:](self->_keysBeingRestored, "containsObject:", v6) & 1) == 0)
    {
      keysBeingRestored = self->_keysBeingRestored;
      if (!keysBeingRestored)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
        v10 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v11 = self->_keysBeingRestored;
        self->_keysBeingRestored = v10;

        keysBeingRestored = self->_keysBeingRestored;
      }
      -[NSMutableSet addObject:](keysBeingRestored, "addObject:", v6);
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12
        || (v13 = (void *)v12,
            +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v15 = objc_msgSend(v14, "shouldAllowInputViewsRestoredForId:", v6), v14, v13, (v15 & 1) != 0))
      {
        if (!a4)
          -[UIKeyboardSceneDelegate _beginDisablingAnimations](self, "_beginDisablingAnimations");
        objc_msgSend(v8, "accessoryViewNextResponder");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "inputAccessoryView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "accessoryViewNextResponder");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_overrideInputAccessoryViewNextResponderWithResponder:", v18);

        }
        objc_msgSend(v8, "restorableRenderConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardSceneDelegate setRestorableRenderConfig:](self, "setRestorableRenderConfig:", v19);

        if (objc_msgSend((id)UIApp, "_isSpringBoard"))
        {
          objc_msgSend(v8, "keyboard");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "updateLayout");

          }
        }
        objc_msgSend(v8, "restorableResponder");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = 1;
        }
        else
        {
          -[UIKeyboardSceneDelegate responder](self, "responder");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "inputView");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            v23 = objc_msgSend(v8, "isCustomInputView");
          else
            v23 = 1;

        }
        if ((objc_msgSend(v8, "restoreUsingBecomeFirstResponder") & 1) != 0)
        {
          v30 = 0;
          v31 = 0;
          goto LABEL_29;
        }
        v30 = 0;
        if ((objc_msgSend(v8, "isEmpty") & 1) != 0)
        {
          v31 = 0;
          goto LABEL_29;
        }
        v31 = 0;
        if (((v23 ^ 1) & 1) != 0)
          goto LABEL_29;
        -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "isTransitioning");

        if (v45)
        {
          -[UIKeyboardSceneDelegate responder](self, "responder");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            -[UIKeyboardSceneDelegate responder](self, "responder");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardSceneDelegate _inputViewsForResponder:](self, "_inputViewsForResponder:", v47);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_76:
            -[UIKeyboardSceneDelegate responder](self, "responder");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "restorableResponder");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "inputAccessoryView");
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (v73)
            {
              objc_opt_self();
              ++__disablePromoteDescendantToFirstResponderCount;
            }
            -[UIKeyboardSceneDelegate setTakingSnapshot:](self, "setTakingSnapshot:", 0);
            -[UIKeyboardSceneDelegate setRestoringInputViews:](self, "setRestoringInputViews:", 1);
            if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
            {
              self->_restoringInputViewsAndWaitingForInputUI = 1;
              -[UIKeyboardSceneDelegate setInputViews:animated:](self, "setInputViews:animated:", v8, 0);
            }
            else
            {
              -[UIKeyboardSceneDelegate setInputViews:](self, "setInputViews:", v8);
            }
            -[UIKeyboardSceneDelegate setRestoringInputViews:](self, "setRestoringInputViews:", 0);
            if (v73)
            {
              objc_opt_self();
              if (__disablePromoteDescendantToFirstResponderCount)
                --__disablePromoteDescendantToFirstResponderCount;
            }
            objc_msgSend(v8, "accessoryViewNextResponder");
            v74 = objc_claimAutoreleasedReturnValue();
            if (v74)
            {
              v75 = (void *)v74;
              objc_msgSend(v8, "inputAccessoryView");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "_nextResponderOverride");
              v77 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v77)
              {
                objc_msgSend(v8, "inputAccessoryView");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "accessoryViewNextResponder");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "_overrideInputAccessoryViewNextResponderWithResponder:", v79);

              }
            }
LABEL_29:
            objc_msgSend(v8, "accessoryViewNextResponder");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v32)
              objc_msgSend(v8, "setAccessoryViewNextResponder:", 0);
            objc_msgSend(v8, "restorableResponder");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
              goto LABEL_63;
            objc_msgSend(v8, "restorableResponder");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            v84 = v31;
            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v8, "restorableResponder");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v36, "clearsOnBeginEditing") & 1) != 0)
              {
LABEL_36:
                objc_msgSend(v36, "setClearsOnBeginEditing:", 0);
                objc_msgSend(v8, "restorableResponder");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "_restoreFirstResponder");

                objc_msgSend(v36, "setClearsOnBeginEditing:", 1);
                v82 = -[UIKeyboardSceneDelegate _restoreMultiDocumentTokenIfNecessary:withId:](self, "_restoreMultiDocumentTokenIfNecessary:withId:", v8, v6);
                objc_msgSend(v8, "restorableResponder");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "_responderWindow");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (v40 == v41)
                {
                  v81 = 0;
                }
                else
                {
                  -[UIKeyboardSceneDelegate responder](self, "responder");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "restorableResponder");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v81 = v42 != v43;

                }
                v48 = v38;
                objc_msgSend(v8, "restorableResponder");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKeyboardSceneDelegate _inputViewsForResponder:](self, "_inputViewsForResponder:", v49);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = objc_msgSend(v50, "isEqual:", v8);

                -[UIKeyboardSceneDelegate responder](self, "responder");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "inputView");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = v30;
                if (v52)
                {
                  v53 = 1;
                }
                else
                {
                  -[UIKeyboardSceneDelegate responder](self, "responder");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "inputViewController");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = v55 != 0;

                }
                -[UIKeyboardSceneDelegate responder](self, "responder");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "restorableResponder");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                if (v56 == v57)
                {
                  v58 = 0;
                  if (((objc_msgSend(v8, "isEmpty") | v81) & 1) == 0 && ((v80 ^ 1) & 1) == 0)
                    v58 = v53 == objc_msgSend(v8, "isCustomInputView");
                }
                else
                {
                  v58 = 0;
                }

                v59 = v48;
                v60 = v48 ^ 1 | v82;
                v31 = v84;
                if ((v60 & 1) != 0
                  || v58
                  || (objc_msgSend(v8, "restorableResponder"),
                      v61 = (void *)objc_claimAutoreleasedReturnValue(),
                      v62 = objc_msgSend(v61, "isFirstResponder"),
                      v61,
                      !v62))
                {
                  v30 = v83;
                  if (v83)
                    v64 = v59;
                  else
                    v64 = 1;
                  if ((v64 & 1) == 0)
                  {
                    -[UIKeyboardSceneDelegate responder](self, "responder");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v84 == v65)
                      -[UIKeyboardSceneDelegate setInputViews:](self, "setInputViews:", v83);
                  }
                }
                else
                {
                  objc_msgSend(v8, "restorableResponder");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:](self, "_reloadInputViewsForResponder:", v63);

                  v30 = v83;
                }
                -[UIKeyboardSceneDelegate _updateVisibilityObserversWithReset:](self, "_updateVisibilityObserversWithReset:", 0);

LABEL_63:
                -[UIKeyboardSceneDelegate setTakingSnapshot:](self, "setTakingSnapshot:", 0);

                -[UIKeyboardSceneDelegate responder](self, "responder");
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v66)
                {
                  objc_msgSend(v8, "restorableResponder");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "_clearBecomeFirstResponderWhenCapable");

                  +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  -[UIKeyboardSceneDelegate setInputViews:](self, "setInputViews:", v68);

                }
                objc_msgSend(v8, "setRestorableResponder:", 0);
                objc_msgSend(v8, "setRestorableRenderConfig:", 0);
                -[UIKeyboardSceneDelegate setRestorableRenderConfig:](self, "setRestorableRenderConfig:", 0);
                -[NSMutableDictionary removeObjectForKey:](self->_preservedViewSets, "removeObjectForKey:", v6);
                if (!a4)
                  -[UIKeyboardSceneDelegate _endDisablingAnimations](self, "_endDisablingAnimations");
                -[NSMutableSet removeObject:](self->_keysBeingRestored, "removeObject:", v6);

                v24 = 1;
                goto LABEL_68;
              }

            }
            v36 = 0;
            goto LABEL_36;
          }
          +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
          v71 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v70)
          {
            +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = 0;
            goto LABEL_76;
          }
          v71 = v70;
          v46 = v71;
        }
        v30 = v71;
        goto LABEL_76;
      }
      objc_msgSend(v8, "restorableResponder");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isFirstResponder");

      if (v26)
      {
        objc_msgSend(v8, "restorableResponder");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "resignFirstResponder");

      }
      -[NSMutableSet removeObject:](self->_keysBeingRestored, "removeObject:", v6);
    }
    v24 = 0;
LABEL_68:

    goto LABEL_69;
  }
  v24 = 0;
LABEL_69:

  return v24;
}

- (UITextFormattingCoordinator)textFormattingCoordinator
{
  return self->_textFormattingCoordinator;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = CFSTR("UIWindowDidRotateNotification");
  v8[1] = 0x1E1764C40;
  v8[2] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v8[3] = CFSTR("UITextInputCurrentInputModeDidChangeNotification");
  v8[4] = CFSTR("UIWindowDidBecomeKeyNotification");
  v8[5] = CFSTR("UIWindowFirstResponderDidChangeNotification");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushDelayedTasksForKey:", v6);

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardSceneDelegate;
  -[UIKeyboardSceneDelegate dealloc](&v7, sel_dealloc);
}

+ (id)applicationConnectedWindowScenes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)UIApp, "connectedScenes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

+ (void)setInterfaceOrientation:(int64_t)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (__interfaceOrientation != a3)
  {
    _UIKeyboardSceneDelegateLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      +[UIApplication stringForInterfaceOrientation:](UIApplication, "stringForInterfaceOrientation:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Interface Orientation: Setting cached interface orientation to: %@", (uint8_t *)&v6, 0xCu);

    }
    __interfaceOrientation = a3;
  }
}

- (void)cleanDeactivation
{
  unint64_t i;
  void *v4;
  void *v5;

  for (i = self->_deactivationCount; i; --i)
  {
    +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeactivatedKeyboard:forScene:", 0, v5);

  }
}

- (BOOL)deactivated
{
  return self->_deactivationCount != 0;
}

- (void)setUseHostedInstance:(BOOL)a3
{
  unint64_t hostedUseCount;
  unint64_t v4;

  hostedUseCount = self->_hostedUseCount;
  if (a3)
    v4 = hostedUseCount + 1;
  else
    v4 = hostedUseCount - 1;
  self->_hostedUseCount = v4;
}

- (void)updateLightEffectsBackdropAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[UIKeyboardSceneDelegate keyboardWindow](self, "keyboardWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "hosting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateCombinedBackdropViewAnimated:forKeyboardUp:", v3, -[UIKeyboardSceneDelegate showingKeyboard](self, "showingKeyboard"));
  }
  else
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hosting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCombinedBackdropViewAnimated:forKeyboardUp:", v3, -[UIKeyboardSceneDelegate showingKeyboard](self, "showingKeyboard"));

  }
}

- (BOOL)hasNullInputView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate transientInputViews](self, "transientInputViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = objc_msgSend(v4, "isNullInputView");

  return v6;
}

- (BOOL)automaticAppearanceInternalEnabled
{
  return self->_automaticAppearanceEnabledInternal;
}

- (CGRect)frameForLayoutGuideInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double x;
  double v8;
  double y;
  double v10;
  double width;
  double v12;
  double height;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect v38;
  CGRect v39;
  CGRect result;
  CGRect v41;

  v4 = a3;
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleFrame");
  x = v6;
  y = v8;
  width = v10;
  height = v12;

  if (v4)
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinateSpace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateSpace");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", v18, x, y, width, height);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(v4, "frame");
    v41.origin.x = v27;
    v41.origin.y = v28;
    v41.size.width = v29;
    v41.size.height = v30;
    v38.origin.x = v20;
    v38.origin.y = v22;
    v38.size.width = v24;
    v38.size.height = v26;
    v39 = CGRectIntersection(v38, v41);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    if (CGRectIsEmpty(v39))
    {
      objc_msgSend(v4, "bounds");
      width = v31;
      objc_msgSend(v4, "window");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "insetForDismissedKeyboardGuide");
      height = v33;

      y = 0.0;
      x = 0.0;
    }
  }

  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGRect)visibleInputViewFrameInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIKeyboardSceneDelegate *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v4 = a3;
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUndocked"))
  {

LABEL_4:
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_5;
  }
  +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "activeKeyboardSceneDelegate");
  v7 = (UIKeyboardSceneDelegate *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "remoteKeyboardUndocked:", v7 != self);

  if (v8)
    goto LABEL_4;
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visibleInputViewFrame");
  v9 = v18;
  v10 = v19;
  v11 = v20;
  v12 = v21;

  objc_msgSend(v4, "window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_window");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "screen");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "coordinateSpace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "windowScene");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "coordinateSpace");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertRect:toCoordinateSpace:", v29, v9, v10, v11, v12);
    v9 = v30;
    v10 = v31;
    v11 = v32;
    v12 = v33;

  }
LABEL_5:

  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)hasDictationKeyboard
{
  void *v2;
  void *v3;
  char isKindOfClass;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)keyboardArbiterClient
{
  return +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
}

- (id)remoteInputViewHost
{
  return self->_remoteInputViewHost;
}

- (void)updateRemoteKeyboardChanged:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_visibilityObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v10, "remoteKeyboardChanged:", v4);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = objc_msgSend(v4, "keyboardOnScreen", (_QWORD)v13);
          objc_msgSend(v4, "sourceBundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "remoteKeyboardVisibilityDidChange:bundleId:", v11, v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)prepareForAlongsideTransitionWithContext:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "animateAlongsideTransitionInView:animation:completion:", v4, &__block_literal_global_491, &__block_literal_global_491);

  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled"))
  {
    -[UIKeyboardSceneDelegate scene](self, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isKeyWindowScene");

    if (v6)
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "keyboardActive"))
      {
        objc_msgSend(v7, "keyboardWindow");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "animateAlongsideTransitionInView:animation:completion:", v8, &__block_literal_global_491, &__block_literal_global_491);

      }
    }
  }

}

- (void)setNextAutomaticOrderInDirection:(int)a3 duration:(double)a4
{
  self->_hasCustomAnimationProperties = 1;
  self->_nextAutomaticOrderInDirection = a3;
  self->_nextAutomaticOrderInDuration = a4;
}

- (void)popOrRemoveAnimationStyle:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray count](self->_animationStyleStack, "count"))
    -[NSMutableArray removeObject:](self->_animationStyleStack, "removeObject:", v4);

}

- (void)clearAnimationStyleForUserDrivenPresentation
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *animationStyleStack;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray indexesOfObjectsPassingTest:](self->_animationStyleStack, "indexesOfObjectsPassingTest:", &__block_literal_global_494_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_animationStyleStack, "count") && !objc_msgSend(v3, "count"))
  {
    _UIKeyboardSceneDelegateLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[NSMutableArray description](self->_animationStyleStack, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Animation styles expected to be empty on user driven presentation. Actually contains: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[NSMutableArray objectsAtIndexes:](self->_animationStyleStack, "objectsAtIndexes:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
  animationStyleStack = self->_animationStyleStack;
  self->_animationStyleStack = v6;

}

uint64_t __71__UIKeyboardSceneDelegate_clearAnimationStyleForUserDrivenPresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forAssertion");
}

- (void)createAutomaticKeyboardIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled"))
    {
      +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "_keyboardOrientation");

      +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "interfaceOrientation");

      if (v7 != v5)
      {
        +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setOrientation:", v5);

      }
    }
  }
  else
  {
    v8 = +[UIKeyboardAutomatic sharedInstance](UIKeyboardAutomatic, "sharedInstance");
  }
}

- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_responderWindow");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
    -[UIKeyboardSceneDelegate _updateContainerWindowLevel](self, "_updateContainerWindowLevel");
}

- (void)_updateContainerWindowLevel
{
  void *v3;
  id v4;

  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:](self, "setTextEffectsWindowLevelForInputView:responder:", v4, v3);

}

- (void)traitCollectionDidChange
{
  id v2;

  -[UIKeyboardSceneDelegate updateRenderConfigForCurrentResponder](self, "updateRenderConfigForCurrentResponder");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollectionDidChange");

}

- (id)passthroughViews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[UIInputViewSet inputViewController](self->_inputViewSet, "inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    -[UIInputViewSet inputView](self->_inputViewSet, "inputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return MEMORY[0x1E0C9AA60];
  }
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setReloadInputViewsForcedIsAllowed:(BOOL)a3
{
  self->_reloadInputViewsForcedIsAllowed = a3;
}

- (void)keyboardUIDidChange
{
  BOOL reloadInputViewsForcedIsAllowed;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;

  reloadInputViewsForcedIsAllowed = self->_reloadInputViewsForcedIsAllowed;
  self->_reloadInputViewsForcedIsAllowed = 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDelegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_responderWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)v6, "_userInterfaceIdiom");

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "resigningFirstResponder");

  if ((v6 & 1) == 0 && v7 != 3)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("autofillsignup")) & 1) != 0)
    {
      v12 = -[UIRemoteInputViewHost shouldShowDockView](self->_remoteInputViewHost, "shouldShowDockView");

      if (v12)
        goto LABEL_8;
    }
    else
    {

    }
    -[UIKeyboardSceneDelegate forceReloadInputViews](self, "forceReloadInputViews");
  }
LABEL_8:
  self->_reloadInputViewsForcedIsAllowed = reloadInputViewsForcedIsAllowed;

}

- (BOOL)isWaitingForInputUI:(id)a3
{
  id v4;
  NSUUID *waitingForInputUI;
  char v6;

  v4 = a3;
  if (v4 && (waitingForInputUI = self->_waitingForInputUI) != 0)
    v6 = -[NSUUID isEqual:](waitingForInputUI, "isEqual:", v4);
  else
    v6 = 0;

  return v6;
}

- (id)waitingForInputUI
{
  return self->_waitingForInputUI;
}

- (void)setWaitingForInputUI:(id)a3
{
  objc_storeStrong((id *)&self->_waitingForInputUI, a3);
}

- (void)addPostWaitingForInputUIBlock:(id)a3
{
  NSMutableArray *postWaitingForInputUIBlocks;
  id v4;

  postWaitingForInputUIBlocks = self->_postWaitingForInputUIBlocks;
  v4 = _Block_copy(a3);
  -[NSMutableArray addObject:](postWaitingForInputUIBlocks, "addObject:", v4);

}

- (id)_simpleViewDescriptionForLogging:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  CGRect v16;
  CGRect v17;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    NSStringFromCGRect(v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p; frame = %@>"), v6, v3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v13;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v3, "frame");
    NSStringFromCGRect(v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p; frame = %@; alpha = %f; isHidden = %d; tAMIC = %d>"),
      v6,
      v3,
      v7,
      v14,
      objc_msgSend(v3, "isHidden"),
      objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v9;
}

- (id)remoteHostInputViewSet:(id)a3
{
  UIInputViewSet *v4;
  void *v5;
  UIInputViewSet *transientInputViewSet;
  UIInputViewSet *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (UIInputViewSet *)a3;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (-[UIRemoteInputViewHost shouldShowDockView](self->_remoteInputViewHost, "shouldShowDockView"))
    {
      -[UIRemoteInputViewHost inputViewSet](self->_remoteInputViewHost, "inputViewSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v4)
      {
        transientInputViewSet = self->_transientInputViewSet;
        if (transientInputViewSet)
        {
          v7 = transientInputViewSet;
        }
        else
        {
          -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
          v7 = (UIInputViewSet *)objc_claimAutoreleasedReturnValue();
        }
        v4 = v7;
      }
      +[UIKeyboardAutomatic activeInstance](UIKeyboardAutomatic, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[UICompatibilityInputViewController deferredInputModeControllerWithKeyboard:](UICompatibilityInputViewController, "deferredInputModeControllerWithKeyboard:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentInputMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setInputMode:", v11);

      objc_msgSend(v9, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet inputAccessoryView](v4, "inputAccessoryView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputViewSet inputAssistantView](v4, "inputAssistantView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInputViewSet inputSetWithPlaceholderAndCustomInputView:accessoryView:assistantView:](UIInputViewSet, "inputSetWithPlaceholderAndCustomInputView:accessoryView:assistantView:", v12, v13, v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setInputViewController:", v9);
      objc_msgSend(v5, "setIsCustomInputView:", 1);
      -[UIRemoteInputViewHost setInputViewSet:](self->_remoteInputViewHost, "setInputViewSet:", v5);
      -[UIRemoteInputViewHost setShouldShowDockView:](self->_remoteInputViewHost, "setShouldShowDockView:", 1);

    }
    -[UIRemoteInputViewHost updateInputViewsIfNecessary](self->_remoteInputViewHost, "updateInputViewsIfNecessary");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_525(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    keyboardui_system_get_log_STAGING();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v3, OS_SIGNPOST_INTERVAL_END, v4, "keyboardUIBringup", ", (uint8_t *)&v15, 2u);
    }

    _UIKeyboardSceneDelegateLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 134217984;
      v16 = v14;
      _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "END keyboard bringup signpost (keyboard task queue empty); ID:%llu",
        (uint8_t *)&v15,
        0xCu);
    }

  }
  else
  {
    v6 = mach_absolute_time();
    kdebug_trace();
    kac_get_log();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, 0);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v7, OS_SIGNPOST_INTERVAL_END, v9, "appBringup", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
      }
    }

    _UIKeyboardSceneDelegateLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_debug_impl(&dword_185066000, v10, OS_LOG_TYPE_DEBUG, "END app bringup signpost (keyboard task queue empty)", (uint8_t *)&v15, 2u);
    }

    +[_UIKeyboardDiagnosticCollection _requestTailspinWithDescription:startMAT:endMAT:ifExceedsThresholdSec:](_UIKeyboardDiagnosticCollection, "_requestTailspinWithDescription:startMAT:endMAT:ifExceedsThresholdSec:", CFSTR("KeyboardBringupLatency"), qword_1ECD7D940, v6, 0.3);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  _MergedGlobals_1033 = 0;
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_535(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "setInputViews:", *(_QWORD *)(a1 + 40));
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearKeyboardWindowSnapshot");

}

- (void)setPreservedKeyboardWindowSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_preservedKeyboardWindowSnapshot, a3);
}

- (UIView)preservedKeyboardWindowSnapshot
{
  return self->_preservedKeyboardWindowSnapshot;
}

- (void)loadLocalKeyboardForHost:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  self->_loadingLocalKeyboard = 1;
  v4 = a3;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate _inputViewsForResponder:](self, "_inputViewsForResponder:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeToInputViewSet:", v6);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recomputeActiveInputModesWithExtensions:", 1);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateLayout");

  self->_loadingLocalKeyboard = 0;
}

- (BOOL)loadingLocalKeyboard
{
  return self->_loadingLocalKeyboard;
}

- (id)_inputViewsForResponder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIKeyboardSceneDelegate _inputViewsForResponder:withAutomaticKeyboard:force:](self, "_inputViewsForResponder:withAutomaticKeyboard:force:", v4, -[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setHasCustomInputViewController:(BOOL)a3
{
  self->_hasCustomInputViewController = a3;
}

- (void)setShouldSuppressInputAssistantUpdates:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  if (!+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled")
    && self->_shouldSuppressInputAssistantUpdates != v3)
  {
    self->_shouldSuppressInputAssistantUpdates = v3;
    _UIKeyboardSceneDelegateLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "Start suppressing input assistant updates", buf, 2u);
      }

      -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setInputAssistantButtonItemsForResponder:", 0);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "End suppressing input assistant updates", v13, 2u);
      }

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "inputDelegateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "keyInputDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "automaticallySetCenterViewControllerBasedOnInputDelegate:", v7);

      -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardSceneDelegate responder](self, "responder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setInputAssistantButtonItemsForResponder:", v12);

    }
  }
}

- (BOOL)hasIntegratedAssistantBar
{
  void *v2;
  void *v3;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isHandwritingInputMode");
  return (char)v2;
}

uint64_t __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setKeyWindowSceneInputViews:animationStyle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

double __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_563()
{
  double result;
  void *v1;
  double v2;
  double v3;

  if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    +[UIKeyboardImpl floatingWidth](UIKeyboardImpl, "floatingWidth");
  }
  else
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bounds");
    v3 = v2;

    return v3;
  }
  return result;
}

uint64_t __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_567(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInputViewSet:", *(_QWORD *)(a1 + 40));
}

- (void)reloadPlacement
{
  void *v3;

  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate setInputViews:](self, "setInputViews:", v3);

  -[UIKeyboardSceneDelegate refreshKeyboardLayoutGuide](self, "refreshKeyboardLayoutGuide");
}

- (void)refreshKeyboardLayoutGuide
{
  id v2;

  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshKeyboardLayoutGuide");

}

- (void)performMultipleOperations:(id)a3 withAnimationStyle:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;

  v18 = a3;
  v6 = a4;
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[_UIRemoteKeyboards enabled](_UIRemoteKeyboards, "enabled")
    && objc_msgSend(v7, "_isKeyWindowScene"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke;
    v21[3] = &unk_1E16C61C0;
    v22 = v8;
    v24 = v18;
    v23 = v6;
    v10 = v8;
    objc_msgSend(v9, "performOnControllers:", v21);

LABEL_8:
    goto LABEL_9;
  }
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController", v18);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputViewSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputView");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_8;
  }
  v13 = (void *)v12;
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputViewSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isCustomInputView");

  if ((v16 & 1) == 0)
  {
    -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_3;
    v19[3] = &unk_1E16B2F48;
    v19[4] = self;
    v20 = v18;
    objc_msgSend(v17, "performOperations:withAnimationStyle:", v19, v6);

    v10 = v20;
    goto LABEL_8;
  }
LABEL_9:

}

void __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "owner");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  if (v3 && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_2;
    v6[3] = &unk_1E16B2F48;
    v8 = *(id *)(a1 + 48);
    v4 = v4;
    v7 = v4;
    objc_msgSend(v4, "performOperations:withAnimationStyle:", v6, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
LABEL_9:

}

uint64_t __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "containerRootController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)updateArbiterClientWithKeyboardFrame:(CGRect)a3 keyboarFrameWithIAV:(CGRect)a4 isIAVRelevant:(BOOL)a5 showing:(BOOL)a6 notifyRemote:(BOOL)a7 forScene:(id)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  double height;
  double v12;
  void *v14;
  id v15;

  v8 = a7;
  v9 = a6;
  v10 = a5;
  height = a4.size.height;
  v12 = a3.size.height;
  v15 = a8;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShowing:", v9);
  }
  else
  {
    -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputDestinationDidChange:withIAVHeight:isIAVRelevant:notifyRemote:forScene:", v9, v10, v8, v15, height - v12);
  }

}

- (BOOL)showingKeyboard
{
  UIKeyboardSceneDelegate *v2;
  void *v3;

  v2 = self;
  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[UIKeyboardSceneDelegate showingKeyboardForInputViewSet:](v2, "showingKeyboardForInputViewSet:", v3);

  return (char)v2;
}

- (BOOL)showingKeyboardForInputViewSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_requiresKeyboardWhenFirstResponder"))
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_keyboardResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v4, "isCustomInputView");

  }
  else
  {
    v8 = objc_msgSend(v4, "isCustomInputView");
  }

  return v8;
}

- (id)keyboardScreen
{
  void *v2;
  void *v3;

  -[UIKeyboardSceneDelegate scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)forceCreateKeyboardWindow
{
  void *v3;
  void *v4;
  void *v5;

  -[UIKeyboardSceneDelegate keyboardWindow](self, "keyboardWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[UIKeyboardSceneDelegate _windowScene](self, "_windowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      -[UIKeyboardSceneDelegate updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:](self, "updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 1, 1, v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    else
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 1, 1, v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

    }
  }
  return -[UIKeyboardSceneDelegate keyboardWindow](self, "keyboardWindow");
}

- (void)destroyKeyboardWindowIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;

  +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate _windowScene](self, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endPlacementForInputViewSet:windowScene:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIKeyboardSceneDelegate _showKeyboardWindowForInputViewSet:placement:windowScene:](self, "_showKeyboardWindowForInputViewSet:placement:windowScene:", v6, v5, v3);

  if (!v7)
  {
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      -[UIKeyboardSceneDelegate updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:](self, "updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 0, 1, v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    else
    {
      +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 0, 1, v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v8, "completeMoveKeyboardForWindow:", 0);

    }
  }

}

- (void)refreshWithLocalMinimumKeyboardHeight:(double)a3
{
  void *v5;
  int v6;
  id v7;

  -[UIKeyboardSceneDelegate scene](self, "scene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "refreshWithLocalMinimumKeyboardHeight:forScene:", v7, a3);

  if (v6)
    -[UIKeyboardSceneDelegate forceReloadInputViews](self, "forceReloadInputViews");

}

- (BOOL)minimize
{
  void *v3;

  +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[UIKeyboardSceneDelegate minimizeWithAnimationStyle:](self, "minimizeWithAnimationStyle:", v3);

  return (char)self;
}

- (BOOL)minimizeWithAnimationStyle:(id)a3
{
  return -[UIKeyboardSceneDelegate minimizeWithAnimationStyle:force:](self, "minimizeWithAnimationStyle:force:", a3, 0);
}

- (BOOL)minimizeWithAnimationStyle:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a4;
  v6 = a3;
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isTransitioning") & 1) != 0)
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate _inputViewsForResponder:](self, "_inputViewsForResponder:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[UIKeyboardSceneDelegate setKeyWindowSceneInputViews:animationStyle:](self, "setKeyWindowSceneInputViews:animationStyle:", v9, v6);
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__UIKeyboardSceneDelegate_minimizeWithAnimationStyle_force___block_invoke;
    v12[3] = &unk_1E16C61E8;
    v12[4] = self;
    -[UIKeyboardSceneDelegate performMultipleOperations:withAnimationStyle:](self, "performMultipleOperations:withAnimationStyle:", v12, v6);
  }
  if (!-[UIKeyboardSceneDelegate shouldSuppressInputAssistantUpdates](self, "shouldSuppressInputAssistantUpdates"))
  {
    -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissEmojiSearch");

  }
  return 1;
}

void __60__UIKeyboardSceneDelegate_minimizeWithAnimationStyle_force___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  __objc2_class **v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "hideSystemInputAssistantView") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "systemInputAssistantViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldBeShownForInputDelegate:inputViews:", 0, 0);

    v4 = v6 ^ 1;
  }
  objc_msgSend(v14, "inputViewSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCustomInputView");

  if ((v8 & 1) != 0)
  {
    v9 = off_1E167A9F0;
LABEL_13:
    -[__objc2_class placement](*v9, "placement");
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v13;
    goto LABEL_14;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v10 = v4;
  else
    v10 = 1;
  if (v10 != 1)
  {
    v9 = off_1E167A9A0;
    goto LABEL_13;
  }
  objc_msgSend(v14, "inputViewSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputAccessoryView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v9 = off_1E167A998;
    goto LABEL_13;
  }
LABEL_14:
  objc_msgSend(v14, "setPlacement:", v3);

}

- (BOOL)maximize
{
  return -[UIKeyboardSceneDelegate maximizeWithAnimation:](self, "maximizeWithAnimation:", 1);
}

- (BOOL)maximizeWithAnimation:(BOOL)a3
{
  void *v4;
  BOOL v5;

  if (a3)
    +[UIInputViewAnimationStyle animationStyleDefault](UIInputViewAnimationStyle, "animationStyleDefault");
  else
    +[UIInputViewAnimationStyle animationStyleImmediate](UIInputViewAnimationStyle, "animationStyleImmediate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIKeyboardSceneDelegate maximizeWithAnimationStyle:](self, "maximizeWithAnimationStyle:", v4);

  return v5;
}

- (BOOL)maximizeWithAnimationStyle:(id)a3
{
  return -[UIKeyboardSceneDelegate maximizeWithAnimationStyle:force:](self, "maximizeWithAnimationStyle:force:", a3, 0);
}

- (BOOL)maximizeWithAnimationStyle:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v4 = a4;
  v6 = a3;
  -[UIKeyboardSceneDelegate setHideSystemInputAssistantView:](self, "setHideSystemInputAssistantView:", 0);
  -[UIKeyboardSceneDelegate containerRootController](self, "containerRootController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isTransitioning") & 1) != 0)
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate _inputViewsForResponder:](self, "_inputViewsForResponder:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[UIKeyboardSceneDelegate setKeyWindowSceneInputViews:animationStyle:](self, "setKeyWindowSceneInputViews:animationStyle:", v9, v6);
  if (v4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__UIKeyboardSceneDelegate_maximizeWithAnimationStyle_force___block_invoke;
    v11[3] = &unk_1E16C61E8;
    v11[4] = self;
    -[UIKeyboardSceneDelegate performMultipleOperations:withAnimationStyle:](self, "performMultipleOperations:withAnimationStyle:", v11, v6);
  }

  return 1;
}

void __60__UIKeyboardSceneDelegate_maximizeWithAnimationStyle_force___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v7, "inputViewSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "refreshPresentation");

  }
  objc_msgSend(v7, "inputViewSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPeripheralHost endPlacementForInputViewSet:windowScene:](UIPeripheralHost, "endPlacementForInputViewSet:windowScene:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRotationAwarePlacement:", v6);
}

- (id)_placementForDeactivatedKeyboard:(BOOL)a3 currentPlacement:(id)a4 forSuppressionAssertion:(BOOL)a5 wantsAssistant:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __objc2_class *v28;
  NSObject *v29;
  _DWORD v31[2];
  __int16 v32;
  id v33;
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];

  v6 = a6;
  v7 = a5;
  v8 = a3;
  v38[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[UIKeyboardSceneDelegate nextAnimationStyle](self, "nextAnimationStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputAccessoryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 || (NSClassFromString(CFSTR("UIWebFormAccessory")), (objc_opt_isKindOfClass() & 1) != 0))
    {

    }
    else if (v13)
    {
      if (objc_msgSend(v10, "isFloatingAssistantView"))
        +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v10);
      else
        +[UIInputViewSetPlacement placement](UIInputViewSetPlacementAccessoryOnScreen, "placement");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    if (objc_msgSend(v10, "isFloating"))
    {
      objc_msgSend(v10, "subPlacements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        objc_msgSend(v10, "subPlacements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingAssistantTransition, "placementWithPlacement:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSubPlacements:", v19);

      }
      if (!v6)
      {
        +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:](UIInputViewSetPlacementInvisibleForFloatingTransition, "placementWithPlacement:", v10);
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_21:
        v27 = (void *)v20;
        goto LABEL_22;
      }
    }
    else if (!v6)
    {
      v28 = UIInputViewSetPlacementOffScreenDown;
      goto LABEL_20;
    }
    v28 = UIInputViewSetPlacementAssistantOnScreen;
LABEL_20:
    -[__objc2_class placement](v28, "placement");
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstResponder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 == v22)
      objc_msgSend(v22, "reloadInputViews");
  }
  self->_dontNeedAssistantBar = 1;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate _inputViewsForResponder:](self, "_inputViewsForResponder:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  self->_dontNeedAssistantBar = 0;
  -[UIKeyboardSceneDelegate scene](self, "scene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endPlacementForInputViewSet:windowScene:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  _UIKeyboardSceneDelegateLogger();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v31[0] = 67109890;
    v31[1] = v8;
    v32 = 2112;
    v33 = v10;
    v34 = 1024;
    v35 = v7;
    v36 = 2112;
    v37 = v27;
    _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_DEFAULT, "_placementForDeactivatedKeyboard, deactivated: %d, curPlacement: %@, forSuppressionAssertion: %d -> %@", (uint8_t *)v31, 0x22u);
  }

  return v27;
}

- (void)forceOrderInAutomaticFromDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5;
  id v7;

  v5 = *(_QWORD *)&a3;
  -[UIKeyboardSceneDelegate createAutomaticKeyboardIfNeeded](self, "createAutomaticKeyboardIfNeeded");
  +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", a4 > 0.0, v5, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setForce:", 1);
  -[UIKeyboardSceneDelegate orderInWithAnimationStyle:](self, "orderInWithAnimationStyle:", v7);

}

- (void)forceOrderOutAutomaticToDirection:(int)a3 withDuration:(double)a4
{
  id v5;

  +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", a4 > 0.0, *(_QWORD *)&a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForce:", 1);
  -[UIKeyboardSceneDelegate orderOutWithAnimationStyle:](self, "orderOutWithAnimationStyle:", v5);

}

- (void)forceOrderInAutomaticAnimated:(BOOL)a3
{
  id v4;

  -[UIKeyboardSceneDelegate nextAnimationStyle:](self, "nextAnimationStyle:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForce:", 1);
  -[UIKeyboardSceneDelegate orderInWithAnimationStyle:](self, "orderInWithAnimationStyle:", v4);

}

- (void)forceOrderOutAutomaticAnimated:(BOOL)a3
{
  id v4;

  -[UIKeyboardSceneDelegate nextAnimationStyle:](self, "nextAnimationStyle:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForce:", 1);
  -[UIKeyboardSceneDelegate orderOutWithAnimationStyle:](self, "orderOutWithAnimationStyle:", v4);

}

- (void)forceOrderOutAutomaticExceptAccessoryView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled"))
  {
    -[UIKeyboardSceneDelegate nextAnimationStyle:](self, "nextAnimationStyle:", -[UIKeyboardSceneDelegate animationsEnabled](self, "animationsEnabled"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[UIKeyboardSceneDelegate nextAnimationStyle](self, "nextAnimationStyle");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v3;
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputAccessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputAccessoryView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIInputViewSet inputSetWithInputView:accessoryView:](UIInputViewSet, "inputSetWithInputView:accessoryView:", 0, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessoryViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAccessoryViewController:", v10);

    }
    else
    {
      +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[UIKeyboardSceneDelegate setInputViews:animationStyle:](self, "setInputViews:animationStyle:", v8, v11);

  }
}

- (void)orderInWithAnimationStyle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a3;
  if (!v4)
  {
    -[UIKeyboardSceneDelegate nextAnimationStyle](self, "nextAnimationStyle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v4;
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate _inputViewsForResponder:](self, "_inputViewsForResponder:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:assistantView:](UIInputViewSet, "inputSetWithKeyboardAndAccessoryView:assistantView:", 0, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "shouldBeShownForInputDelegate:inputViews:", 0, v7) ^ 1;
    -[UIKeyboardSceneDelegate systemInputAssistantViewController](self, "systemInputAssistantViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v10);

  }
  objc_msgSend(v7, "keyboard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_15;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_12;
  -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v15 == (void *)v16)
  {

    goto LABEL_12;
  }
  v17 = (void *)v16;
  -[UIKeyboardSceneDelegate keyboardWindow](self, "keyboardWindow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 == v18)
  {
LABEL_12:
    objc_msgSend(v14, "textInputTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "keyboardType");

    if (v20 == 127)
    {
      objc_msgSend(v14, "textInputTraits");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setKeyboardType:", 0);

    }
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateLayoutIfNeeded");

LABEL_15:
    -[UIKeyboardSceneDelegate setInputViews:animationStyle:](self, "setInputViews:animationStyle:", v7, v23);
    goto LABEL_16;
  }

LABEL_16:
}

- (void)orderOutWithAnimationStyle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!v4)
  {
    -[UIKeyboardSceneDelegate nextAnimationStyle](self, "nextAnimationStyle");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardSceneDelegate setInputViews:animationStyle:](self, "setInputViews:animationStyle:", v5, v6);

}

- (void)_clearPinningResponders
{
  UIInputViewPostPinningReloadState *postPinningReloadState;

  -[NSMutableSet removeAllObjects](self->_pinningResponders, "removeAllObjects");
  postPinningReloadState = self->_postPinningReloadState;
  self->_postPinningReloadState = 0;

}

- (BOOL)_isPinningInputViewsOnBehalfOfResponder:(id)a3
{
  return -[NSMutableSet containsObject:](self->_pinningResponders, "containsObject:", a3);
}

- (void)addTrackingElement:(id)a3
{
  id v4;
  NSHashTable *trackingElements;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  trackingElements = self->_trackingElements;
  v8 = v4;
  if (!trackingElements)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_trackingElements;
    self->_trackingElements = v6;

    v4 = v8;
    trackingElements = self->_trackingElements;
  }
  -[NSHashTable addObject:](trackingElements, "addObject:", v4);

}

- (void)removeTrackingElement:(id)a3
{
  -[NSHashTable removeObject:](self->_trackingElements, "removeObject:", a3);
}

- (void)updateTrackingElementsForSize:(CGSize)a3
{
  double height;
  double width;
  NSHashTable *v5;
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

  height = a3.height;
  width = a3.width;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_trackingElements;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "keyboardIsChangingSize:", width, height, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)updateTrackingElementsForOffset:(UIOffset)a3
{
  double vertical;
  double horizontal;
  NSHashTable *v5;
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

  vertical = a3.vertical;
  horizontal = a3.horizontal;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_trackingElements;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "keyboardIsChangingOffset:", horizontal, vertical, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)addVisibilityObserver:(id)a3
{
  id v4;
  NSHashTable *visibilityObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  visibilityObservers = self->_visibilityObservers;
  v8 = v4;
  if (!visibilityObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_visibilityObservers;
    self->_visibilityObservers = v6;

    v4 = v8;
    visibilityObservers = self->_visibilityObservers;
  }
  -[NSHashTable addObject:](visibilityObservers, "addObject:", v4);

}

- (void)removeVisibilityObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_visibilityObservers, "removeObject:", a3);
}

- (void)_updateVisibilityObserversWithReset:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableDictionary *preservedViewSets;
  _BOOL4 v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSHashTable *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  preservedViewSets = self->_preservedViewSets;
  if (preservedViewSets)
    v6 = -[NSMutableDictionary count](preservedViewSets, "count") == 0;
  else
    v6 = 1;
  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wantsAssistantWhileSuppressingKeyboard");

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = self->_visibilityObservers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = v6 & (v8 ^ 1u);
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "visibilityDidChange:", v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "keyboardSceneDelegate:inputViewSetVisibilityDidChange:includedReset:", self, v11, v3);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v14, "inputResponderController:inputViewSetVisibilityDidChange:includedReset:", self, v11, v3);
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (BOOL)_preserveMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4 reset:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "restorableResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EE06D890);

  if (v10)
  {
    v11 = v8;
    objc_msgSend(v7, "restorableResponder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_opt_respondsToSelector();
    if ((v10 & 1) != 0)
      objc_msgSend(v12, "_preserveFocusWithToken:destructively:", v11, v5);

  }
  return v10 & 1;
}

- (BOOL)_restoreMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  char v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  char v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v5 = a3;
  v6 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  objc_msgSend(v5, "restorableResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_1EE06D890);

  if (v8)
  {
    v9 = v6;
    objc_msgSend(v5, "restorableResponder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "_restoreFocusWithToken:", v9);
      *((_BYTE *)v21 + 24) = v11;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v12 = dispatch_semaphore_create(0);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__UIKeyboardSceneDelegate__restoreMultiDocumentTokenIfNecessary_withId___block_invoke;
      v17[3] = &unk_1E16BD888;
      v19 = &v20;
      v13 = v12;
      v18 = v13;
      objc_msgSend(v10, "_restoreFocusWithToken:completion:", v9, v17);
      v14 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v13, v14);

    }
  }
  v15 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return v15;
}

intptr_t __72__UIKeyboardSceneDelegate__restoreMultiDocumentTokenIfNecessary_withId___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_isPreservedRestorableResponder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_preservedViewSets, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "restorableResponder");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4 reset:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *preservedViewSets;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  UIResponder *v23;
  UIResponder *responderWithoutAutomaticAppearanceEnabled;
  UIResponder *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;

  v5 = a5;
  v31 = a3;
  if (!-[UIKeyboardSceneDelegate automaticAppearanceReallyEnabled](self, "automaticAppearanceReallyEnabled"))
  {
    if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textInputTraits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "keyboardAppearance");

      if (v10 == 127)
        goto LABEL_26;
    }
  }
  if (!self->_preservedViewSets)
  {
    v14 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    preservedViewSets = self->_preservedViewSets;
    self->_preservedViewSets = v14;

    if (a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (!a4)
LABEL_6:
    -[UIKeyboardSceneDelegate _beginDisablingAnimations](self, "_beginDisablingAnimations");
LABEL_7:
  if (v31)
  {
    -[UIKeyboardSceneDelegate inputViews](self, "inputViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[UIInputViewSet emptyInputSet](UIInputViewSet, "emptyInputSet");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;

    objc_msgSend(v16, "inputView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_inheritedRenderConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRestorableRenderConfig:", v18);

    -[UIKeyboardSceneDelegate responder](self, "responder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRestorableResponder:", v19);

    objc_msgSend(v16, "setRestoreUsingBecomeFirstResponder:", v5 ^ 1);
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[UIKeyboardSceneDelegate responder](self, "responder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_tagAsRestorableResponder");

    }
    -[NSMutableDictionary setObject:forKey:](self->_preservedViewSets, "setObject:forKey:", v16, v31);
    objc_msgSend(v16, "restorableResponder");
    v23 = (UIResponder *)objc_claimAutoreleasedReturnValue();
    responderWithoutAutomaticAppearanceEnabled = self->_responderWithoutAutomaticAppearanceEnabled;

    if (v23 != responderWithoutAutomaticAppearanceEnabled)
    {
      v25 = self->_responderWithoutAutomaticAppearanceEnabled;
      self->_responderWithoutAutomaticAppearanceEnabled = 0;

    }
    objc_msgSend(v16, "inputAccessoryView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_nextResponderOverride");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAccessoryViewNextResponder:", v27);

    objc_msgSend(v16, "accessoryViewNextResponder");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_respondsToSelector();

    if ((v29 & 1) != 0)
    {
      objc_msgSend(v16, "accessoryViewNextResponder");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_tagAsRestorableResponder");

    }
    if (-[UIKeyboardSceneDelegate _preserveMultiDocumentTokenIfNecessary:withId:reset:](self, "_preserveMultiDocumentTokenIfNecessary:withId:reset:", v16, v31, v5))
    {
      objc_msgSend(v16, "_forceRestoreUsingBecomeFirstResponder:", 1);
    }
    -[UIKeyboardSceneDelegate _updateVisibilityObserversWithReset:](self, "_updateVisibilityObserversWithReset:", v5);

  }
  if (v5)
  {
    -[UIKeyboardSceneDelegate setPreservingInputViews:](self, "setPreservingInputViews:", 1);
    -[UIKeyboardSceneDelegate _reloadInputViewsForResponder:](self, "_reloadInputViewsForResponder:", 0);
    -[UIKeyboardSceneDelegate setPreservingInputViews:](self, "setPreservingInputViews:", 0);
  }
  if (!a4)
    -[UIKeyboardSceneDelegate _endDisablingAnimations](self, "_endDisablingAnimations");
LABEL_26:

}

- (void)_preserveInputViewsWithId:(id)a3
{
  -[UIKeyboardSceneDelegate _preserveInputViewsWithId:animated:reset:](self, "_preserveInputViewsWithId:animated:reset:", a3, 0, 0);
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4
{
  -[UIKeyboardSceneDelegate _preserveInputViewsWithId:animated:reset:](self, "_preserveInputViewsWithId:animated:reset:", a3, a4, 1);
}

- (void)_restoreInputAccessoryViewOverrideWithId:(id)a3
{
  id v4;
  NSMutableDictionary *preservedViewSets;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  preservedViewSets = self->_preservedViewSets;
  if (preservedViewSets)
  {
    v12 = v4;
    v6 = -[NSMutableDictionary count](preservedViewSets, "count");
    v4 = v12;
    if (v6)
    {
      -[NSMutableDictionary objectForKey:](self->_preservedViewSets, "objectForKey:", v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "accessoryViewNextResponder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "inputAccessoryView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "accessoryViewNextResponder");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_overrideInputAccessoryViewNextResponderWithResponder:", v11);

        }
      }

      v4 = v12;
    }
  }

}

uint64_t __73__UIKeyboardSceneDelegate__clearPreservedInputViewsWithId_clearKeyboard___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopPinningInputViewsOnBehalfOfResponder:", a2);
}

BOOL __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "restorableResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(v4, "setRestorableResponder:", 0);
    objc_msgSend(v4, "setAccessoryViewNextResponder:", 0);
  }

  return v5 == v6;
}

void __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "accessoryViewNextResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
    objc_msgSend(v6, "setAccessoryViewNextResponder:", 0);

}

- (void)_removePreservedInputViewSetForInputView:(id)a3
{
  uint64_t v4;
  void *v5;
  NSMutableDictionary *preservedViewSets;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  v4 = -[NSMutableDictionary count](self->_preservedViewSets, "count");
  v5 = v10;
  if (v4)
  {
    preservedViewSets = self->_preservedViewSets;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__UIKeyboardSceneDelegate__removePreservedInputViewSetForInputView___block_invoke;
    v11[3] = &unk_1E16C6238;
    v12 = v10;
    -[NSMutableDictionary keysOfEntriesPassingTest:](preservedViewSets, "keysOfEntriesPassingTest:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v8 = self->_preservedViewSets;
      objc_msgSend(v7, "allObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectsForKeys:](v8, "removeObjectsForKeys:", v9);

    }
    v5 = v10;
  }

}

BOOL __68__UIKeyboardSceneDelegate__removePreservedInputViewSetForInputView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "inputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

- (void)_beginPersistingInputAccessoryViewForResponder:(id)a3 withId:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *persistentInputAccessoryResponders;
  NSMutableArray *persistentInputAccessoryResponderOrder;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  _QWORD v14[5];

  v12 = a3;
  v6 = a4;
  if (!self->_persistentInputAccessoryResponders)
  {
    v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    persistentInputAccessoryResponders = self->_persistentInputAccessoryResponders;
    self->_persistentInputAccessoryResponders = v7;

  }
  persistentInputAccessoryResponderOrder = self->_persistentInputAccessoryResponderOrder;
  if (!persistentInputAccessoryResponderOrder)
  {
    v10 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
    v11 = self->_persistentInputAccessoryResponderOrder;
    self->_persistentInputAccessoryResponderOrder = v10;

    persistentInputAccessoryResponderOrder = self->_persistentInputAccessoryResponderOrder;
  }
  -[NSMutableArray addObject:](persistentInputAccessoryResponderOrder, "addObject:", v6, v12);
  -[NSMutableDictionary setObject:forKey:](self->_persistentInputAccessoryResponders, "setObject:forKey:", v13, v6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__UIKeyboardSceneDelegate__beginPersistingInputAccessoryViewForResponder_withId___block_invoke;
  v14[3] = &unk_1E16B1B28;
  v14[4] = self;
  -[UIKeyboardSceneDelegate performWithAllowingNilResponderReload:](self, "performWithAllowingNilResponderReload:", v14);

}

void __81__UIKeyboardSceneDelegate__beginPersistingInputAccessoryViewForResponder_withId___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "responder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_reloadInputViewsForResponder:", v2);

}

void __66__UIKeyboardSceneDelegate__endPersistingInputAccessoryViewWithId___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "responder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_reloadInputViewsForResponder:", v2);

}

- (void)_clearPersistingInputAccessoryView
{
  -[NSMutableArray removeAllObjects](self->_persistentInputAccessoryResponderOrder, "removeAllObjects");
}

- (void)performWithAllowingNilResponderReload:(id)a3
{
  self->_allowNilResponderReload = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_allowNilResponderReload = 0;
}

- (BOOL)useVisualModeWindowedUI
{
  return -[UIKeyboardVisualModeManager useVisualModeWindowed](self->_visualModeManager, "useVisualModeWindowed");
}

- (BOOL)windowingModeEnabled
{
  return -[UIKeyboardVisualModeManager windowingModeEnabled](self->_visualModeManager, "windowingModeEnabled");
}

- (BOOL)enhancedWindowingModeIsAvailable
{
  void *v2;
  char isKindOfClass;

  -[UIKeyboardSceneDelegate scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)visualModeManager:(id)a3 didChangeToMode:(int)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 1024;
    v11 = a4;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "VisualModeManager %@ didChangeToMode %u, reloading keyboard", (uint8_t *)&v8, 0x12u);
  }

  -[UIKeyboardSceneDelegate forceReloadInputViews](self, "forceReloadInputViews");
}

- (void)visualModeManager:(id)a3 observedEnhancedWindowingModeEnabledDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "VisualModeManager %@ observedEnhancedWindowingModeEnabledDidChange %d", (uint8_t *)&v12, 0x12u);
  }

  -[UIKeyboardSceneDelegate scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activationState");

  if (v9 == 1)
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate scene](self, "scene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setKeyboardSceneIdentifierEnteringForegroundForScene:", v11);

  }
}

- (BOOL)showingAccessoryViewOnly
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  _DWORD v16[2];
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardSceneDelegate containerWindow](self, "containerWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViewSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViewSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputAccessoryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "inputViewSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isInputAccessoryViewPlaceholder") ^ 1;

  }
  else
  {
    v8 = 0;
  }

  +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyboardWindow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "rootViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputViewSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = 0;
  else
    v13 = v8;
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = v13;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v12;
    _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "showingAccessoryViewOnly %d - tewIVS: %@, rkwIVS: %@", (uint8_t *)v16, 0x1Cu);
  }

  return v13;
}

- (BOOL)expectedInputViewSetIsCustom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardSceneDelegate responder](self, "responder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;

    if (v8 <= 0.0)
      return 0;
  }
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardSceneDelegate responder](self, "responder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v12;
    v17 = 2112;
    v18 = v14;
    _os_log_debug_impl(&dword_185066000, v9, OS_LOG_TYPE_DEBUG, "expectedInputViewSetIsCustom: vc: %@ v: %@", (uint8_t *)&v15, 0x16u);

  }
  return 1;
}

- (BOOL)expectedInputModeIsSpecialized
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpecializedInputMode");

  if (v4)
  {
    +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentInputMode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_185066000, v5, OS_LOG_TYPE_DEBUG, "expectedInputModeIsSpecialized: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  return v4;
}

- (BOOL)textEntryFocusOnExternalDisplay
{
  void *v2;
  void *v3;
  char v4;

  -[UIKeyboardSceneDelegate scene](self, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isEmbeddedScreen") ^ 1;

  return v4;
}

- (void)_windowHostingScene:(id)a3 didMoveFromScreen:(id)a4 toScreen:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[UIKeyboardVisualModeManager visualModeLog](UIKeyboardVisualModeManager, "visualModeLog");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Reload for scene: (%@) did move to screen %@", (uint8_t *)&v10, 0x16u);
  }

  -[UIKeyboardSceneDelegate forceReloadInputViews](self, "forceReloadInputViews");
}

- (BOOL)showingInAppWindow
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compactAssistantBarPersistentLocation");

  return (v4 & 4) == 0;
}

- (BOOL)keyboardVisible
{
  void *v2;
  char v3;

  -[UIKeyboardSceneDelegate keyboardArbiterClient](self, "keyboardArbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyboardVisible");

  return v3;
}

- (void)setHardwareKeyboardExclusivityIdentifier:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_hardwareKeyboardExclusivityIdentifier, a3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareKeyboardAvailabilityChanged");

  v6 = (id)UIKeyboardActiveInputModes;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_612);

  if (v12)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeInputModes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_614);

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_6:
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recomputeActiveInputModesWithExtensions:", 1);

    }
  }
LABEL_7:

}

uint64_t __68__UIKeyboardSceneDelegate_setHardwareKeyboardExclusivityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputModeWithIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isHandwritingInputMode");
  return v5;
}

uint64_t __68__UIKeyboardSceneDelegate_setHardwareKeyboardExclusivityIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHandwritingInputMode");
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setAutomaticAppearanceEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabled = a3;
}

- (BOOL)restoringInputViewsAndWaitingForInputUI
{
  return self->_restoringInputViewsAndWaitingForInputUI;
}

- (NSString)hardwareKeyboardExclusivityIdentifier
{
  return self->_hardwareKeyboardExclusivityIdentifier;
}

- (void)setHideSystemInputAssistantView:(BOOL)a3
{
  self->_hideSystemInputAssistantView = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setRestorableRenderConfig:(id)a3
{
  objc_storeStrong((id *)&self->_restorableRenderConfig, a3);
}

- (void)setDeactivationCount:(unint64_t)a3
{
  self->_deactivationCount = a3;
}

- (void)setPreservingInputViews:(BOOL)a3
{
  self->_preservingInputViews = a3;
}

- (BOOL)restoringInputViews
{
  return self->_restoringInputViews;
}

- (void)setRestoringInputViews:(BOOL)a3
{
  self->_restoringInputViews = a3;
}

- (void)setTakingSnapshot:(BOOL)a3
{
  self->_takingSnapshot = a3;
}

- (void)setIsKeyboardOnEmbeddedScreen:(BOOL)a3
{
  self->_isKeyboardOnEmbeddedScreen = a3;
}

- (void)setLocalAuthenticationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_localAuthenticationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationObserver, 0);
  objc_storeStrong((id *)&self->_restorableRenderConfig, 0);
  objc_destroyWeak((id *)&self->_keyWindowCandidate);
  objc_storeStrong((id *)&self->_visualModeManager, 0);
  objc_storeStrong((id *)&self->_hardwareKeyboardExclusivityIdentifier, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_preservedKeyboardWindowSnapshot, 0);
  objc_storeStrong((id *)&self->_postWaitingForInputUIBlocks, 0);
  objc_storeStrong((id *)&self->_waitingForInputUI, 0);
  objc_storeStrong((id *)&self->_remoteInputViewHost, 0);
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantViewController, 0);
  objc_storeStrong((id *)&self->_textFormattingCoordinator, 0);
  objc_storeStrong((id *)&self->_transitionStartTime, 0);
  objc_storeStrong((id *)&self->_keysBeingRestored, 0);
  objc_storeStrong((id *)&self->_persistentInputAccessoryResponderOrder, 0);
  objc_storeStrong((id *)&self->_persistentInputAccessoryResponders, 0);
  objc_storeStrong((id *)&self->_pinningResponders, 0);
  objc_storeStrong((id *)&self->_postPinningReloadState, 0);
  objc_storeStrong((id *)&self->_trackingElements, 0);
  objc_storeStrong((id *)&self->_visibilityObservers, 0);
  objc_storeStrong((id *)&self->_animationStyleStack, 0);
  objc_storeStrong((id *)&self->_preservedViewSets, 0);
  objc_storeStrong((id *)&self->_transientInputViewSet, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_selfHostingTrigger, 0);
  objc_storeStrong((id *)&self->_responderWithoutAutomaticAppearanceEnabled, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_containerWindowForViewService, 0);
  objc_storeStrong((id *)&self->_containerWindow, 0);
}

@end
