@implementation UIInputSwitcherView

+ (id)activeInstance
{
  return (id)gSharedInputSwitcher;
}

- (UIInputSwitcherView)initWithFrame:(CGRect)a3
{
  UIInputSwitcherView *v3;
  NSMutableArray *v4;
  NSMutableArray *m_inputModes;
  UIInputSwitcherTableView *m_table;
  uint64_t v7;
  void *v8;
  UIInputSwitcherView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIInputSwitcherView;
  v3 = -[UIKeyboardMenuView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    m_inputModes = v3->m_inputModes;
    v3->m_inputModes = v4;

    m_table = v3->super.m_table;
    v7 = objc_opt_class();
    +[UIInputSwitcherTableCell reuseIdentifier](UIInputSwitcherSegmentedTableCell, "reuseIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView registerClass:forCellReuseIdentifier:](m_table, "registerClass:forCellReuseIdentifier:", v7, v8);

    -[UIInputSwitcherView setShowsSwitches:](v3, "setShowsSwitches:", 1);
    v9 = v3;
  }

  return v3;
}

+ (UIInputSwitcherView)sharedInstance
{
  void *v2;
  UIInputSwitcherView *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)gSharedInputSwitcher;
  if (!gSharedInputSwitcher)
  {
    v3 = [UIInputSwitcherView alloc];
    v4 = -[UIInputSwitcherView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = (void *)gSharedInputSwitcher;
    gSharedInputSwitcher = v4;

    v2 = (void *)gSharedInputSwitcher;
  }
  return (UIInputSwitcherView *)v2;
}

- (void)didFinishSplitTransition
{
  void *v3;
  void (**v4)(void);

  -[UIInputSwitcherView finishSplitTransitionBlock](self, "finishSplitTransitionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIInputSwitcherView finishSplitTransitionBlock](self, "finishSplitTransitionBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[UIInputSwitcherView setFinishSplitTransitionBlock:](self, "setFinishSplitTransitionBlock:", 0);
  }
}

- (void)reloadInputModes
{
  UIInputSwitcherView *v2;
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  int v6;
  NSMutableArray *m_inputModes;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _UNKNOWN **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSMutableArray *v25;
  UIInputSwitcherView *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->m_inputModes, "removeAllObjects");
  v3 = &off_1E167A000;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_clearAllExtensionsIfNeeded");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMinimized");

  if (v2->m_isForDictation)
  {
    m_inputModes = v2->m_inputModes;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enabledDictationLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](m_inputModes, "addObjectsFromArray:", v9);

LABEL_19:
    goto LABEL_20;
  }
  if (!v6)
  {
    v25 = v2->m_inputModes;
    v8 = (id)UIKeyboardActiveInputModes;
    -[NSMutableArray addObjectsFromArray:](v25, "addObjectsFromArray:", v8);
    goto LABEL_19;
  }
  v26 = v2;
  UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputViews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCustomInputView");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v19 = v3;
        objc_msgSend(v3[476], "sharedInputModeController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "inputModeWithIdentifier:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13
          || (objc_msgSend(v21, "hardwareLayout"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v22,
              v22))
        {
          if ((objc_msgSend(v18, "hasPrefix:", CFSTR("emoji")) & 1) == 0
            && !objc_msgSend(v18, "containsString:", CFSTR("HWR"))
            || (+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"),
                v23 = (void *)objc_claimAutoreleasedReturnValue(),
                v24 = objc_msgSend(v23, "isEmojiPopoverPresented"),
                v23,
                (v24 & 1) == 0))
          {
            -[NSMutableArray addObject:](v26->m_inputModes, "addObject:", v18);
          }
        }

        v3 = v19;
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  v2 = v26;
LABEL_20:
  -[NSMutableArray removeObject:](v2->m_inputModes, "removeObject:", CFSTR("autofillsignup"));
}

- (BOOL)_canAddLaunchItem
{
  return 1;
}

+ (BOOL)canShowKeyboardSettings
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.CheckerBoard")) ^ 1;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceStateIsLocked");

  return v3 & (v5 ^ 1);
}

