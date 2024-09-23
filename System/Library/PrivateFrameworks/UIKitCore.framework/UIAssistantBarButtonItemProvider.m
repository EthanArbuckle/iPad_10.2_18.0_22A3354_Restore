@implementation UIAssistantBarButtonItemProvider

+ (void)updateFloatingAssistantBarIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a1, "inputWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assistantView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v11 = v7;

  if (objc_msgSend(v11, "isFloatingAssistantView"))
  {
    if ((objc_msgSend(v11, "isCompactAssistantView") & 1) == 0)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferencesActions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compactAssistantBarPersistentLocation");

      if (v10 == 1)
        objc_msgSend(a1, "setAssistantBarCompact:forceReload:", objc_msgSend(v11, "isCompactAssistantView"), 0);
    }
  }

}

+ (id)inputWindowController
{
  void *v3;
  void *v4;
  uint64_t v5;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShowWithinAppWindow");

  return (id)objc_msgSend(a1, "inputWindowControllerForApplication:", v5);
}

+ (BOOL)isKeyboardGroupVisible
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_isDisplayingWritingToolsSessionInUCB") & 1) == 0
    && ((objc_msgSend(a1, "_isDismissButtonVisible") & 1) != 0
     || objc_msgSend(a1, "_isScribbleButtonsVisible")))
  {
    objc_msgSend(v4, "inputView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v4, "inputViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7 == 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_isEmojiButtonVisible
{
  void *v2;
  char v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canPresentEmojiPopover");

  return v3;
}

+ (BOOL)_isDictationButtonVisible
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  char v6;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyboardResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isDisplayingWritingToolsSessionInUCB");

  if ((v5 & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v2, "shouldShowDictationKey");

  return v6;
}

+ (BOOL)_isScribbleButtonsVisible
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  char v10;

  objc_msgSend(a1, "inputWindowController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "assistantView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = v3;
  v7 = v6;

  v8 = objc_msgSend(v7, "isFloatingAssistantView");
  if (!v8)
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_showsScribbleIconsInAssistantView");

  return v10;
}

+ (BOOL)_isDismissButtonVisible
{
  void *v2;
  int v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_shouldMinimizeForHardwareKeyboard"))
    v3 = objc_msgSend(v2, "_shouldSuppressSoftwareKeyboard") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

+ (BOOL)_isShowKeyboardButtonVisible
{
  void *v2;
  void *v3;
  int v4;
  BOOL v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isMinimized") & 1) == 0)
  {
    objc_msgSend(v2, "delegateAsResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "_suppressSoftwareKeyboard"))
    {

    }
    else
    {
      v4 = objc_msgSend(v2, "_showsScribbleIconsInAssistantView");

      if (!v4)
      {
        v5 = 0;
        goto LABEL_6;
      }
    }
  }
  v5 = +[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate](UIKeyboardVisualModeManager, "softwareKeyboardAllowedForActiveKeyboardSceneDelegate");
LABEL_6:

  return v5;
}

+ (BOOL)_isMinimizeAssistantBarButtonVisible
{
  void *v3;
  void *v4;
  char v5;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemInputAssistantViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isInputAssistantItemEmpty")
    && !objc_msgSend(a1, "_isScribbleButtonsVisible")
    || (objc_msgSend(v4, "_usesCustomBackground") & 1) != 0
    || +[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced"))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "supportsCompactStyle");
  }

  return v5;
}

+ (BOOL)_isKeyboardItemEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardType") != 122;

  return v4;
}

+ (BOOL)_isStyleItemEnable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsTextAnimationsType");

  if (v6 == 2)
    LOBYTE(v7) = 0;
  else
    v7 = objc_msgSend(v3, "_isDisplayingWritingToolsSessionInUCB") ^ 1;

  return v7;
}

+ (id)barButtonItemForAssistantItemStyle:(int64_t)a3 target:(id)a4
{
  return (id)objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:forcePlainButton:", a3, a4, 0);
}

+ (id)barButtonItemForAssistantItemStyle:(int64_t)a3 target:(id)a4 forcePlainButton:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  UIBarButtonItem *v9;
  __CFString *v10;
  void *v11;
  char v12;
  __CFString *v13;
  char *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  UIKeyboardBIUImageGenerator *v19;
  UIKeyboardBIUImageGenerator *v20;
  UIAssistantBarSeparatorView *v21;
  void *v22;
  int v23;
  double v24;
  UIAssistantBarSeparatorView *v25;
  double v26;
  _QWORD *v27;
  int v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  UIButton *v36;
  UIButton *v37;
  UIButton *v38;
  double v39;
  double v40;
  UIBarButtonItem *v41;
  uint64_t v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[4];
  UIKeyboardBIUImageGenerator *v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD aBlock[6];

  v5 = a5;
  v8 = a4;
  v9 = 0;
  v10 = &stru_1E16EDF20;
  HIDWORD(v43) = v5;
  switch(a3)
  {
    case 0:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Cut"), CFSTR("Cut"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v13 = CFSTR("scissors");
      v14 = sel_assistantCut;
      v15 = 20.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = &__block_literal_global_559;
      goto LABEL_29;
    case 1:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Copy"), CFSTR("Copy"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v13 = CFSTR("doc.on.doc");
      v14 = sel_assistantCopy;
      v15 = 20.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = &__block_literal_global_42_0;
      goto LABEL_29;
    case 2:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Paste"), CFSTR("Paste"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v13 = CFSTR("doc.on.clipboard");
      v14 = sel_assistantPaste_forEvent_;
      v15 = 20.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = &__block_literal_global_65_2;
      goto LABEL_29;
    case 3:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Undo"), CFSTR("Undo"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v13 = CFSTR("arrow.uturn.backward");
      v14 = sel_assistantUndo;
      v15 = 20.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = &__block_literal_global_51_1;
      goto LABEL_29;
    case 4:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Redo"), CFSTR("Redo"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v13 = CFSTR("arrow.uturn.forward");
      v14 = sel_assistantRedo;
      v15 = 20.0;
      v16 = 0.0;
      v17 = 0.0;
      v18 = &__block_literal_global_58_3;
      goto LABEL_29;
    case 5:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Bold"), CFSTR("Bold"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantBold;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_6;
      aBlock[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      aBlock[4] = a1;
      v18 = _Block_copy(aBlock);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v15 = 20.0;
      v16 = 0.0;
      v13 = CFSTR("bold");
      goto LABEL_28;
    case 6:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Italic"), CFSTR("Italic"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantItalic;
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_7;
      v57[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v57[4] = a1;
      v18 = _Block_copy(v57);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v15 = 20.0;
      v17 = -1.0;
      v13 = CFSTR("italic");
      v16 = 0.0;
      goto LABEL_29;
    case 7:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Underline"), CFSTR("Underline"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantUnderline;
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_8;
      v56[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v56[4] = a1;
      v18 = _Block_copy(v56);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v15 = 20.0;
      v17 = 0.0;
      v13 = CFSTR("underline");
      v16 = -1.0;
      goto LABEL_29;
    case 8:
      v19 = objc_alloc_init(UIKeyboardBIUImageGenerator);
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_9;
      v54[3] = &unk_1E16E59C0;
      v55 = v19;
      v20 = v19;
      v18 = _Block_copy(v54);

      v11 = 0;
      v21 = 0;
      v13 = 0;
      LODWORD(v43) = 0;
      v14 = 0;
      v22 = 0;
      v15 = 20.0;
      v16 = 0.0;
      v23 = 1;
      v17 = 0.0;
      v24 = 0.0;
      v10 = &stru_1E16EDF20;
      goto LABEL_34;
    case 9:
      _UINSLocalizedStringWithDefaultValue(CFSTR("TEXT_FORMATTING_FORMAT"), CFSTR("Format"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantTextFormatting;
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_10;
      v53[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v53[4] = a1;
      v18 = _Block_copy(v53);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v15 = 20.0;
      v16 = 0.0;
      v13 = CFSTR("textformat");
      goto LABEL_28;
    case 10:
      v25 = [UIAssistantBarSeparatorView alloc];
      v21 = -[UIAssistantBarSeparatorView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      +[UIAssistantBarSeparatorView preferredWidth](UIAssistantBarSeparatorView, "preferredWidth");
      v24 = v26;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_21;
      v44[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v44[4] = a1;
      v18 = _Block_copy(v44);
      v11 = 0;
      v13 = 0;
      LODWORD(v43) = 0;
      v14 = 0;
      v22 = 0;
      v15 = 20.0;
      v23 = 1;
      v16 = 0.0;
      v17 = 0.0;
      goto LABEL_34;
    case 11:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Emoji"), CFSTR("Emoji"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantEmoji;
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_12;
      v52[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v52[4] = a1;
      v18 = _Block_copy(v52);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 1;
      v15 = 22.0;
      v16 = 0.0;
      v13 = CFSTR("face.grinning.inverse");
      goto LABEL_28;
    case 12:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Dictation"), CFSTR("Dictation"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantDictation;
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_13;
      v51[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v51[4] = a1;
      v27 = v51;
      goto LABEL_16;
    case 13:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Dictation"), CFSTR("Dictation"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantDictationMicOn;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_14;
      v50[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v50[4] = a1;
      v27 = v50;
LABEL_16:
      v18 = _Block_copy(v27);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 1;
      v15 = 22.0;
      v16 = 0.0;
      v13 = CFSTR("mic");
      goto LABEL_28;
    case 14:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Dismiss"), CFSTR("Dismiss"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantDismiss;
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_15;
      v49[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v49[4] = a1;
      v18 = _Block_copy(v49);
      v11 = 0;
      LODWORD(v43) = 1;
      v15 = 22.0;
      v16 = 0.0;
      v13 = CFSTR("keyboard.chevron.compact.down");
      goto LABEL_26;
    case 15:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Show Keyboard"), CFSTR("Show Keyboard"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantShowKeyboard;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_17;
      v47[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v47[4] = a1;
      v18 = _Block_copy(v47);
      v11 = 0;
      LODWORD(v43) = 1;
      v15 = 22.0;
      v16 = 0.0;
      v13 = CFSTR("keyboard");
      goto LABEL_26;
    case 16:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Keyboard"), CFSTR("Keyboard"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_19;
      v46[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v46[4] = a1;
      v18 = _Block_copy(v46);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v14 = 0;
      v15 = 22.0;
      v16 = 0.0;
      v17 = 0.0;
      v13 = CFSTR("keyboard.badge.ellipsis");
      goto LABEL_29;
    case 18:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Show Writeboard"), CFSTR("Show Writeboard"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v28 = _AXSEnhanceTextLegibilityEnabled();
      v29 = CFSTR("UIButtonBarKeyboardWriteboard_bold.png");
      if (!v28)
        v29 = CFSTR("UIButtonBarKeyboardWriteboard.png");
      v13 = v29;
      v14 = sel_assistantWriteboard;
      +[UIImage _kitImageNamed:withTrait:](UIImage, "_kitImageNamed:withTrait:", v13, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_imageThatSuppressesAccessibilityHairlineThickening");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      v21 = 0;
      LODWORD(v43) = 0;
      v23 = 1;
      v15 = 20.0;
      v16 = 0.0;
      v18 = &__block_literal_global_151_0;
      v17 = 0.0;
      v24 = 0.0;
      goto LABEL_34;
    case 19:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Delete"), CFSTR("Delete"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v31 = objc_claimAutoreleasedReturnValue();

      v18 = 0;
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v14 = sel_deleteFromInput;
      v13 = CFSTR("delete.left");
      v15 = 20.0;
      v16 = 0.0;
      v17 = 0.0;
      v8 = (id)v31;
      goto LABEL_29;
    case 20:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Undo/Redo"), CFSTR("Undo/Redo"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_20;
      v45[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v45[4] = a1;
      v18 = _Block_copy(v45);
      v11 = 0;
      LODWORD(v43) = 0;
      v12 = 0;
      v14 = 0;
      v15 = 22.0;
      v16 = 0.0;
      v17 = 0.0;
      v13 = CFSTR("arrow.uturn.backward.circle.badge.ellipsis");
      goto LABEL_29;
    case 21:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Return Key"), CFSTR("Return Key"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = sel_assistantReturnKey;
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_16;
      v48[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
      v48[4] = a1;
      v18 = _Block_copy(v48);
      v11 = 0;
      LODWORD(v43) = 1;
      v15 = 22.0;
      v16 = 0.0;
      v13 = CFSTR("return");
LABEL_26:
      v17 = 0.0;
      v12 = 1;
      goto LABEL_29;
    case 22:
      _UINSLocalizedStringWithDefaultValue(CFSTR("Text Animation"), CFSTR("Text Animation"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "textEffectsButtonLanguageCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v43) = 0;
      v12 = 0;
      v13 = CFSTR("character.motion");
      v14 = sel_assistantTextAnimation;
      v15 = 20.0;
      v16 = 0.0;
      v18 = &__block_literal_global_110_6;
LABEL_28:
      v17 = 0.0;
LABEL_29:
      objc_msgSend((id)objc_opt_class(), "configuredSymbolImageWithName:size:keyboardLanguageCode:", v13, v11, v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v33;
      v24 = 0.0;
      if ((v12 & 1) != 0)
      {
        v21 = 0;
        v23 = 0;
      }
      else if (objc_msgSend(v33, "hasBaseline"))
      {
        objc_msgSend(v22, "imageWithoutBaseline");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "_setAlignmentRectInsets:", 0.0, 0.0, 0.0, 0.0);
        v21 = 0;
        v23 = 1;
        v22 = v34;
      }
      else
      {
        v21 = 0;
        v23 = 1;
      }
LABEL_34:
      if (v16 != 0.0 || v17 != 0.0)
      {
        objc_msgSend(v22, "imageWithAlignmentRectInsets:", 0.0, v17, v16, 0.0, v43);
        v35 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v35;
      }
      if (((v23 | HIDWORD(v43)) & 1) != 0)
      {
        v36 = (UIButton *)v21;
      }
      else
      {
        v37 = [UIButton alloc];
        objc_msgSend(v22, "size");
        v38 = -[UIView initWithSize:](v37, "initWithSize:");
        -[UIControl setPointerInteractionEnabled:](v38, "setPointerInteractionEnabled:", 1);
        -[UIButton setImage:forState:](v38, "setImage:forState:", v22, 0);
        -[NSObject setAccessibilityLabel:](v38, "setAccessibilityLabel:", v10);
        -[UIControl addTarget:action:forControlEvents:](v38, "addTarget:action:forControlEvents:", v8, v14, 64);
        v36 = v38;

        v39 = 0.0;
        if ((_DWORD)v43)
        {
          objc_msgSend(v22, "size");
          v39 = v15 - v40;
        }
        -[UIButton setContentEdgeInsets:](v36, "setContentEdgeInsets:", 0.0, 0.0, v39, 0.0, v43);

      }
      v41 = [UIBarButtonItem alloc];
      if (v36)
      {
        v9 = -[UIBarButtonItem initWithCustomView:](v41, "initWithCustomView:", v36);
      }
      else
      {
        v9 = -[UIBarButtonItem initWithImage:style:target:action:](v41, "initWithImage:style:target:action:", v22, 0, v8, v14);
        -[UIBarButtonItem setTitle:](v9, "setTitle:", v10);
      }
      -[UIBarButtonItem setWidth:](v9, "setWidth:", v24, v43);
      -[UIBarButtonItem _setAutoValidationHandler:](v9, "_setAutoValidationHandler:", v18);

      break;
    default:
      break;
  }

  return v9;
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  _getResponderForEditing();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canPerformAction:withSender:", sel_cut_, 0));

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  _getResponderForEditing();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canPerformAction:withSender:", sel_copy_, 0));

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  _getResponderForEditing();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canUndo"));

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  _getResponderForEditing();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canRedo"));

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  _getResponderForEditing();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v3, "canPerformAction:withSender:", sel_paste_, 0));

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  _getResponderForEditing();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "canPerformAction:withSender:", sel_toggleBoldface_, 0))
    v4 = objc_msgSend(*(id *)(a1 + 32), "_isStyleItemEnable:", v8);
  else
    v4 = 0;
  objc_msgSend(v3, "setEnabled:", v4);
  _getStylingDictionaryForResponder(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelected:", (objc_msgSend(v7, "symbolicTraits") >> 1) & 1);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  _getResponderForEditing();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "canPerformAction:withSender:", sel_toggleItalics_, 0))
    v4 = objc_msgSend(*(id *)(a1 + 32), "_isStyleItemEnable:", v8);
  else
    v4 = 0;
  objc_msgSend(v3, "setEnabled:", v4);
  _getStylingDictionaryForResponder(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelected:", objc_msgSend(v7, "symbolicTraits") & 1);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  _getResponderForEditing();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "canPerformAction:withSender:", sel_toggleUnderline_, 0))
    v4 = objc_msgSend(*(id *)(a1 + 32), "_isStyleItemEnable:", v7);
  else
    v4 = 0;
  objc_msgSend(v3, "setEnabled:", v4);
  _getStylingDictionaryForResponder(v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679240);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelected:", objc_msgSend(v6, "integerValue") != 0);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_9(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "buttonGroup");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UIBarButtonItemGroup _items](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v4);
        v7 |= objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "isEnabled", (_QWORD)v28);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);

    objc_msgSend(v3, "setHidden:", (v7 & 1) == 0);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v3, "representativeItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _getResponderForEditing();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _getStylingDictionaryForResponder(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *(_QWORD *)off_1E1678D90;
      objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)off_1E1678D90);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fontDescriptor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "symbolicTraits");

      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fontDescriptor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "symbolicTraits");
      v20 = v16 & 2 | v19 & 1;
      v21 = (v16 >> 1) & 1;
      v22 = v19 & 1;

      objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)off_1E1679240);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "integerValue");

      v25 = *(void **)(a1 + 32);
      if (v24)
        v26 = 1;
      else
        v26 = v20 != 0;
      objc_msgSend(v25, "BIUImageForBold:italic:underline:", v21, v22, v24 != 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:", v27);

      objc_msgSend(v10, "setSelected:", v26);
    }
  }
  else
  {

    objc_msgSend(v3, "setHidden:", 1, (_QWORD)v28);
  }

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  _getResponderForEditing();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "_areDefaultTextFormattingAffordancesAvailable"))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_isStyleItemEnable:", v5);
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, "setHidden:", v4 ^ 1);
  objc_msgSend(v3, "setEnabled:", v4);
  objc_msgSend(v3, "setSelected:", 0);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", objc_msgSend(v3, "allowsTextAnimationsType") != 2);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "_isEmojiButtonVisible") ^ 1);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setHidden:", (objc_msgSend(*(id *)(a1 + 32), "_isDictationButtonVisible") | +[UIDictationController isRunning](UIDictationController, "isRunning")) ^ 1);
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    if (+[UIDictationController dictationIsFunctional](UIDictationController, "dictationIsFunctional"))
      v3 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") ^ 1;
    else
      v3 = 0;
    objc_msgSend(v4, "setEnabled:", v3);
  }

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setHidden:", +[UIDictationController isRunning](UIDictationController, "isRunning") & ~objc_msgSend(*(id *)(a1 + 32), "_isDictationButtonVisible"));
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    if (+[UIDictationController dictationIsFunctional](UIDictationController, "dictationIsFunctional"))
      v3 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") ^ 1;
    else
      v3 = 0;
    objc_msgSend(v4, "setEnabled:", v3);
  }

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "_isDismissButtonVisible") ^ 1);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (objc_msgSend(v2, "_isScribbleButtonsVisible"))
    v4 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  else
    v4 = 1;
  objc_msgSend(v3, "setHidden:", v4);
  v5 = objc_msgSend(v3, "isHidden");
  objc_msgSend(v3, "buttonGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHidden:", v5);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_17(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "_isShowKeyboardButtonVisible") ^ 1);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  id v8;

  v2 = a2;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "keyboardType");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isMinimized") ^ 1;
  if (v5 == 126)
    v7 = v6;
  else
    v7 = 1;
  objc_msgSend(v2, "setHidden:", v7);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "isKeyboardGroupVisible") ^ 1);

}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_20(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (objc_msgSend(v2, "_isScribbleButtonsVisible"))
    v4 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  else
    v4 = 1;
  objc_msgSend(v3, "setHidden:", v4);
  v5 = objc_msgSend(v3, "isHidden");
  objc_msgSend(v3, "buttonGroup");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHidden:", v5);
}

