@implementation UIRemoteEmojiAndStickerInputView

- (id)contentViewController
{
  STKEmojiAndStickerCollectionViewController *viewController;
  void *v4;
  objc_class *v5;
  STKEmojiAndStickerCollectionViewController *v6;
  STKEmojiAndStickerCollectionViewController *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  viewController = self->_viewController;
  if (!viewController)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1_7;
    v28 = _MergedGlobals_1_7;
    if (!_MergedGlobals_1_7)
    {
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __getSTKEmojiAndStickerCollectionViewControllerClass_block_invoke;
      v23 = &unk_1E16B14C0;
      v24 = &v25;
      __getSTKEmojiAndStickerCollectionViewControllerClass_block_invoke((uint64_t)&v20);
      v4 = (void *)v26[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v25, 8);
    v6 = (STKEmojiAndStickerCollectionViewController *)objc_alloc_init(v5);
    v7 = self->_viewController;
    self->_viewController = v6;

    -[STKEmojiAndStickerCollectionViewController setDelegate:](self->_viewController, "setDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0 && getSTKEmojiAndStickerCollectionViewConfigurationClass())
    {
      v8 = objc_alloc_init((Class)getSTKEmojiAndStickerCollectionViewConfigurationClass());
      -[UIKBKeyView screenTraits](self, "screenTraits");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserInterfaceIdiom:", objc_msgSend(v9, "idiom"));
      objc_msgSend(v9, "keyboardWidth");
      objc_msgSend(v8, "setKeyboardWidth:");
      objc_msgSend(v8, "setIsKeyboardMinorEdgeWidth:", objc_msgSend(v9, "isKeyboardMinorEdgeWidth"));
      objc_msgSend(v8, "setIsInPopover:", objc_msgSend(v9, "isInPopover"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "canInsertAdaptiveImageGlyph");

        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "canPasteImage"))
        {
          +[UIKeyboardEmojiPreferences sharedInstance](UIKeyboardEmojiPreferences, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "memojiSettingEnabled");

        }
        else
        {
          v14 = 0;
        }

        objc_msgSend(v8, "setDoesSupportImageGlyph:", v11 | v14);
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v25 = 0;
        v26 = &v25;
        v27 = 0x2050000000;
        v15 = (void *)qword_1ECD79DC8;
        v28 = qword_1ECD79DC8;
        if (!qword_1ECD79DC8)
        {
          v20 = MEMORY[0x1E0C809B0];
          v21 = 3221225472;
          v22 = __getTUIEmojiSearchViewClass_block_invoke;
          v23 = &unk_1E16B14C0;
          v24 = &v25;
          __getTUIEmojiSearchViewClass_block_invoke((uint64_t)&v20);
          v15 = (void *)v26[3];
        }
        v16 = objc_retainAutorelease(v15);
        _Block_object_dispose(&v25, 8);
        objc_msgSend(v8, "setDoesSupportGenmoji:", objc_msgSend(v16, "shouldShowGenmoji"));
      }
      -[STKEmojiAndStickerCollectionViewController setConfiguration:](self->_viewController, "setConfiguration:", v8);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_willShowStickerEditor, 0x1E174CC00, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_willHideStickerEditor, 0x1E174CC20, 0);

    viewController = self->_viewController;
  }
  return viewController;
}

- (void)didSelectEmoji:(id)a3
{
  -[UIRemoteEmojiAndStickerInputView didSelectEmoji:dismiss:](self, "didSelectEmoji:dismiss:", a3, 1);
}

- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a4;
  v6 = a3;
  if (-[UIRemoteEmojiAndStickerInputView isInSearchPopover](self, "isInSearchPopover"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v4)
    {
      objc_msgSend(v7, "inputDelegateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v9, "shouldRespectForwardingInputDelegate");
      objc_msgSend(v9, "setShouldRespectForwardingInputDelegate:", 0);
      objc_msgSend(v9, "insertText:", v6);
      objc_msgSend(v9, "setShouldRespectForwardingInputDelegate:", v15);
      goto LABEL_8;
    }
    objc_msgSend(v7, "clearForwardingInputDelegateAndResign:", 0);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_layout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKBKeyView key](self, "key");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createKeyEventForStringAction:forKey:inputFlags:", v6, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "taskQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__UIRemoteEmojiAndStickerInputView_didSelectEmoji_dismiss___block_invoke;
    v16[3] = &unk_1E16BB0D8;
    v17 = v9;
    v18 = v12;
    v14 = v12;
    objc_msgSend(v13, "performSingleTask:", v16);

  }
LABEL_8:

}

uint64_t __59__UIRemoteEmojiAndStickerInputView_didSelectEmoji_dismiss___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeyEvent:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

- (void)didSelectSticker:(id)a3
{
  -[UIRemoteEmojiAndStickerInputView didSelectSticker:dismiss:](self, "didSelectSticker:dismiss:", a3, 1);
}

- (void)didSelectSticker:(id)a3 dismiss:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  v8 = v5;
  if (v4)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissEmojiPopoverIfNecessaryWithCompletion:", 0);

    v5 = v8;
  }
  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSticker:", v8);

    v5 = v8;
  }

}

- (void)didSelectEditWithStickerIdentifer:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  STKEmojiAndStickerCollectionViewController *viewController;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  if (a3)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    viewController = self->_viewController;
    v10 = a3;
    -[STKEmojiAndStickerCollectionViewController childViewControllers](viewController, "childViewControllers");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromView:", v13, x, y, width, height);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentStickerEditorWithStickerIdentifier:sourceRect:", v10, v15, v17, v19, v21);

  }
}