- (void)_reloadInputSwitcherItems
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 m_isForDictation;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  CGFloat v31;
  void *v32;
  void *v33;
  CGFloat v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  int v43;
  char v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSArray *m_inputSwitcherItems;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  _BOOL4 v61;
  char v62;
  void *v63;
  uint64_t v64;
  NSMutableArray *obj;
  NSArray *v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[3];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (self->super.m_mode)
  {
    v3 = 0;
  }
  else
  {
    -[UIKeyboardMenuView inputView](self, "inputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 == 0;

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v66 = (NSArray *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v5, "deviceStateIsLocked");

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentInputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v7, "isExtensionInputMode");

  if (objc_msgSend((id)objc_opt_class(), "canShowKeyboardSettings")
    && !v3
    && -[UIInputSwitcherView _canAddLaunchItem](self, "_canAddLaunchItem"))
  {
    if (self->m_isForDictation)
    {
      +[UIInputSwitcherItem switcherItemWithIdentifier:](UIInputSwitcherItem, "switcherItemWithIdentifier:", CFSTR("launchdictationsettings"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("Dictation Settings…");
    }
    else
    {
      +[UIInputSwitcherItem switcherItemWithIdentifier:](UIInputSwitcherItem, "switcherItemWithIdentifier:", CFSTR("launchkeyboardsettings"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("Keyboard Settings…");
    }
    _UILocalizedStringInSystemLanguage(v9, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocalizedTitle:", v10);

    objc_msgSend(v8, "setUsesDeviceLanguage:", 1);
    -[NSArray addObject:](v66, "addObject:", v8);

  }
  -[UIInputSwitcherView reloadInputModes](self, "reloadInputModes");
  v61 = v3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = 0;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = self->m_inputModes;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v11)
  {
    v12 = v11;
    v67 = *(_QWORD *)v69;
    v64 = *MEMORY[0x1E0C997E8];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v69 != v67)
          objc_enumerationMutation(obj);
        v14 = *(id *)(*((_QWORD *)&v68 + 1) + 8 * i);
        v15 = v14;
        if (_os_feature_enabled_impl())
        {
          TIInputModeGetMultilingualSet();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v16, "count") < 2)
          {
            v15 = v14;
          }
          else
          {
            objc_msgSend(v16, "firstObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            TIInputModeGetMultilingualID();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v63, "containsObject:", v17) & 1) != 0)
              goto LABEL_44;
            objc_msgSend(v63, "addObject:", v17);
            +[UIKeyboardInputModeController multilingualSetForInputModeIdentifier:](UIKeyboardInputModeController, "multilingualSetForInputModeIdentifier:", v14);
            v18 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v18;
          }

        }
        +[UIInputSwitcherItem switcherItemWithIdentifier:](UIInputSwitcherItem, "switcherItemWithIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        m_isForDictation = self->m_isForDictation;
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (m_isForDictation)
        {
          objc_msgSend(v20, "keyboardLanguageForDictationLanguage:", v14);
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          if (v22)
            v24 = (void *)v22;
          else
            v24 = v14;
          v25 = v24;

          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "inputModeWithIdentifier:", v25);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          UIKeyboardLocalizedDictationDisplayName(v14);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v20, "inputModeWithIdentifier:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (_os_feature_enabled_impl() && (unint64_t)objc_msgSend(0, "count") >= 2)
          {
            objc_msgSend(v17, "displayName");
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v17, "extendedDisplayName");
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v27 = (void *)v28;
        }
        objc_msgSend(v16, "setLocalizedTitle:", v27);

        if (UIKeyboardRequiresFontFallbacksForInputMode())
        {
          -[UIKeyboardMenuView font](self, "font");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardMenuView font](self, "font");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "pointSize");
          objc_msgSend(v16, "setTitleFont:", UIKBCTFontForInputMode(v15, v29, v31));

          -[UIKeyboardMenuView subtitleFont](self, "subtitleFont");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardMenuView subtitleFont](self, "subtitleFont");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "pointSize");
          objc_msgSend(v16, "setSubtitleFont:", UIKBCTFontForInputMode(v15, v32, v34));

        }
        if (objc_msgSend(v17, "isExtensionInputMode"))
        {
          objc_msgSend(v17, "primaryLanguage");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "length");

          if (v36)
          {
            objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "primaryLanguage");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "displayNameForKey:value:", v64, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setLocalizedSubtitle:", v39);

LABEL_42:
          }
        }
        else
        {
          -[UIInputSwitcherView inputModes](self, "inputModes");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          UIKeyboardInputModesMatchingMode((uint64_t)v15, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "count");

          if (v42 >= 2)
          {
            UIKeyboardLocalizedSWLayoutName(v15);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setLocalizedSubtitle:", v37);
            goto LABEL_42;
          }
        }
        -[NSArray addObject:](v66, "addObject:", v16);
LABEL_44:

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v12);
  }

  if (self->m_isForDictation && os_variant_has_internal_diagnostics())
  {
    +[UIInputSwitcherItem switcherItemWithIdentifier:](UIInputSwitcherItem, "switcherItemWithIdentifier:", CFSTR("launchdictationfeedback"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedStringInSystemLanguage(CFSTR("Dictation Feedback"), CFSTR("Dictation Feedback"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setLocalizedTitle:", v55);

    objc_msgSend(v54, "setUsesDeviceLanguage:", 1);
    -[NSArray addObject:](v66, "addObject:", v54);

  }
  v43 = v60;
  if (self->m_isForDictation)
    v43 = 1;
  if (((v43 | v61) & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      TIGetTypoTrackerButtonValue();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "BOOLValue");

      if (v57)
      {
        +[UIInputSwitcherItem switcherItemWithIdentifier:](UIInputSwitcherItem, "switcherItemWithIdentifier:", CFSTR("reporttotypotracker"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        _UILocalizedStringInSystemLanguage(CFSTR("Keyboard Feedback…"), CFSTR("Keyboard Feedback…"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setLocalizedTitle:", v59);

        objc_msgSend(v58, "setUsesDeviceLanguage:", 1);
        -[NSArray addObject:](v66, "addObject:", v58);

      }
    }
  }
  if (self->m_isForDictation)
    v44 = 1;
  else
    v44 = v62;
  if ((v44 & 1) == 0)
  {
    if (-[UIInputSwitcherView _isHandBiasSwitchVisible](self, "_isHandBiasSwitchVisible"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isTrackpadMode");

      if ((v46 & 1) == 0)
      {
        +[UIInputSwitcherItem switcherItemWithIdentifier:](UIInputSwitcherItem, "switcherItemWithIdentifier:", CFSTR("handbiasswitch"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setLocalizedTitle:", &stru_1E16EDF20);
        +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 26.0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("keyboard.onehanded.left"), v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v72[0] = v49;
        +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("keyboard"), v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v72[1] = v50;
        +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("keyboard.onehanded.right"), v48);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v72[2] = v51;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 3);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setSegmentImages:", v52);

        objc_msgSend(v47, "setPersistentSelectedIndex:", &__block_literal_global_310);
        -[NSArray addObject:](v66, "addObject:", v47);

      }
    }
  }
  m_inputSwitcherItems = self->m_inputSwitcherItems;
  self->m_inputSwitcherItems = v66;

}

uint64_t __48__UIInputSwitcherView__reloadInputSwitcherItems__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t i;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_layout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "currentHandBias");
  for (i = 0; i != 3; ++i)
  {
    if (__handBiasOrdering[i] == v2)
      break;
  }

  return i;
}

- (void)toggleKeyboardFloatingPreference
{
  id v3;

  +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating");
  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "actionForMenu:", self);

}

- (id)selectedInputMode
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[UIInputSwitcherView defaultSelectedIndex](self, "defaultSelectedIndex");
  -[UITableView indexPathForSelectedRow](self->super.m_table, "indexPathForSelectedRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = objc_msgSend(v4, "row");
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
    v3 = -[UIKeyboardMenuView indexForSelectedFastSwitchMode](self, "indexForSelectedFastSwitchMode");
  -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldShowSelectionExtraViewForIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherView;
  if (-[UIKeyboardMenuView shouldShowSelectionExtraViewForIndexPath:](&v8, sel_shouldShowSelectionExtraViewForIndexPath_, v4))
  {
    -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", objc_msgSend(v4, "row"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSegmentedItem") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)_indexOfInputSwitcherItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t i;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    TIInputModeGetMultilingualSet();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      objc_msgSend(v5, "firstObject");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
  }
  else
  {
    v5 = 0;
  }
  for (i = 0; i < -[NSArray count](self->m_inputSwitcherItems, "count"); ++i)
  {
    -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v4);

    if ((v10 & 1) != 0)
      break;
  }

  return i;
}

- (int64_t)_indexOfFastSwitchToggleModeForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;

  v4 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLinguisticInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  if (v8)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inputModeForASCIIToggleWithTraits:", 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIInputSwitcherView _indexOfInputSwitcherItemWithIdentifier:](self, "_indexOfInputSwitcherItemWithIdentifier:", v11);

  return v12;
}