void __95__UIAssistantBarButtonItemProvider_barButtonItemForAssistantItemStyle_target_forcePlainButton___block_invoke_21(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "isKeyboardGroupVisible") ^ 1);

}

+ (id)configuredSymbolImageWithName:(id)a3 size:(double)a4
{
  return (id)objc_msgSend(a1, "configuredSymbolImageWithName:size:keyboardLanguageCode:", a3, 0, a4);
}

+ (id)configuredSymbolImageWithName:(id)a3 size:(double)a4 keyboardLanguageCode:(id)a5
{
  id v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v7 = a3;
  v8 = (__CFString *)a5;
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_lightStyleRenderConfig"))
    v10 = 1;
  else
    v10 = 2;

  if (qword_1ECD7C6A8 != -1)
    dispatch_once(&qword_1ECD7C6A8, &__block_literal_global_174_0);
  if (qword_1ECD7C698 != v10)
  {
    objc_msgSend((id)_MergedGlobals_15_5, "removeAllObjects");
    qword_1ECD7C698 = v10;
  }
  if (v8)
    v11 = v8;
  else
    v11 = &stru_1E16EDF20;
  objc_msgSend(v7, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_15_5, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v14 = (void *)objc_msgSend(v14, "imageConfiguration");
    v16 = v14;

    objc_msgSend((id)objc_opt_class(), "imageSymbolConfigurationForAssistantBarWithPointSize:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "configurationByApplyingConfiguration:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configurationWithLocale:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v20;
    }
    +[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v7, qword_1ECD7C6A0, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v7, v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)_MergedGlobals_15_5, "setObject:forKey:", v13, v12);

  }
  return v13;
}