- (void)didSelectPresentPicker
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if (v3)
  {
    +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentCard");

  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "delegateRespectingForwardingDelegate:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EDE22B80))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleStickerEvent_presentCard");

    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_185066000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "responder %@ does not conform to UITextInput. Cannot present stickers.", buf, 0xCu);
    }

  }
}

- (BOOL)handleKeyEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  -[UIRemoteEmojiAndStickerInputView emojiSearchField](self, "emojiSearchField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = 0;
    v8 = &stru_1E16EDF20;
  }
  else
  {
    -[UIRemoteEmojiAndStickerInputView emojiSearchField](self, "emojiSearchField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "equalsKeyCode:modifiers:", 82, 0x100000) & 1) == 0
      && (objc_msgSend(v4, "equalsKeyCode:modifiers:", 81, 0x100000) & 1) == 0
      && (objc_msgSend(v4, "equalsKeyCode:modifiers:", 80, 0x100000) & 1) == 0
      && (objc_msgSend(v4, "equalsKeyCode:modifiers:", 79, 0x100000) & 1) == 0
      && (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 43) & 1) == 0
      && (objc_msgSend(v4, "equalsKeyCode:modifiers:", 43, 0x20000) & 1) == 0)
    {
      if (-[__CFString length](v8, "length") && objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 81))
      {
        -[UIRemoteEmojiAndStickerInputView setFocusingCollectionView:](self, "setFocusingCollectionView:", 1);
      }
      else if (-[__CFString length](v8, "length")
             && !-[UIRemoteEmojiAndStickerInputView focusingCollectionView](self, "focusingCollectionView")
             || (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 82) & 1) == 0
             && (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 81) & 1) == 0
             && (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 80) & 1) == 0
             && (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 79) & 1) == 0
             && (objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 44) & 1) == 0
             && !objc_msgSend(v4, "unmodifiedKeyCodeEquals:", 40))
      {
        v7 = 0;
        goto LABEL_23;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[STKEmojiAndStickerCollectionViewController handleKeyEvent:](self->_viewController, "handleKeyEvent:", v4);
    v7 = 1;
  }
LABEL_23:

  return v7;
}

- (BOOL)shouldCutAHoleForEmojiSearchField
{
  void *v2;
  BOOL v3;

  -[UIKBKeyView screenTraits](self, "screenTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "idiom") == 1;

  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!-[UIRemoteEmojiAndStickerInputView shouldCutAHoleForEmojiSearchField](self, "shouldCutAHoleForEmojiSearchField"))
    goto LABEL_6;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemInputAssistantViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
  v12 = v11;
  v14 = v13;
  if (!objc_msgSend(v10, "pointInside:withEvent:", v7)
    || (objc_msgSend(v10, "hitTest:withEvent:", v7, v12, v14), (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    v18.receiver = self;
    v18.super_class = (Class)UIRemoteEmojiAndStickerInputView;
    -[UIView hitTest:withEvent:](&v18, sel_hitTest_withEvent_, v7, x, y);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v16 = (void *)v15;

LABEL_7:
  return v16;
}

- (void)emojiSearchTextFieldWillBecomeActive:(id)a3
{
  void *v4;
  id v5;

  -[UIRemoteEmojiAndStickerInputView emojiSearchField](self, "emojiSearchField", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBKeyView renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setRenderConfig:", v4);

}

- (void)emojiSearchTextFieldDidBecomeActive:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changePreferredEmojiSearchInputModeForInputDelegate:", v4);

  -[UIRemoteEmojiAndStickerInputView setIsInSearchPopover:](self, "setIsInSearchPopover:", 1);
}

- (void)emojiSearchTextFieldWillBecomeInactive:(id)a3
{
  id v3;

  -[UIRemoteEmojiAndStickerInputView setIsInSearchPopover:](self, "setIsInSearchPopover:", 0);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearForwardingInputDelegateAndResign:", 0);

}

- (void)emojiSearchTextFieldDidBecomeInactive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAssistantView");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("UIKeyboardSwitchedAwayFromEmoji"), 0);

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hardwareInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentInputMode:", v6);

}

- (BOOL)emojiSearchTextField:(id)a3 shouldSendQuery:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[STKEmojiAndStickerCollectionViewController searchWithQuery:](self->_viewController, "searchWithQuery:", v5);

  return 0;
}

- (void)willShowStickerEditor
{
  void *v3;
  int v4;

  -[UIKBKeyView screenTraits](self, "screenTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInPopover");

  if (v4)
    -[UIView setAlpha:](self, "setAlpha:", 0.0);
}

- (void)willHideStickerEditor
{
  -[UIView setAlpha:](self, "setAlpha:", 1.0);
}

- (id)emojiKeyManager
{
  return objc_loadWeakRetained(&self->_emojiKeyManager);
}

- (void)setEmojiKeyManager:(id)a3
{
  objc_storeWeak(&self->_emojiKeyManager, a3);
}

- (TUIEmojiSearchInputViewController)emojiSearchInputViewController
{
  return self->_emojiSearchInputViewController;
}

- (void)setEmojiSearchInputViewController:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, a3);
}

- (TUIEmojiSearchTextField)emojiSearchField
{
  return self->_emojiSearchField;
}

- (void)setEmojiSearchField:(id)a3
{
  objc_storeStrong((id *)&self->_emojiSearchField, a3);
}

- (BOOL)isInSearchPopover
{
  return self->_isInSearchPopover;
}

- (void)setIsInSearchPopover:(BOOL)a3
{
  self->_isInSearchPopover = a3;
}

- (BOOL)focusingCollectionView
{
  return self->_focusingCollectionView;
}

- (void)setFocusingCollectionView:(BOOL)a3
{
  self->_focusingCollectionView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiSearchField, 0);
  objc_storeStrong((id *)&self->_emojiSearchInputViewController, 0);
  objc_destroyWeak(&self->_emojiKeyManager);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