- (void)selectRowForInputMode:(id)a3
{
  int64_t v4;
  id v5;

  v5 = a3;
  v4 = -[UIInputSwitcherView _indexOfInputSwitcherItemWithIdentifier:](self, "_indexOfInputSwitcherItemWithIdentifier:");
  if (!-[UIKeyboardMenuView mode](self, "mode"))
    -[UIKeyboardMenuView setIndexForSelectedFastSwitchMode:](self, "setIndexForSelectedFastSwitchMode:", v4);
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
    -[UIKeyboardMenuView setIndexForUnselectedFastSwitchMode:](self, "setIndexForUnselectedFastSwitchMode:", -[UIInputSwitcherView _indexOfFastSwitchToggleModeForIdentifier:](self, "_indexOfFastSwitchToggleModeForIdentifier:", v5));
  -[UIKeyboardMenuView highlightRow:](self, "highlightRow:", v4);

}

- (void)removeFromSuperview
{
  objc_super v2;

  self->m_isForDictation = 0;
  v2.receiver = self;
  v2.super_class = (Class)UIInputSwitcherView;
  -[UIKeyboardMenuView removeFromSuperview](&v2, sel_removeFromSuperview);
}

- (void)fadeWithDelay:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIInputSwitcherView;
  -[UIKeyboardMenuView fadeWithDelay:](&v4, sel_fadeWithDelay_, a3);
  -[UIInputSwitcherView returnToKeyboardIfNeeded](self, "returnToKeyboardIfNeeded");
}

- (void)returnToKeyboardIfNeeded
{
  void *v2;
  id v3;

  if (self->m_isForDictation)
  {
    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSwitchingLanguage:", 0);

    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "returnToKeyboard");

  }
}

- (void)setInputMode:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  if (self->m_isForDictation)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isUsingDictationLayout"))
      v5 = CFSTR("UIDictationInputModeInvocationSourceGlobalButtonOnDictationPlane");
    else
      v5 = CFSTR("UIDictationInputModeInvocationSourceMicButtonOnKeyboardWithInputSwitcher");
    +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:](UIDictationInputModeOptions, "dictationInputModeOptionsWithInvocationSource:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "switchToDictationLanguage:inputOptions:", v18, v6);

    +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSwitchingLanguage:", 0);
  }
  else
  {
    -[UIKeyboardMenuView layout](self, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardMenuView referenceKey](self, "referenceKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setState:forKey:", 2, v10);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInputMode:userInitiated:", v18, 1);
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferencesActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputModeSelectionSequence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count")
      && (TIInputModeGetNormalizedIdentifier(),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(CFSTR("emoji"), "isEqualToString:", v13),
          v13,
          v14))
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentInputMode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateLastUsedInputMode:", v17);

    }
    else
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clearNextInputModeToUse");
    }

  }
}

- (void)selectInputMode:(id)a3
{
  id v4;

  v4 = a3;
  if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
    -[UIInputSwitcherView selectRowForInputMode:](self, "selectRowForInputMode:", v4);

}