void __92__UIAssistantBarButtonItemProvider_configuredSymbolImageWithName_size_keyboardLanguageCode___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_15_5;
  _MergedGlobals_15_5 = v0;

  qword_1ECD7C698 = 0;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SFSymbols.framework/CoreGlyphsPriority.bundle"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD7C6A0;
  qword_1ECD7C6A0 = v2;

}

+ (id)imageSymbolConfigurationForAssistantBarWithPointSize:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", CFSTR("UICTFontTextStyleFootnote"), -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationByApplyingConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)inputWindowControllerForApplication:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visualModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "useVisualModeWindowed");

  if (v3 && v6)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerRootController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputWindowRootViewController");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

+ (id)defaultSystemLeadingBarButtonGroupsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIBarButtonItem *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  UIBarButtonItemGroup *v20;
  UIBarButtonItemGroup *v21;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  UIBarButtonItemGroup *v35;
  _QWORD v36[7];

  v36[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "defaultSystemLeadingBarButtonGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 0, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 1, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 2, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 4, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "configuredSymbolImageWithName:size:", CFSTR("scissors.badge.ellipsis"), 22.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "configuredSymbolImageWithName:size:", CFSTR("arrow.uturn.backward.circle.badge.ellipsis"), 22.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[UIBarButtonItem initWithImage:style:target:action:]([UIBarButtonItem alloc], "initWithImage:style:target:action:", v12, 0, a1, 0);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __79__UIAssistantBarButtonItemProvider_defaultSystemLeadingBarButtonGroupsForItem___block_invoke;
    v26[3] = &unk_1E16E5A08;
    v27 = v6;
    v28 = v7;
    v29 = v9;
    v30 = v10;
    v31 = v8;
    v32 = v11;
    v33 = v12;
    v34 = a1;
    v25 = v12;
    v23 = v11;
    v14 = v8;
    v15 = v10;
    v16 = v9;
    v17 = v7;
    v18 = v6;
    -[UIBarButtonItem _setAutoValidationHandler:](v13, "_setAutoValidationHandler:", v26);
    v36[0] = v18;
    v36[1] = v17;
    v36[2] = v16;
    v36[3] = v15;
    v36[4] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:]([UIBarButtonItemGroup alloc], "initWithBarButtonItems:representativeItem:", v19, v13);
    v21 = v20;
    if (v20)
      *(_BYTE *)&v20->_groupFlags |= 6u;
    -[UIBarButtonItemGroup _setExpandStyle:](v20, "_setExpandStyle:", 1, v23);
    v35 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __79__UIAssistantBarButtonItemProvider_defaultSystemLeadingBarButtonGroupsForItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v3 = *(void **)(a1 + 88);
  v16 = a2;
  objc_msgSend(v3, "inputWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "placement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "assistantView");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  v10 = objc_msgSend(v9, "showsEditItems");
  if ((v10 & 1) != 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "inputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectedTextRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_isRanged");

    objc_msgSend(*(id *)(a1 + 32), "setHidden:", v14 ^ 1);
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", v14 ^ 1);
    objc_msgSend(*(id *)(a1 + 48), "setHidden:", v14);
    objc_msgSend(*(id *)(a1 + 56), "setHidden:", v14);
    objc_msgSend(*(id *)(a1 + 64), "setHidden:", 0);
    objc_msgSend(v16, "setHidden:", 0);
    v15 = 80;
    if ((_DWORD)v14)
      v15 = 72;
    objc_msgSend(v16, "setImage:", *(_QWORD *)(a1 + v15));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 48), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 56), "setHidden:", 1);
    objc_msgSend(*(id *)(a1 + 64), "setHidden:", 1);
    objc_msgSend(v16, "setHidden:", 1);
  }

}