- (void)_segmentControlValueDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView indexPathForCell:](self->super.m_table, "indexPathForCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", objc_msgSend(v5, "row"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedSegmentIndex:", objc_msgSend(v8, "selectedSegmentIndex"));

  }
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *m_inputSwitcherItems;
  id v11;
  _QWORD v12[4];
  id v13;
  UIInputSwitcherView *v14;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)UIInputSwitcherView;
  -[UIKeyboardMenuView updateSelectionWithPoint:](&v15, sel_updateSelectionWithPoint_);
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->super.m_table, x, y);
  -[UIKeyboardMenuView indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:](self, "indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", objc_msgSend(v6, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView cellForRowAtIndexPath:](self->super.m_table, "cellForRowAtIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
      objc_msgSend(v9, "updateSelectionWithPoint:");
    }

  }
  else
  {
    v8 = 0;
  }
  m_inputSwitcherItems = self->m_inputSwitcherItems;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__UIInputSwitcherView_updateSelectionWithPoint___block_invoke;
  v12[3] = &unk_1E16CD5A0;
  v13 = v8;
  v14 = self;
  v11 = v8;
  -[NSArray enumerateObjectsUsingBlock:](m_inputSwitcherItems, "enumerateObjectsUsingBlock:", v12);

}

void __48__UIInputSwitcherView_updateSelectionWithPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  unsigned int (**v8)(void);
  uint64_t (**v9)(void);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "switchControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32) == (_QWORD)v15;
    objc_msgSend(v15, "switchControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "switchIsOnBlock");
    v8 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOn:animated:", v6 ^ v8[2](), 1);

  }
  if (objc_msgSend(v15, "isSegmentedItem") && *(id *)(a1 + 32) != v15)
  {
    objc_msgSend(v15, "persistentSelectedIndex");
    v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSelectedSegmentIndex:", v9[2]());

    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 416);
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cellForRowAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v15, "selectedSegmentIndex");
    objc_msgSend(v12, "segmentControl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSelectedSegmentIndex:", v13);

  }
}

- (BOOL)shouldSelectItemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  int v5;

  -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switchControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(v3, "isSegmentedItem") ^ 1;

  return v5;
}

- (void)didSelectItemAtIndex:(unint64_t)a3
{
  __CFString *v5;
  void *v6;
  id v7;

  -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[UIInputSwitcherView defaultSelectedIndex](self, "defaultSelectedIndex") == a3 && !self->m_isForDictation)
    goto LABEL_17;
  objc_msgSend(v7, "identifier");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray containsObject:](self->m_inputModes, "containsObject:", v5))
  {
    -[UIInputSwitcherView setInputMode:](self, "setInputMode:", v5);
  }
  else
  {
    if (v5 == CFSTR("reporttotypotracker"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "createTypoTrackerReport");
    }
    else
    {
      if (v5 == CFSTR("launchkeyboardsettings"))
      {
        objc_msgSend(MEMORY[0x1E0DBDB40], "launchKeyboardSettings");
        goto LABEL_16;
      }
      if (v5 == CFSTR("launchdictationsettings"))
      {
        objc_msgSend(MEMORY[0x1E0DBDB40], "launchDictationSettings");
        goto LABEL_16;
      }
      if (v5 == CFSTR("dismiss"))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dismissKeyboard");
      }
      else
      {
        if (v5 != CFSTR("launchdictationfeedback") || !os_variant_has_internal_diagnostics())
          goto LABEL_16;
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "launchDictationFeedbackApp");
      }
    }

  }
LABEL_16:

LABEL_17:
  if (-[UIKeyboardMenuView launchedFromKeyboard](self, "launchedFromKeyboard"))
  {
    -[UIInputSwitcherView willFadeForSelectionAtIndex:](self, "willFadeForSelectionAtIndex:", a3);
    -[UIKeyboardMenuView hide](self, "hide");
  }
  else
  {
    -[UIKeyboardMenuView fadeWithDelay:forSelectionAtIndex:](self, "fadeWithDelay:forSelectionAtIndex:", a3, 0.1);
  }
  self->m_isForDictation = 0;

}

- (id)nextInputMode
{
  NSMutableArray *m_inputModes;
  void *v4;
  uint64_t v5;

  m_inputModes = self->m_inputModes;
  if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
    -[UIInputSwitcherView selectedInputMode](self, "selectedInputMode");
  else
    -[UIInputSwitcherView defaultInputMode](self, "defaultInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableArray indexOfObject:](m_inputModes, "indexOfObject:", v4);

  return (id)-[NSMutableArray objectAtIndex:](self->m_inputModes, "objectAtIndex:", (v5 + 1) % (unint64_t)-[NSMutableArray count](self->m_inputModes, "count"));
}

- (void)selectNextInputMode
{
  id v3;

  -[UIInputSwitcherView nextInputMode](self, "nextInputMode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInputSwitcherView setInputMode:](self, "setInputMode:", v3);
  -[UIInputSwitcherView selectRowForInputMode:](self, "selectRowForInputMode:", v3);

}

- (id)previousInputMode
{
  NSMutableArray *m_inputModes;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  m_inputModes = self->m_inputModes;
  if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
    -[UIInputSwitcherView selectedInputMode](self, "selectedInputMode");
  else
    -[UIInputSwitcherView defaultInputMode](self, "defaultInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSMutableArray indexOfObject:](m_inputModes, "indexOfObject:", v4);

  if (v5 <= 0)
  {
    -[UIInputSwitcherView inputModes](self, "inputModes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count");

  }
  -[UIInputSwitcherView inputModes](self, "inputModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v5 - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)selectPreviousInputMode
{
  id v3;

  -[UIInputSwitcherView previousInputMode](self, "previousInputMode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIInputSwitcherView setInputMode:](self, "setInputMode:", v3);
  -[UIInputSwitcherView selectRowForInputMode:](self, "selectRowForInputMode:", v3);

}

- (void)showAsPopupForKey:(id)a3 inLayout:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[UIInputSwitcherView setShowsSwitches:](self, "setShowsSwitches:", 1);
  self->m_isForDictation = objc_msgSend(v7, "interactionType") == 5;
  -[UIKeyboardMenuView setShowingCapsLockSwitcher:](self, "setShowingCapsLockSwitcher:", 0);
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherView;
  -[UIKeyboardMenuView showAsPopupForKey:inLayout:](&v8, sel_showAsPopupForKey_inLayout_, v7, v6);

}

- (BOOL)shouldShow
{
  BOOL v3;
  void *v4;

  -[UIInputSwitcherView _reloadInputSwitcherItems](self, "_reloadInputSwitcherItems");
  if (+[UIKeyboard isShowingEmojiSearch](UIKeyboard, "isShowingEmojiSearch") || self->m_isForDictation)
    return 1;
  -[UIInputSwitcherView inputModes](self, "inputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v4, "count") > 1;

  return v3;
}

- (void)didShow
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  if (self->m_isForDictation)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeDictationLanguage");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (uint64_t)v10;
  }
  else
  {
    UIKeyboardGetCurrentInputMode();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v4;
  if ((-[NSMutableArray containsObject:](self->m_inputModes, "containsObject:", v4) & 1) != 0)
  {
    v5 = v11;
  }
  else
  {
    -[NSMutableArray firstObject](self->m_inputModes, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v12 = v5;
  if (!self->m_isForDictation
    || (+[UIDictationController sharedInstance](UIDictationController, "sharedInstance"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "smartLanguageSelectionOverridden"),
        v7,
        v9 = v12,
        v8))
  {
    -[UIInputSwitcherView selectRowForInputMode:](self, "selectRowForInputMode:", v12);
    v9 = v12;
  }

}

- (void)willFade
{
  -[UIInputSwitcherView willFadeForSelectionAtIndex:](self, "willFadeForSelectionAtIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)willFadeForSelectionAtIndex:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t (**v11)(void);
  int v12;
  void *v13;
  int v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIInputSwitcherGestureState *m_gestureState;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v33 = 656;
  v4 = self->m_inputSwitcherItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "switchControl", v33);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "switchIsOnBlock");
          v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
          v12 = v11[2]();
          objc_msgSend(v9, "switchControl");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isOn");

          if (v12 != v14)
          {
            objc_msgSend(v9, "switchToggleBlock");
            v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "switchControl");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v15[2](v15, objc_msgSend(v16, "isOn"));

          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v6);
  }

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v33), "objectAtIndex:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIInputSwitcherView _itemWithIdentifier:](self, "_itemWithIdentifier:", CFSTR("handbiasswitch"), v33);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18 && v17 == (void *)v18)
  {
    v20 = objc_msgSend(v17, "selectedSegmentIndex");
    if (v20 <= 3)
      v21 = __handBiasOrdering[v20];
    else
      v21 = 0;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_layout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "currentHandBias");

    if (v21 != v24)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "preferencesActions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setHandBias:", v21);

      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "preferencesActions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "performedFirstReachableKeyboardInteraction");

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_layout");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setKeyboardBias:", v21);

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "updateForHandBiasChange");

    }
  }
  m_gestureState = self->m_gestureState;
  self->m_gestureState = 0;

}

- (unint64_t)numberOfItems
{
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
    return 2;
  else
    return -[NSArray count](self->m_inputSwitcherItems, "count");
}

- (CGSize)preferredSize
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSArray *m_inputSwitcherItems;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[4];
  id v23;
  UIInputSwitcherView *v24;
  id v25;
  uint64_t *v26;
  char v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  CGSize result;

  -[UIKeyboardMenuView font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardMenuView subtitleFont](self, "subtitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x2020000000;
  v31 = 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMinimized");

  m_inputSwitcherItems = self->m_inputSwitcherItems;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __36__UIInputSwitcherView_preferredSize__block_invoke;
  v22[3] = &unk_1E16CD5C8;
  v8 = v3;
  v26 = &v28;
  v23 = v8;
  v24 = self;
  v27 = v6;
  v9 = v4;
  v25 = v9;
  -[NSArray enumerateObjectsUsingBlock:](m_inputSwitcherItems, "enumerateObjectsUsingBlock:", v22);
  if (self->super.m_mode)
  {
    +[UIKeyboardImpl keyboardScreen](UIKeyboardImpl, "keyboardScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11 + -50.0;

    v13 = v29[3];
    if (v13 < self->super.m_referenceRect.size.width + 40.0)
      v13 = self->super.m_referenceRect.size.width + 40.0;
    if (v12 < v13)
      v13 = v12;
    v29[3] = v13;
    v14 = self->super.m_referenceRect.size.height + 50.0;
  }
  else
  {
    v14 = 50.0;
  }
  if (-[UIKeyboardMenuView usesTable](self, "usesTable"))
    v14 = (double)self->super.m_visibleRows * 50.0;
  -[UIInputSwitcherView _itemWithIdentifier:](self, "_itemWithIdentifier:", CFSTR("handbiasswitch"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "segmentImages");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIInputSwitcherSegmentedTableCell preferredSizeWithSegmentCount:](UIInputSwitcherSegmentedTableCell, "preferredSizeWithSegmentCount:", objc_msgSend(v17, "count"));
    v19 = v18;

    if (v19 < v29[3])
      v19 = v29[3];
    v29[3] = v19;
    v14 = v14 + 4.0;
  }
  else
  {
    v19 = v29[3];
  }

  _Block_object_dispose(&v28, 8);
  v20 = v19;
  v21 = v14;
  result.height = v21;
  result.width = v20;
  return result;
}