+ (id)defaultSystemTrailingBarButtonGroupsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIBarButtonItemGroup *v11;
  UIBarButtonItemGroup *v12;
  void *v13;
  UIBarButtonItemGroup *v14;
  void *v15;
  UIBarButtonItemGroup *v16;
  _QWORD v18[2];
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "defaultSystemTrailingBarButtonGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v7;
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 8, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:]([UIBarButtonItemGroup alloc], "initWithBarButtonItems:representativeItem:", v9, v10);
    v12 = v11;
    if (v11)
      *(_BYTE *)&v11->_groupFlags |= 6u;
    -[UIBarButtonItemGroup _setExpandStyle:](v11, "_setExpandStyle:", 1);
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 9, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [UIBarButtonItemGroup alloc];
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v14, "initWithBarButtonItems:representativeItem:", v15, 0);

    if (v16)
      *(_BYTE *)&v16->_groupFlags |= 2u;
    v18[0] = v12;
    v18[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)systemDefaultAssistantItem
{
  UISystemDefaultTextInputAssistantItem *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(UISystemDefaultTextInputAssistantItem);
  objc_msgSend(a1, "defaultSystemLeadingBarButtonGroupsForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemDefaultTextInputAssistantItem setLeadingBarButtonGroups:](v3, "setLeadingBarButtonGroups:", v4);

  objc_msgSend(a1, "defaultSystemTrailingBarButtonGroupsForItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemDefaultTextInputAssistantItem setTrailingBarButtonGroups:](v3, "setTrailingBarButtonGroups:", v5);

  return v3;
}

+ (BOOL)_isInputModeVisible:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  objc_msgSend(v3, "primaryLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UIKeyboardInputModeIsNonLinguistic(v4) & 1) != 0)
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(v3, "isExtensionInputMode") ^ 1;

  return v5;
}

+ (void)setScribbleLanguageIdentifier:(id)a3
{
  id PKTextInputInteractionClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  PKTextInputInteractionClass = getPKTextInputInteractionClass();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PKTextInputInteractionClass, "interactionForScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "enabledLanguageIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "containsObject:", v8);

  if ((_DWORD)v5)
    objc_msgSend(v6, "setCurrentLanguageIdentifier:", v8);

}

+ (id)actionForInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id PKTextInputInteractionClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v4 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputModeWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "_isInputModeVisible:", v6))
  {
    objc_msgSend(v6, "indicatorIcon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "monolingualDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __55__UIAssistantBarButtonItemProvider_actionForInputMode___block_invoke;
    v20 = &unk_1E16C1C08;
    v22 = a1;
    v9 = v4;
    v21 = v9;
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, v7, v9, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(a1, "_isScribbleButtonsVisible", v17, v18, v19, v20))
    {
      PKTextInputInteractionClass = getPKTextInputInteractionClass();
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(PKTextInputInteractionClass, "interactionForScene:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "currentLanguageIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      UIKeyboardGetCurrentInputMode();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v9, "isEqualToString:", v15))
      objc_msgSend(v10, "setState:", 1);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __55__UIAssistantBarButtonItemProvider_actionForInputMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "_isScribbleButtonsVisible"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inputModeIdentifierLastUsedForLanguage:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputMode:userInitiated:", v3, 1);

  }
  else
  {
    objc_msgSend(v4, "setInputMode:userInitiated:", *(_QWORD *)(a1 + 32), 1);
  }
  objc_msgSend(*(id *)(a1 + 40), "updateFloatingAssistantBarIfNeeded");

}

+ (void)setAssistantBarCompact:(BOOL)a3
{
  objc_msgSend(a1, "setAssistantBarCompact:forceReload:", a3, 1);
}

+ (void)setAssistantBarCompact:(BOOL)a3 forceReload:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD aBlock[5];
  BOOL v20;
  BOOL v21;

  v4 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke;
  aBlock[3] = &__block_descriptor_42_e5_v8__0l;
  v20 = a3;
  aBlock[4] = a1;
  v21 = a4;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferencesActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "compactAssistantBarPersistentLocation");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "visualModeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "useVisualModeWindowed"))
  {

    goto LABEL_5;
  }

  if (((v10 & 4) == 0) != v4)
  {
LABEL_5:
    v7[2](v7);
    goto LABEL_6;
  }
  v13 = v4 ^ 1;
  objc_msgSend(a1, "inputWindowControllerForApplication:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inputWindowControllerForApplication:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIInputViewSetPlacement placement](UIInputViewSetPlacementOffScreenDown, "placement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPlacement:completion:", v16, &__block_literal_global_191_0);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke_3;
  v17[3] = &unk_1E16B1BF8;
  v18 = v7;
  objc_msgSend(v15, "setPlacement:completion:", v16, v17);

LABEL_6:
}

void __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompactAssistantBarPersistentLocation:", objc_msgSend(v4, "compactAssistantBarPersistentLocation") & 0xFFFFFFFFFFFFFFFBLL | (4 * v2));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "inputWindowController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hosting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allHostingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(unsigned __int8 *)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "flickingAssistantViewSupport");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setCompact:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateAssistantView");

  if (*(_BYTE *)(a1 + 41))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadPlacement");

  }
}

uint64_t __71__UIAssistantBarButtonItemProvider_setAssistantBarCompact_forceReload___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)dismissFloatingKeyboard
{
  void *v3;
  id PKTextInputInteractionClass;
  void *v5;
  void *v6;
  id v7;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTextInputPartner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardKeyboardOperation:object:", a2, 0);

  }
  else
  {
    PKTextInputInteractionClass = getPKTextInputInteractionClass();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PKTextInputInteractionClass, "interactionForScene:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "dismissFloatingKeyboard");
  }

}

+ (void)presentFloatingKeyboard
{
  void *v3;
  id PKTextInputInteractionClass;
  void *v5;
  void *v6;
  id v7;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTextInputPartner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "forwardKeyboardOperation:object:", a2, 0);

  }
  else
  {
    PKTextInputInteractionClass = getPKTextInputInteractionClass();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PKTextInputInteractionClass, "interactionForScene:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isFloatingKeyboardVisible"))
      objc_msgSend(v7, "dismissFloatingKeyboard");
    objc_msgSend(v7, "presentFloatingKeyboard");
  }

}

+ (BOOL)isFloatingKeyboardVisible
{
  id PKTextInputInteractionClass;
  void *v4;
  void *v5;
  void *v6;

  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    return +[UIKeyboardImpl isFloatingForced](UIKeyboardImpl, "isFloatingForced");
  PKTextInputInteractionClass = getPKTextInputInteractionClass();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(PKTextInputInteractionClass, "interactionForScene:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isFloatingKeyboardVisible");
  return (char)v4;
}