void __36__UIInputSwitcherView_preferredSize__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  objc_msgSend(v22, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_legacy_sizeWithFont:", *(_QWORD *)(a1 + 32));
  v7 = v6 + 48.0;
  objc_msgSend(v22, "switchControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v22, "switchControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v7 = v7 + v10;

  }
  objc_msgSend(v22, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(double *)(v12 + 24) < v7)
    *(double *)(v12 + 24) = v7;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "identifierIsValidSystemInputMode:", v11);

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "inputModes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardInputModesMatchingMode((uint64_t)v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (unint64_t)objc_msgSend(v16, "count") > 1;

  }
  else
  {
    v17 = 0;
  }
  if (!*(_BYTE *)(a1 + 64) && v14 ^ 1 | v17)
  {
    objc_msgSend(*(id *)(a1 + 40), "subtitleForItemAtIndex:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(v18, "_legacy_sizeWithFont:", *(_QWORD *)(a1 + 48));
      v20 = v19 + 48.0;
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (*(double *)(v21 + 24) < v20)
        *(double *)(v21 + 24) = v20;
    }

  }
}

- (id)_itemWithIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->m_inputSwitcherItems;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)defaultInputMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->m_isForDictation)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isUsingDictationLayout") & 1) != 0)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentInputModeForDictation");
    }
    else
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentInputMode");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictationLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    UIKeyboardGetCurrentInputMode();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((-[NSMutableArray containsObject:](self->m_inputModes, "containsObject:", v5) & 1) == 0)
  {
    -[NSMutableArray firstObject](self->m_inputModes, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

- (unint64_t)defaultSelectedIndex
{
  void *v4;
  unint64_t v5;

  if (self->m_isForDictation)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[UIInputSwitcherView defaultInputMode](self, "defaultInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIInputSwitcherView _indexOfInputSwitcherItemWithIdentifier:](self, "_indexOfInputSwitcherItemWithIdentifier:", v4);

  return v5;
}

- (id)titleForItemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->m_inputSwitcherItems, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedTitleForItemAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->m_inputSwitcherItems, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fontForItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->m_inputSwitcherItems, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIKeyboardMenuView font](self, "font");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)subtitleForItemAtIndex:(unint64_t)a3
{
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMinimized");

  if ((v6 & 1) != 0)
  {
    v7 = &stru_1E16EDF20;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->m_inputSwitcherItems, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedSubtitle");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)subtitleFontForItemAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->m_inputSwitcherItems, "objectAtIndexedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIKeyboardMenuView subtitleFont](self, "subtitleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3
{
  void *v3;
  char v4;

  -[NSArray objectAtIndexedSubscript:](self->m_inputSwitcherItems, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesDeviceLanguage");

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  +[UIInputSwitcherTableCell reuseIdentifier](UIInputSwitcherTableCell, "reuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isSegmentedItem"))
  {
    +[UIInputSwitcherTableCell reuseIdentifier](UIInputSwitcherSegmentedTableCell, "reuseIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputSwitcherView customizeCell:forItemAtIndex:](self, "customizeCell:forItemAtIndex:", v11, objc_msgSend(v7, "row"));

  return v11;
}

- (void)customizeCell:(id)a3 forItemAtIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t (**v13)(void);
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  objc_super v36;

  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)UIInputSwitcherView;
  -[UIKeyboardMenuView customizeCell:forItemAtIndex:](&v36, sel_customizeCell_forItemAtIndex_, v6, a4);
  v7 = a4;
  if (-[UIKeyboardMenuView showingCapsLockSwitcher](self, "showingCapsLockSwitcher"))
  {
    v8 = -[UIKeyboardMenuView indexForSelectedFastSwitchMode](self, "indexForSelectedFastSwitchMode");
    v9 = -[UIKeyboardMenuView indexForUnselectedFastSwitchMode](self, "indexForUnselectedFastSwitchMode");
    if (a4 == 1)
    {
      if (v8 < v9)
      {
LABEL_5:
        v10 = -[UIKeyboardMenuView indexForUnselectedFastSwitchMode](self, "indexForUnselectedFastSwitchMode");
LABEL_8:
        v7 = v10;
        goto LABEL_9;
      }
    }
    else
    {
      v7 = a4;
      if (a4)
        goto LABEL_9;
      if (v8 >= v9)
        goto LABEL_5;
    }
    v10 = -[UIKeyboardMenuView indexForSelectedFastSwitchMode](self, "indexForSelectedFastSwitchMode");
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(v6, "setInteractiveInsets:", 0.0, 0.0, 0.0, 0.0);
  -[NSArray objectAtIndex:](self->m_inputSwitcherItems, "objectAtIndex:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switchControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "switchControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "switchIsOnBlock");
    v13 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v14 = v13[2]();
    objc_msgSend(v11, "switchControl");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setOn:", v14);

    objc_msgSend(v6, "textLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", 0);

  }
  if (objc_msgSend(v11, "isSegmentedItem"))
  {
    v17 = v6;
    objc_msgSend(v11, "segmentImages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      objc_msgSend(v11, "segmentImages");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "segmentControl");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setSegmentImages:", v20);

    }
    objc_msgSend(v11, "segmentTitles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      objc_msgSend(v11, "segmentTitles");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "segmentControl");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSegmentTitles:", v24);

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_layout");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "currentHandBias");

    for (i = 0; i != 3; ++i)
    {
      if (__handBiasOrdering[i] == v28)
        break;
    }
    objc_msgSend(v17, "segmentControl");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setSelectedSegmentIndex:", i);

    objc_msgSend(v17, "segmentControl");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel__segmentControlValueDidChange_, 4096);

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "preferencesActions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isFirstReachableKeyboardInteraction");

    if ((v34 & 1) == 0 && -[NSArray count](self->m_inputSwitcherItems, "count") - 1 == a4)
      objc_msgSend(v17, "setInteractiveInsets:", 0.0, 0.0, -50.0, 0.0);

  }
  objc_msgSend(v6, "setAccessoryView:", v12);
  objc_msgSend(v6, "textLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setAlpha:", 1.0);

}