+ (id)languageIndicatorMenu:(BOOL)a3
{
  _BOOL4 v3;
  id PKTextInputInteractionClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *v62;
  void *v63;
  _BYTE v64[128];
  uint64_t v65;

  v3 = a3;
  v65 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_isScribbleButtonsVisible"))
  {
    PKTextInputInteractionClass = getPKTextInputInteractionClass();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PKTextInputInteractionClass, "interactionForScene:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = v8;
    objc_msgSend(v8, "enabledLanguageIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_6;
  }
  else
  {
    v51 = 0;
  }
  UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v59 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(a1, "actionForInputMode:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v14);
  }

  if (objc_msgSend(a1, "_isEmojiButtonVisible"))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Show Emoji"), CFSTR("Show Emoji"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("face.grinning"), 22.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v18, v19, CFSTR("emoji"), &__block_literal_global_199_1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

  }
  if (objc_msgSend(a1, "_isScribbleButtonsVisible"))
  {
    if (objc_msgSend(a1, "isFloatingKeyboardVisible"))
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Hide Keyboard"), CFSTR("Hide Keyboard"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("keyboard"), 22.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_3;
      v57[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      v57[4] = a1;
      v23 = v57;
    }
    else
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Show Keyboard"), CFSTR("Show Keyboard"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("keyboard"), 22.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_4;
      v56[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      v56[4] = a1;
      v23 = v56;
    }
    goto LABEL_23;
  }
  if (objc_msgSend(a1, "_isShowKeyboardButtonVisible"))
  {
    objc_msgSend(a1, "dismissFloatingKeyboardFromPencilKitIfNeeded");
    _UINSLocalizedStringWithDefaultValue(CFSTR("Show Keyboard"), CFSTR("Show Keyboard"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("keyboard"), 22.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = &__block_literal_global_204_1;
LABEL_23:
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v21, v22, CFSTR("keyboard"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v24);

  }
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    if (!objc_msgSend(a1, "_isMinimizeAssistantBarButtonVisible"))
      goto LABEL_33;
    if (v3)
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Expand"), CFSTR("Expand"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("arrow.up.left.and.arrow.down.right"), 22.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_6;
      v55[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      v55[4] = a1;
      v27 = CFSTR("minimize");
      v28 = v55;
    }
    else
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Minimize"), CFSTR("Minimize"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("arrow.down.right.and.arrow.up.left"), 22.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_7;
      v54[3] = &__block_descriptor_40_e18_v16__0__UIAction_8l;
      v54[4] = a1;
      v27 = CFSTR("minimize");
      v28 = v54;
    }
  }
  else
  {
    if (!objc_msgSend(a1, "_isDismissButtonVisible"))
      goto LABEL_33;
    _UINSLocalizedStringWithDefaultValue(CFSTR("Dismiss"), CFSTR("Dismiss"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("keyboard.chevron.compact.down"), 22.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = CFSTR("dismiss");
    v28 = &__block_literal_global_221_1;
  }
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v29);

LABEL_33:
  if (objc_msgSend(a1, "_isScribbleButtonsVisible"))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Pencil Settings…"), CFSTR("Pencil Settings…"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("gear"), 22.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = &__block_literal_global_228_1;
  }
  else
  {
    if (!+[UIInputSwitcherView canShowKeyboardSettings](UIInputSwitcherView, "canShowKeyboardSettings"))
      goto LABEL_38;
    _UINSLocalizedStringWithDefaultValue(CFSTR("Keyboard Settings…"), CFSTR("Keyboard Settings…"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("gear"), 22.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = &__block_literal_global_235_0;
  }
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v30, v31, CFSTR("setting"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v33);

LABEL_38:
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("keyboards"), 1, v11);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v35);

  }
  +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("action"), 1, v10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObject:", v36);
  if (os_variant_has_internal_diagnostics())
  {
    if (objc_msgSend(a1, "_isScribbleButtonsVisible"))
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Report a Problem…"), CFSTR("Report a Problem…"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("ladybug"), 22.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_11;
      v52[3] = &unk_1E16B2C10;
      v53 = v51;
      +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v49, v39, CFSTR("pencilProblemReporter"), v52);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("internal"), 1, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v42);

      v43 = v53;
    }
    else
    {
      TIGetTypoTrackerButtonValue_0();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "BOOLValue");

      if (!v45)
        goto LABEL_41;
      _UINSLocalizedStringWithDefaultValue(CFSTR("Keyboard Feedback…"), CFSTR("Keyboard Feedback…"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("ant"), 22.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v43, v50, CFSTR("typotracker"), &__block_literal_global_258_0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v46;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("internal"), 1, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v48);

    }
  }
LABEL_41:
  +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("action"), 1, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_200_2);
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_2()
{
  id v0;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "presentEmojiPopoverViaTrigger:completion:", CFSTR("ucb"), 0);

}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissFloatingKeyboard");
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentFloatingKeyboard");
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_5()
{
  void *v0;
  int v1;
  void *v2;
  id v3;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegateAsResponder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "_suppressSoftwareKeyboard");

  if (v1)
  {
    objc_msgSend(v3, "delegateAsResponder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_setSuppressSoftwareKeyboard:", 0);

  }
  else if (objc_msgSend(v3, "isMinimized"))
  {
    objc_msgSend(v3, "showKeyboardWithoutSuppressionPolicy");
  }

}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssistantBarCompact:", 0);
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssistantBarCompact:", 1);
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_8()
{
  void *v0;
  void *v1;
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMinimized"))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setHideSystemInputAssistantView:", 1);

    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "minimize");

  }
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_9()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(MEMORY[0x1E0DBDB40], "performSelector:", sel_launchPencilSettings);
  return result;
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_10()
{
  return objc_msgSend(MEMORY[0x1E0DBDB40], "launchKeyboardSettings");
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "presentProblemReportingView");
  return result;
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorMenu___block_invoke_12()
{
  id v0;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "createTypoTrackerReport");

}

+ (id)languageIndicatorImage
{
  id PKTextInputInteractionClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;

  if (objc_msgSend(a1, "_isScribbleButtonsVisible"))
  {
    PKTextInputInteractionClass = getPKTextInputInteractionClass();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(PKTextInputInteractionClass, "interactionForScene:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "enabledLanguageIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= 2)
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentLanguageIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "inputModeWithIdentifier:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "indicatorIcon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_10;
  }
  if (UIKeyboardHasMultipleActiveLinguisticNonExtensionInputModes())
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardGetCurrentInputMode();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputModeWithIdentifier:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(a1, "_isInputModeVisible:", v6))
    {
      objc_msgSend(v6, "indicatorIcon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      if (v12)
        goto LABEL_11;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend((id)objc_opt_class(), "configuredSymbolImageWithName:size:", CFSTR("keyboard.badge.ellipsis"), 22.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alignmentRectInsets");
  objc_msgSend(v15, "imageWithAlignmentRectInsets:", v16 + 2.0, v17 + 2.5, v18 + -2.0, v19 + -2.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithTintColor:renderingMode:", v20, 1);
    v21 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v21;
  }
  return v12;
}

+ (id)languageIndicatorItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *v7;
  void *v8;
  UIBarButtonItem *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];
  BOOL v15;

  v3 = a3;
  objc_msgSend(a1, "languageIndicatorImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [UIBarButtonItem alloc];
  v7 = v6;
  if (v3)
  {
    +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", &stru_1E16EDF20, v5, 0, &__block_literal_global_260_3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIBarButtonItem initWithPrimaryAction:](v7, "initWithPrimaryAction:", v8);

  }
  else
  {
    v9 = -[UIBarButtonItem initWithImage:menu:](v6, "initWithImage:menu:", v5, 0);
  }
  _UINSLocalizedStringWithDefaultValue(CFSTR("Keyboard"), CFSTR("Keyboard"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](v9, "setTitle:", v10);

  -[UIBarItem setTag:](v9, "setTag:", 1735287116);
  v11 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_2;
  v14[3] = &__block_descriptor_41_e28___UIMenu_24__0_8__NSArray_16l;
  v14[4] = a1;
  v15 = v3;
  -[UIBarButtonItem _setSecondaryActionsProvider:](v9, "_setSecondaryActionsProvider:", v14);
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_3;
  v13[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
  v13[4] = a1;
  -[UIBarButtonItem _setAutoValidationHandler:](v9, "_setAutoValidationHandler:", v13);
  -[UIBarButtonItem setIsKeyboardItem:](v9, "setIsKeyboardItem:", 1);

  return v9;
}

uint64_t __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "languageIndicatorMenu:", *(unsigned __int8 *)(a1 + 40));
}

void __58__UIAssistantBarButtonItemProvider_languageIndicatorItem___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setHidden:", objc_msgSend(*(id *)(a1 + 32), "isKeyboardGroupVisible") ^ 1);
  if (objc_msgSend(*(id *)(a1 + 32), "_isKeyboardItemEnabled"))
    v3 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI") ^ 1;
  else
    v3 = 0;
  objc_msgSend(v4, "setEnabled:", v3);

}

+ (id)dictationActionForInputMode:(id)a3 inCurrentInputMode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indicatorIconForDictationLanguage:scaleFactor:", v5, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UIKeyboardLocalizedDictationDisplayName(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__UIAssistantBarButtonItemProvider_dictationActionForInputMode_inCurrentInputMode___block_invoke;
  v13[3] = &unk_1E16B2C10;
  v10 = v5;
  v14 = v10;
  +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v9, v8, v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isEqualToString:", v6);
  if ((_DWORD)v9)
    objc_msgSend(v11, "setState:", 1);

  return v11;
}

void __83__UIAssistantBarButtonItemProvider_dictationActionForInputMode_inCurrentInputMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReasonType:", 12);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switchToDictationLanguage:", *(_QWORD *)(a1 + 32));

  +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSwitchingLanguage:", 0);

}

+ (id)dictationMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enabledDictationLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeDictationLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "dictationActionForInputMode:inCurrentInputMode:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v8, (_QWORD)v29);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v11);
    }

    if (+[UIInputSwitcherView canShowKeyboardSettings](UIInputSwitcherView, "canShowKeyboardSettings"))
    {
      _UILocalizedStringInSystemLanguage(CFSTR("Dictation Settings…"), CFSTR("Dictation Settings…"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("gear"), 22.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v15, v16, CFSTR("setting"), &__block_literal_global_267_0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("keyboards"), 1, v6, (_QWORD)v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v18;
    if (v17)
    {
      v35 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }
    +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("action"), 1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    if (os_variant_has_internal_diagnostics())
    {
      _UILocalizedStringInSystemLanguage(CFSTR("Dictation Feedback"), CFSTR("Dictation Feedback"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuredSymbolImageWithName:size:", CFSTR("ladybug"), 22.0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v23, v24, CFSTR("report"), &__block_literal_global_272_1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("report"), 1, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v21, "arrayByAddingObject:", v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v21 = (void *)v28;
      }
      else
      {
        v33 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    +[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1E16EDF20, 0, CFSTR("action"), 1, v21);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __49__UIAssistantBarButtonItemProvider_dictationMenu__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DBDB40], "launchDictationSettings");
}

void __49__UIAssistantBarButtonItemProvider_dictationMenu__block_invoke_2()
{
  id v0;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "launchDictationFeedbackApp");

}

+ (id)unmodifiableSystemAssistantItem:(int64_t)a3
{
  UISystemDefaultTextInputAssistantItem *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  UIBarButtonItemGroup *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIBarButtonItemGroup *v21;
  void *v22;
  void *v23;
  UIBarButtonItemGroup *v24;
  void *v25;
  void *v26;
  UIBarButtonItemGroup *v27;
  char v28;
  void *v29;
  UIBarButtonItemGroup *v30;
  void *v31;
  UIBarButtonItemGroup *v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  UIBarButtonItemGroup *v37;
  void *v38;
  UIBarButtonItemGroup *v39;
  char v40;
  UIBarButtonItemGroup *v41;
  void *v42;
  UIBarButtonItemGroup *v43;
  id v44;
  void *v45;
  UIBarButtonItemGroup *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  UIBarButtonItemGroup *v52;
  void *v53;
  UIBarButtonItemGroup *v54;
  UIBarButtonItemGroup *v55;
  void *v56;
  UIBarButtonItemGroup *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  UIBarButtonItemGroup *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  void *v73;
  _QWORD v74[5];
  _QWORD v75[5];
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  _QWORD v81[3];
  void *v82;
  _QWORD v83[2];
  _QWORD v84[4];

  v84[2] = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 2) > 2)
  {
    v4 = objc_alloc_init(UISystemDefaultTextInputAssistantItem);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 18, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 11, v4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:forcePlainButton:", 12, v4, a3 == 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[UIDictationController isRunning](UIDictationController, "isRunning")
      && (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
       || !+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")))
    {
      objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:forcePlainButton:", 13, v4, a3 == 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v71 = (void *)v8;
    }
    else
    {
      v71 = v7;
    }
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:forcePlainButton:", 21, v4, a3 == 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 22, v4);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 14, v4);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 15, v4);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 10, v4);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 3, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 4, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [UIBarButtonItemGroup alloc];
    v62 = (void *)v9;
    v84[0] = v6;
    v84[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v12, "initWithBarButtonItems:representativeItem:", v13, 0);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateAsResponder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_assistantBarButtonItemForWritingToolsWithStyle:", 24);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateAsResponder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_assistantBarButtonItemForWritingToolsWithStyle:", 25);
    *((_QWORD *)&v72 + 1) = objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "delegateAsResponder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_assistantBarButtonItemForWritingToolsWithStyle:", 23);
    *(_QWORD *)&v72 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 20, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIsKeyboardItem:", 1);
    objc_msgSend(v10, "setIsKeyboardItem:", 1);
    objc_msgSend(v11, "setIsKeyboardItem:", 1);
    v21 = [UIBarButtonItemGroup alloc];
    v61 = v10;
    v83[0] = v10;
    v83[1] = v11;
    v22 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v20;
    v24 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v21, "initWithBarButtonItems:representativeItem:", v23, v20);

    -[UIBarButtonItemGroup _setExpandStyle:](v24, "_setExpandStyle:", 1);
    -[UIBarButtonItemGroup _setShouldAlwaysCollapse:](v24, "_setShouldAlwaysCollapse:", 1);
    objc_msgSend(v63, "addObject:", v24);
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 16, v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v25;
    if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    {
      objc_msgSend(a1, "languageIndicatorItem:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = [UIBarButtonItemGroup alloc];
      v82 = v26;
      v28 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v27, "initWithBarButtonItems:representativeItem:", v29, 0);

      v31 = v63;
    }
    else
    {
      if (a3 == 1)
      {
        objc_msgSend(v25, "setIsKeyboardItem:", 1);
        v32 = [UIBarButtonItemGroup alloc];
        v81[0] = v66;
        v81[1] = v64;
        v81[2] = v65;
        v33 = (void *)MEMORY[0x1E0C99D20];
        v34 = v81;
        v35 = 3;
      }
      else
      {
        v32 = [UIBarButtonItemGroup alloc];
        v80[0] = v66;
        v80[1] = v71;
        v80[2] = v64;
        v80[3] = v65;
        v33 = (void *)MEMORY[0x1E0C99D20];
        v34 = v80;
        v35 = 4;
      }
      objc_msgSend(v33, "arrayWithObjects:count:", v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v32, "initWithBarButtonItems:representativeItem:", v36, v25);

      -[UIBarButtonItemGroup _setExpandStyle:](v30, "_setExpandStyle:", 1);
      -[UIBarButtonItemGroup _setShouldAlwaysCollapse:](v30, "_setShouldAlwaysCollapse:", 1);
      v28 = 0;
      v31 = v63;
    }
    objc_msgSend(v31, "addObject:", v30);
    if (v69)
    {
      v37 = [UIBarButtonItemGroup alloc];
      v79 = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v37, "initWithBarButtonItems:representativeItem:", v38, 0);

      objc_msgSend(v63, "addObject:", v39);
    }
    if (a3 == 1)
      v40 = 1;
    else
      v40 = v28;
    if ((v40 & 1) == 0)
      objc_msgSend(v73, "addObject:", v67);
    objc_msgSend(v70, "setIsKeyboardItem:", 1);
    v41 = [UIBarButtonItemGroup alloc];
    v78 = v70;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v41, "initWithBarButtonItems:representativeItem:", v42, 0);

    objc_msgSend(v73, "addObject:", v43);
    if (v72 != 0)
    {
      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = v44;
      if (*((_QWORD *)&v72 + 1))
        objc_msgSend(v44, "addObject:");
      if ((_QWORD)v72)
        objc_msgSend(v45, "addObject:", (_QWORD)v72);
      v46 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:]([UIBarButtonItemGroup alloc], "initWithBarButtonItems:representativeItem:", v45, 0);
      objc_msgSend(v73, "addObject:", v46);

    }
    v47 = v71;
    if (a3 == 1)
    {
      if (objc_msgSend(a1, "_isDictationButtonVisible"))
      {
        if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
        {
          objc_msgSend(v71, "image");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIColor clearColor](UIColor, "clearColor");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "imageWithTintColor:renderingMode:", v49, 1);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setImage:", v50);

          v47 = v71;
        }
        v51 = MEMORY[0x1E0C809B0];
        v75[0] = MEMORY[0x1E0C809B0];
        v75[1] = 3221225472;
        v75[2] = __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke;
        v75[3] = &__block_descriptor_40_e28___UIMenu_24__0_8__NSArray_16l;
        v75[4] = a1;
        objc_msgSend(v47, "_setSecondaryActionsProvider:", v75);
        objc_msgSend(v47, "setIsKeyboardItem:", 1);
        objc_msgSend(v47, "setTag:", 1944175551);
        v74[0] = v51;
        v74[1] = 3221225472;
        v74[2] = __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke_2;
        v74[3] = &__block_descriptor_40_e25_v16__0__UIBarButtonItem_8l;
        v74[4] = a1;
        objc_msgSend(v47, "_setAutoValidationHandler:", v74);
        v52 = [UIBarButtonItemGroup alloc];
        v77 = v47;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v52, "initWithBarButtonItems:representativeItem:", v53, 0);

        objc_msgSend(v73, "addObject:", v54);
      }
      objc_msgSend(v68, "setIsKeyboardItem:", 1);
      v55 = [UIBarButtonItemGroup alloc];
      v76 = v68;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v55, "initWithBarButtonItems:representativeItem:", v56, 0);

      objc_msgSend(v73, "addObject:", v57);
    }
    -[UISystemDefaultTextInputAssistantItem setLeadingBarButtonGroups:](v4, "setLeadingBarButtonGroups:", v63);
    -[UISystemDefaultTextInputAssistantItem setTrailingBarButtonGroups:](v4, "setTrailingBarButtonGroups:", v73);

  }
  else
  {
    objc_msgSend(a1, "compactSystemAssistantItem");
    v4 = (UISystemDefaultTextInputAssistantItem *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

uint64_t __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dictationMenu");
}

void __68__UIAssistantBarButtonItemProvider_unmodifiableSystemAssistantItem___block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isKeyboardItemEnabled"))
    v3 = +[UIKeyboardInputModeController dictationInputModeIsFunctional](UIKeyboardInputModeController, "dictationInputModeIsFunctional");
  else
    v3 = 0;
  objc_msgSend(v4, "setEnabled:", v3);

}