- (void)switchAction
{
  -[UIInputSwitcherView didSelectItemAtIndex:](self, "didSelectItemAtIndex:", 0);
}

- (BOOL)_isHandBiasSwitchVisible
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = -[UIInputSwitcherView showsSwitches](self, "showsSwitches");
  if (v2)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsReachableKeyboard");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)didHitDockItemWithinTypingWindow
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  double v7;
  double v8;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastTouchUpTimestamp");
  v8 = v7;

  return CFAbsoluteTimeGetCurrent() - v8 < 0.325;
}

- (id)buttonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5 isForDictation:(BOOL)a6 tapAction:(id)a7
{
  return -[UIInputSwitcherView buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:](self, "buttonPressed:withEvent:location:isLocationInsideViewHitArea:isForDictation:tapAction:", a3, a4, 1, a6, a7, a5.x, a5.y);
}

- (id)buttonPressed:(id)a3 withEvent:(id)a4 location:(CGPoint)a5 isLocationInsideViewHitArea:(BOOL)a6 isForDictation:(BOOL)a7 tapAction:(id)a8
{
  _BOOL4 v9;
  double y;
  double x;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  UIInputSwitcherGestureState *v28;
  UIInputSwitcherGestureState *m_gestureState;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  dispatch_time_t v35;
  UIInputSwitcherGestureState **p_m_gestureState;
  double v37;
  double v38;
  double v39;
  _BOOL4 v40;
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
  void *v51;
  void *v52;
  double v53;
  void *v54;
  UIInputSwitcherGestureState *v55;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  id v61;
  _QWORD block[5];
  id v63;
  id v64;
  double v65;
  double v66;
  double v67;
  BOOL v68;
  CGPoint v69;
  CGPoint v70;
  CGRect v71;
  CGRect v72;

  v9 = a7;
  y = a5.y;
  x = a5.x;
  v15 = a3;
  v16 = (void (**)(_QWORD))a8;
  objc_msgSend(a4, "touchesForView:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "locationInView:", self);
  v20 = v19;
  v22 = v21;
  objc_msgSend(v15, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "locationInView:", v23);
  v25 = v24;
  v27 = v26;

  switch(objc_msgSend(v18, "phase"))
  {
    case 0:
      if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
        -[UIKeyboardMenuView hide](self, "hide");
      self->m_isForDictation = v9;
      v28 = objc_alloc_init(UIInputSwitcherGestureState);
      m_gestureState = self->m_gestureState;
      self->m_gestureState = v28;

      -[UIInputSwitcherGestureState setTouchDown:](self->m_gestureState, "setTouchDown:", CFAbsoluteTimeGetCurrent());
      -[UIInputSwitcherGestureState setFirstReferencePoint:](self->m_gestureState, "setFirstReferencePoint:", v25, v27);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastTouchDownTimestamp");
      -[UIInputSwitcherGestureState setLastSeenKeyboardTouchDown:](self->m_gestureState, "setLastSeenKeyboardTouchDown:");

      if (TIGetGlobeButtonDelayValue_onceToken != -1)
        dispatch_once(&TIGetGlobeButtonDelayValue_onceToken, &__block_literal_global_434);
      objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "valueForPreferenceKey:", CFSTR("GlobeButtonDelay"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "doubleValue");
      v34 = v33;

      if (-[UIInputSwitcherGestureState gestureConflictsWithTypingWindow](self->m_gestureState, "gestureConflictsWithTypingWindow"))
      {
        v34 = v34 + v34;
      }
      v35 = dispatch_time(0, (uint64_t)(v34 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __109__UIInputSwitcherView_buttonPressed_withEvent_location_isLocationInsideViewHitArea_isForDictation_tapAction___block_invoke;
      block[3] = &unk_1E16CD5F0;
      block[4] = self;
      v65 = v34;
      v68 = a6;
      v63 = v18;
      v66 = x;
      v67 = y;
      v64 = v15;
      dispatch_after(v35, MEMORY[0x1E0C80D38], block);

      goto LABEL_27;
    case 1:
      p_m_gestureState = &self->m_gestureState;
      -[UIInputSwitcherGestureState firstReferencePoint](self->m_gestureState, "firstReferencePoint");
      v38 = v37;
      if (!-[UIInputSwitcherGestureState didMoveBeyondThreshold](self->m_gestureState, "didMoveBeyondThreshold"))
        -[UIInputSwitcherGestureState setDidMoveBeyondThreshold:](*p_m_gestureState, "setDidMoveBeyondThreshold:", vabdd_f64(v27, v38) > 25.0);
      if (!-[UIInputSwitcherGestureState didMoveBeyondThreshold](*p_m_gestureState, "didMoveBeyondThreshold"))
        goto LABEL_28;
      if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
      {
        -[UIInputSwitcherView updateSelectionWithPoint:](self, "updateSelectionWithPoint:", v20, v22);
      }
      else
      {
        if (!+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
        {
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setReasonType:", 16);

          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "stopDictation");

        }
        -[UIInputSwitcherView setShowsSwitches:](self, "setShowsSwitches:", 1);
        objc_msgSend(v18, "timestamp");
        -[UIKeyboardMenuView showAsHUDFromLocation:withInputView:touchBegan:](self, "showAsHUDFromLocation:withInputView:touchBegan:", v15, x, y, v53);
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "_tagTouchForTypingMenu:", objc_msgSend(v18, "_touchIdentifier"));

      }
      -[UIInputSwitcherGestureState setHideSwitcher:](*p_m_gestureState, "setHideSwitcher:", 1);
      goto LABEL_27;
    case 3:
      -[UIInputSwitcherGestureState touchDown](self->m_gestureState, "touchDown");
      if (v39 == 0.0)
        goto LABEL_27;
      -[UIInputSwitcherGestureState setTouchDown:](self->m_gestureState, "setTouchDown:", 0.0);
      v40 = -[UIInputSwitcherGestureState gestureConflictsWithTypingWindow](self->m_gestureState, "gestureConflictsWithTypingWindow");
      if (!-[UIKeyboardMenuView isVisible](self, "isVisible"))
      {
        objc_msgSend(v15, "bounds");
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;
        objc_msgSend(v18, "locationInView:", v15);
        v69.x = v49;
        v69.y = v50;
        v71.origin.x = v42;
        v71.origin.y = v44;
        v71.size.width = v46;
        v71.size.height = v48;
        if (CGRectContainsPoint(v71, v69) && !v40)
        {
          if (!v16)
          {
            v61 = -[UIInputSwitcherView nextInputMode](self, "nextInputMode");
            goto LABEL_27;
          }
LABEL_34:
          v16[2](v16);
          goto LABEL_27;
        }
      }
      if (!-[UIKeyboardMenuView isVisible](self, "isVisible"))
        goto LABEL_27;
      if (-[UIInputSwitcherGestureState didMoveBeyondThreshold](self->m_gestureState, "didMoveBeyondThreshold"))
      {
        -[UIKeyboardMenuView interactiveBounds](self, "interactiveBounds");
        v70.x = v20;
        v70.y = v22;
        if (CGRectContainsPoint(v72, v70))
        {
          -[UIKeyboardMenuView selectItemAtPoint:](self, "selectItemAtPoint:", v20, v22);
          goto LABEL_27;
        }
      }
      if (v9)
      {
        +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "currentInputMode");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v57, "isEqual:", v59);

        if ((v60 & 1) == 0)
          goto LABEL_34;
      }
      if (-[UIInputSwitcherGestureState hideSwitcher](self->m_gestureState, "hideSwitcher"))
LABEL_22:
        -[UIKeyboardMenuView hide](self, "hide");
LABEL_27:
      p_m_gestureState = &self->m_gestureState;
LABEL_28:
      v55 = *p_m_gestureState;

      return v55;
    case 4:
      -[UIInputSwitcherGestureState setTouchDown:](self->m_gestureState, "setTouchDown:", 0.0);
      if (-[UIKeyboardMenuView isVisible](self, "isVisible"))
        goto LABEL_22;
      goto LABEL_27;
    default:
      goto LABEL_27;
  }
}