+ (id)compactSystemAssistantItem
{
  UISystemDefaultTextInputAssistantItem *v3;
  void *v4;
  UITapGestureRecognizer *v5;
  void *v6;
  UIBarButtonItemGroup *v7;
  void *v8;
  UIBarButtonItemGroup *v9;
  void *v10;
  UIBarButtonItemGroup *v11;
  void *v12;
  void *v13;
  UIBarButtonItemGroup *v15;
  _QWORD v16[3];
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(UISystemDefaultTextInputAssistantItem);
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    objc_msgSend(a1, "languageIndicatorItem:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v3, sel_assistantExpand);
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setGestureRecognizers:", v6);

    v7 = [UIBarButtonItemGroup alloc];
    v17 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v7, "initWithBarButtonItems:representativeItem:", v8, 0);
  }
  else
  {
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 16, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 11, v3);
    v5 = (UITapGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 15, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "barButtonItemForAssistantItemStyle:target:", 14, v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsKeyboardItem:", 1);
    v11 = [UIBarButtonItemGroup alloc];
    v16[0] = v5;
    v16[1] = v8;
    v16[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIBarButtonItemGroup initWithBarButtonItems:representativeItem:](v11, "initWithBarButtonItems:representativeItem:", v12, v4);

    -[UIBarButtonItemGroup _setExpandStyle:](v9, "_setExpandStyle:", 1);
    -[UIBarButtonItemGroup _setShouldAlwaysCollapse:](v9, "_setShouldAlwaysCollapse:", 1);

  }
  v15 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISystemDefaultTextInputAssistantItem setLeadingBarButtonGroups:](v3, "setLeadingBarButtonGroups:", v13);

  -[UISystemDefaultTextInputAssistantItem setTrailingBarButtonGroups:](v3, "setTrailingBarButtonGroups:", MEMORY[0x1E0C9AA60]);
  return v3;
}

@end