uint64_t __109__UIInputSwitcherView_buttonPressed_withEvent_location_isLocationInsideViewHitArea_isForDictation_tapAction___block_invoke(uint64_t a1)
{
  double Current;
  double v3;
  double v4;
  double v5;
  int v6;
  uint64_t result;
  double v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "touchDown");
  v4 = v3;
  v5 = *(double *)(a1 + 56);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "gestureConflictsWithTypingWindow");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "touchDown");
  if (v8 > 0.0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isVisible");
    v9 = Current - v4 < v5 ? 1 : result;
    if (((v9 | v6) & 1) == 0 && *(_BYTE *)(a1 + 80))
    {
      if (!+[UIKeyboard isModelessActive](UIKeyboard, "isModelessActive"))
      {
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setReasonType:", 16);

        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stopDictation");

      }
      objc_msgSend(*(id *)(a1 + 32), "setShowsSwitches:", 1);
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_tagTouchForTypingMenu:", objc_msgSend(*(id *)(a1 + 40), "_touchIdentifier"));

      objc_msgSend(*(id *)(a1 + 32), "setShowingCapsLockSwitcher:", 0);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "timestamp");
      objc_msgSend(v14, "showAsHUDFromLocation:withInputView:touchBegan:", v13, *(double *)(a1 + 64), *(double *)(a1 + 72), v15);
      return +[UIKBAnalyticsDispatcher globeKeyLongPress](UIKBAnalyticsDispatcher, "globeKeyLongPress");
    }
  }
  return result;
}

- (NSArray)inputModes
{
  return &self->m_inputModes->super;
}

- (id)finishSplitTransitionBlock
{
  return self->m_finishSplitTransitionBlock;
}

- (void)setFinishSplitTransitionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (BOOL)messagesWriteboardFromSwitcher
{
  return self->_messagesWriteboardFromSwitcher;
}

- (void)setMessagesWriteboardFromSwitcher:(BOOL)a3
{
  self->_messagesWriteboardFromSwitcher = a3;
}

- (BOOL)fileReportFromSwitcher
{
  return self->_fileReportFromSwitcher;
}

- (void)setFileReportFromSwitcher:(BOOL)a3
{
  self->_fileReportFromSwitcher = a3;
}

- (BOOL)showsSwitches
{
  return self->_showsSwitches;
}

- (void)setShowsSwitches:(BOOL)a3
{
  self->_showsSwitches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->m_finishSplitTransitionBlock, 0);
  objc_storeStrong((id *)&self->m_gestureState, 0);
  objc_storeStrong((id *)&self->m_inputSwitcherItems, 0);
  objc_storeStrong((id *)&self->m_inputModes, 0);
}

@end
