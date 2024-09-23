@implementation UIKeyboardInputModeController

+ (id)sharedInputModeController
{
  if (qword_1ECD78FD8 != -1)
    dispatch_once(&qword_1ECD78FD8, &__block_literal_global_305);
  return (id)qword_1ECD78FD0;
}

- (UIKeyboardInputMode)currentInputMode
{
  UIKeyboardInputModeController *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_currentInputMode)
  {
    -[UIKeyboardInputModeController currentInputModeInPreference](v2, "currentInputModeInPreference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController updateCurrentInputMode:](v2, "updateCurrentInputMode:", v3);

  }
  objc_sync_exit(v2);

  return v2->_currentInputMode;
}

- (UIKeyboardInputMode)currentSystemInputMode
{
  return (UIKeyboardInputMode *)-[UIKeyboardInputModeController currentSystemInputModeExcludingEmoji:](self, "currentSystemInputModeExcludingEmoji:", 1);
}

- (id)currentSystemInputModeExcludingEmoji:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__UIKeyboardInputModeController_currentSystemInputModeExcludingEmoji___block_invoke;
  v4[3] = &unk_1E16CCCF0;
  v5 = a3;
  v4[4] = self;
  -[UIKeyboardInputModeController _systemInputModePassingLanguageTest:](self, "_systemInputModePassingLanguageTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_trackInputModeIfNecessary:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;

  v35 = a3;
  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = objc_msgSend(v35, "_requiresKeyboardWhenFirstResponder");

      if (v6)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "inputDelegateManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "textInputTraits");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "keyboardType");

        if (v10 != 124)
        {
          -[UIKeyboardInputModeController inputModeContextIdentifier](self, "inputModeContextIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "textInputContextIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = KBEqualStrings(v11, v12);

          if ((v13 & 1) == 0)
          {
            objc_msgSend(v35, "textInputContextIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardInputModeController setInputModeContextIdentifier:](self, "setInputModeContextIdentifier:", v14);

            -[UIKeyboardInputModeController inputModeContextIdentifier](self, "inputModeContextIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("UITextInputContextIdentifiers"));
              -[UIKeyboardInputModeController _prefixedKey](self, "_prefixedKey");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                objc_msgSend(v16, "objectForKey:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v18)
                  -[UIKeyboardInputModeController _inputModeChangedWhileContextTracked](self, "_inputModeChangedWhileContextTracked");

              }
            }
          }
          -[UIKeyboardInputModeController inputModeContextIdentifier](self, "inputModeContextIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v35, "textInputMode");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardInputModeController lastUsedInputModeForTextInputMode:](self, "lastUsedInputModeForTextInputMode:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v21)
              goto LABEL_23;
            -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEqual:", v21);

            if ((v23 & 1) != 0)
              goto LABEL_23;
            -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "containsObject:", v21);

            if (v25)
            {
              -[UIKeyboardInputModeController setCurrentInputMode:](self, "setCurrentInputMode:", v21);
            }
            else
            {
              -[UIKeyboardInputModeController inputModeContextIdentifier](self, "inputModeContextIdentifier");
              v26 = objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                v27 = (void *)v26;
                +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "preferencesActions");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v29, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBDDE8]) & 1) != 0)
                {
                  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "preferencesActions");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "valueForPreferenceKey:", *MEMORY[0x1E0DBDDF0]);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "identifier");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v32, "containsObject:", v33);

                  if ((v34 & 1) != 0)
                    goto LABEL_23;
                }
                else
                {

                }
                -[UIKeyboardInputModeController _inputModeChangedWhileContextTracked](self, "_inputModeChangedWhileContextTracked");
              }
            }
LABEL_23:

          }
        }
      }
    }
  }

}

- (BOOL)isDictationLanguageEnabled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v4);

  if ((v6 & 1) == 0)
  {
    -[UIKeyboardInputModeController updateEnabledDictationLanguages:](self, "updateEnabledDictationLanguages:", 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v7, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLValue"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictationConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "dictationIsAvailableForLanguage:", v4);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)defaultDictationLanguages:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultDictationLanguagesForKeyboardLanguage:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)enabledInputModeIdentifiers:(BOOL)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  _BOOL4 skipExtensionInputModes;
  void *v26;
  void *v27;
  char v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  unint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  UIKeyboardInputModeController *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  int v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;
  BOOL v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBDDE8]);

  if ((v7 & 1) == 0)
  {
    v16 = -[UIKeyboardInputModeController defaultEnabledInputModesForCurrentLocale:](self, "defaultEnabledInputModesForCurrentLocale:", 1);
    -[UIKeyboardInputModeController defaultInputModes](self, "defaultInputModes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setEnabledInputModes:](self, "setEnabledInputModes:", v17);

    -[UIKeyboardInputModeController defaultNormalizedInputModes](self, "defaultNormalizedInputModes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setNormalizedInputModes:](self, "setNormalizedInputModes:", v18);

    -[UIKeyboardInputModeController defaultKeyboardInputModes](self, "defaultKeyboardInputModes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setKeyboardInputModes:](self, "setKeyboardInputModes:", v19);

    -[UIKeyboardInputModeController defaultInputModes](self, "defaultInputModes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setKeyboardInputModeIdentifiers:](self, "setKeyboardInputModeIdentifiers:", v20);

    -[UIKeyboardInputModeController updateUserSelectableInputModes](self, "updateUserSelectableInputModes");
    goto LABEL_60;
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferencesActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForPreferenceKey:", *MEMORY[0x1E0DBDDF0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController appendPasscodeInputModes:](self, "appendPasscodeInputModes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardInputModeController inputModesByAppendingApplicationLanguagesToInputModes:](self, "inputModesByAppendingApplicationLanguagesToInputModes:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textInputTraits");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v14, "loadKeyboardsForSiriLanguage");

  if ((_DWORD)v10)
  {
    -[UIKeyboardInputModeController filteredInputModesForSiriLanguageFromInputModes:](self, "filteredInputModesForSiriLanguageFromInputModes:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_13:

    v12 = (void *)v15;
    goto LABEL_14;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !-[UIKeyboardInputModeController disableFloatingKeyboardFilter](self, "disableFloatingKeyboardFilter")
    && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    -[UIKeyboardInputModeController inputModesFromIdentifiers:](self, "inputModesFromIdentifiers:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = &unk_1E1A9B338;
    goto LABEL_12;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    -[UIKeyboardInputModeController inputModesFromIdentifiers:](self, "inputModesFromIdentifiers:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = &unk_1E1A9B360;
LABEL_12:
    -[UIKeyboardInputModeController filteredPadInputModesFromInputModes:withRules:](self, "filteredPadInputModesFromInputModes:withRules:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();

    -[UIKeyboardInputModeController identifiersFromInputModes:](self, "identifiersFromInputModes:", v23);
    v15 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v23;
    goto LABEL_13;
  }
LABEL_14:
  v24 = !-[UIKeyboardInputModeController verifyKeyboardExtensionsWithApp](self, "verifyKeyboardExtensionsWithApp");
  if (self->_excludeExtensionInputModes == v24)
  {
    if (self->_cacheNeedsRefresh)
    {
      skipExtensionInputModes = self->_skipExtensionInputModes;
      self->_excludeExtensionInputModes = v24;
      if (!skipExtensionInputModes)
        goto LABEL_24;
    }
    else
    {
      self->_excludeExtensionInputModes = v24;
    }
    -[UIKeyboardInputModeController enabledInputModes](self, "enabledInputModes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "count"))
    {
      -[UIKeyboardInputModeController enabledInputModes](self, "enabledInputModes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToArray:", v12);

      if ((v28 & 1) != 0)
        goto LABEL_59;
    }
    else
    {

    }
    goto LABEL_24;
  }
  self->_excludeExtensionInputModes = v24;
LABEL_24:
  v61 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v60 = v12;
  v29 = v12;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
  if (!v30)
    goto LABEL_54;
  v31 = v30;
  v32 = *(_QWORD *)v71;
  do
  {
    v33 = 0;
    v64 = v31;
    do
    {
      if (*(_QWORD *)v71 != v32)
        objc_enumerationMutation(v29);
      v34 = *(id *)(*((_QWORD *)&v70 + 1) + 8 * v33);
      if (!-[UIKeyboardInputModeController identifierIsValidSystemInputMode:](self, "identifierIsValidSystemInputMode:", v34))
      {
        if (-[UIKeyboardInputModeController isLockscreenPasscodeKeyboard](self, "isLockscreenPasscodeKeyboard"))
          goto LABEL_49;
LABEL_36:
        v34 = v34;
        v40 = v34;
        if (-[UIKeyboardInputModeController identifierIsValidSystemInputMode:](self, "identifierIsValidSystemInputMode:", v34))
        {
          UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v41)
        {
          if (!objc_msgSend(v41, "isExtensionInputMode")
            || (objc_msgSend(v66, "containsObject:", v34) & 1) != 0)
          {
            v43 = v32;
            v44 = self;
            v45 = v29;
            TIInputModeGetNormalizedIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            KBStarLayoutString(v34);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            UIKeyboardInputModeWithNewSWLayout((uint64_t)v34, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v65, "containsObject:", v46)
              || (objc_msgSend(v66, "containsObject:", v40) & 1) == 0
              && objc_msgSend(v34, "isEqualToString:", v48))
            {
              objc_msgSend(v66, "addObject:", v40);
              objc_msgSend(v65, "addObject:", v46);
              objc_msgSend(v62, "addObject:", v42);
              objc_msgSend(v63, "addObject:", v40);
            }

            v29 = v45;
            self = v44;
            v32 = v43;
            v31 = v64;
            goto LABEL_48;
          }
          if (!self->_excludeExtensionInputModes)
          {
            objc_msgSend(v66, "addObject:", v34);
            objc_msgSend(v65, "addObject:", v34);
            objc_msgSend(v62, "addObject:", v42);
            v49 = v63;
LABEL_47:
            objc_msgSend(v49, "addObject:", v34);
          }
LABEL_48:

          goto LABEL_49;
        }
        objc_msgSend(v66, "addObject:", v34);
        v49 = v65;
        goto LABEL_47;
      }
      if (objc_msgSend(v34, "rangeOfString:", CFSTR("@")) != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_36;
      TICanonicalInputModeName();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = MEMORY[0x1E0C809B0];
      v67[1] = 3221225472;
      v67[2] = __76__UIKeyboardInputModeController_Compatibility__enabledInputModeIdentifiers___block_invoke;
      v67[3] = &unk_1E16CCF68;
      v34 = v34;
      v68 = v34;
      v36 = v35;
      v69 = v36;
      objc_msgSend(v29, "indexesOfObjectsPassingTest:", v67);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");
      if (v38 <= 1)
      {
        v39 = v36;

        v34 = v39;
      }

      if (v38 < 2)
        goto LABEL_36;
LABEL_49:

      ++v33;
    }
    while (v31 != v33);
    v50 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    v31 = v50;
  }
  while (v50);
LABEL_54:

  if (!objc_msgSend(v62, "count")
    || objc_msgSend(v62, "count") == 1
    && (objc_msgSend(v62, "firstObject"),
        v51 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v51, "primaryLanguage"),
        v52 = (void *)objc_claimAutoreleasedReturnValue(),
        v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("emoji")),
        v52,
        v51,
        v53))
  {
    v54 = -[UIKeyboardInputModeController defaultEnabledInputModesForCurrentLocale:](self, "defaultEnabledInputModesForCurrentLocale:", 1);
    -[UIKeyboardInputModeController defaultInputModes](self, "defaultInputModes");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setArray:", v55);

    -[UIKeyboardInputModeController defaultNormalizedInputModes](self, "defaultNormalizedInputModes");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setArray:", v56);

    -[UIKeyboardInputModeController defaultKeyboardInputModes](self, "defaultKeyboardInputModes");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setArray:", v57);

    -[UIKeyboardInputModeController defaultInputModes](self, "defaultInputModes");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setArray:", v58);

  }
  -[UIKeyboardInputModeController setEnabledInputModes:](self, "setEnabledInputModes:", v66);
  -[UIKeyboardInputModeController setNormalizedInputModes:](self, "setNormalizedInputModes:", v65);
  -[UIKeyboardInputModeController setKeyboardInputModes:](self, "setKeyboardInputModes:", v62);
  -[UIKeyboardInputModeController setKeyboardInputModeIdentifiers:](self, "setKeyboardInputModeIdentifiers:", v63);
  -[UIKeyboardInputModeController updateUserSelectableInputModes](self, "updateUserSelectableInputModes");

  a3 = v61;
  v12 = v60;
LABEL_59:

LABEL_60:
  self->_cacheNeedsRefresh = 0;
  if (a3)
    -[UIKeyboardInputModeController normalizedInputModes](self, "normalizedInputModes");
  else
    -[UIKeyboardInputModeController enabledInputModes](self, "enabledInputModes");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)enabledInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSArray)defaultInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (id)inputModesByAppendingApplicationLanguagesToInputModes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardInputModeController additionalTextInputLocales](self, "additionalTextInputLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = v4;
  if (v6)
  {
    v7 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v35 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v48 != v12)
            objc_enumerationMutation(v9);
          TIInputModeGetLanguage();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v8, "addObject:", v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v11);
    }
    v34 = v9;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localeIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[UIKeyboardInputModeController additionalTextInputLocales](self, "additionalTextInputLocales");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v44;
      do
      {
        v19 = 0;
        v37 = v17;
        do
        {
          if (*(_QWORD *)v44 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v19);
          objc_msgSend(v20, "localeIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetLanguage();
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v8, "containsObject:", v22) & 1) == 0)
          {
            v23 = v8;
            objc_msgSend(v8, "addObject:", v22);
            v24 = (void *)MEMORY[0x1E0DBDBA8];
            objc_msgSend(v20, "localeIdentifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "_inputModesForLocale:language:modeFetcher:", v36, v25, &__block_literal_global_989);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = 0u;
            v42 = 0u;
            v39 = 0u;
            v40 = 0u;
            v27 = v26;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v40;
              do
              {
                for (j = 0; j != v29; ++j)
                {
                  if (*(_QWORD *)v40 != v30)
                    objc_enumerationMutation(v27);
                  v32 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
                  if ((objc_msgSend(v7, "containsObject:", v32) & 1) == 0)
                    objc_msgSend(v7, "addObject:", v32);
                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
              }
              while (v29);
            }

            v17 = v37;
            v8 = v23;
          }

          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
      }
      while (v17);
    }

    v4 = v35;
  }

  return v7;
}

- (NSArray)additionalTextInputLocales
{
  return self->_additionalTextInputLocales;
}

- (NSArray)defaultNormalizedInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)verifyKeyboardExtensionsWithApp
{
  void *v2;
  char v3;

  objc_msgSend((id)UIApp, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "application:shouldAllowExtensionPointIdentifier:", UIApp, CFSTR("com.apple.keyboard-service"));
  else
    v3 = 1;

  return v3;
}

- (void)setNormalizedInputModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setKeyboardInputModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void)setKeyboardInputModeIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setEnabledInputModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSArray)defaultKeyboardInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (id)defaultEnabledInputModesForCurrentLocale:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
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
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputModeController defaultRawInputModes](self, "defaultRawInputModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputTraits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loadKeyboardsForSiriLanguage");

  if (v9)
  {
    -[UIKeyboardInputModeController suggestedInputModesForSiriLanguage](self, "suggestedInputModesForSiriLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "primaryLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    TIGetDefaultInputModesForLanguage();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController filteredInputModesForSiriLanguageFromInputModes:](self, "filteredInputModesForSiriLanguageFromInputModes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "defaultEnabledInputModesForCurrentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController appendPasscodeInputModes:](self, "appendPasscodeInputModes:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKeyboardInputModeController inputModesByAppendingApplicationLanguagesToInputModes:](self, "inputModesByAppendingApplicationLanguagesToInputModes:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if ((objc_msgSend(v15, "isEqualToArray:", v6) & 1) == 0)
  {
    v31 = a3;
    v32 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v15;
    v20 = v15;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(*(void **)(*((_QWORD *)&v34 + 1) + 8 * i));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26 && (objc_msgSend(v19, "containsObject:", v25) & 1) == 0)
          {
            objc_msgSend(v26, "normalizedIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v27);

            objc_msgSend(v19, "addObject:", v25);
            objc_msgSend(v33, "addObject:", v26);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v22);
    }

    -[UIKeyboardInputModeController setDefaultRawInputModes:](self, "setDefaultRawInputModes:", v20);
    -[UIKeyboardInputModeController setDefaultKeyboardInputModes:](self, "setDefaultKeyboardInputModes:", v33);
    -[UIKeyboardInputModeController setDefaultNormalizedInputModes:](self, "setDefaultNormalizedInputModes:", v18);
    -[UIKeyboardInputModeController setDefaultInputModes:](self, "setDefaultInputModes:", v19);

    v6 = v32;
    a3 = v31;
    v15 = v30;
  }
  -[UIKeyboardInputModeController updateDefaultInputModesIfNecessaryForIdiom](self, "updateDefaultInputModesIfNecessaryForIdiom");
  if (a3)
    -[UIKeyboardInputModeController defaultNormalizedInputModes](self, "defaultNormalizedInputModes");
  else
    -[UIKeyboardInputModeController defaultInputModes](self, "defaultInputModes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void)updateDefaultInputModesIfNecessaryForIdiom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!-[UIKeyboardInputModeController disableFloatingKeyboardFilter](self, "disableFloatingKeyboardFilter")
      && !+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      -[UIKeyboardInputModeController defaultKeyboardInputModes](self, "defaultKeyboardInputModes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = &unk_1E1A9B2C0;
      goto LABEL_8;
    }
    if (+[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
    {
      -[UIKeyboardInputModeController defaultKeyboardInputModes](self, "defaultKeyboardInputModes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = &unk_1E1A9B2E8;
LABEL_8:
      -[UIKeyboardInputModeController filteredPadInputModesFromInputModes:withRules:](self, "filteredPadInputModesFromInputModes:withRules:", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputModeController setDefaultKeyboardInputModes:](self, "setDefaultKeyboardInputModes:", v5);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputModeController defaultKeyboardInputModes](self, "defaultKeyboardInputModes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __75__UIKeyboardInputModeController_updateDefaultInputModesIfNecessaryForIdiom__block_invoke;
      v11[3] = &unk_1E16CCD80;
      v12 = v6;
      v13 = v7;
      v9 = v7;
      v10 = v6;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

      -[UIKeyboardInputModeController setDefaultInputModes:](self, "setDefaultInputModes:", v10);
      -[UIKeyboardInputModeController setDefaultNormalizedInputModes:](self, "setDefaultNormalizedInputModes:", v9);
      -[UIKeyboardInputModeController setDefaultRawInputModes:](self, "setDefaultRawInputModes:", v9);

    }
  }
}

- (NSArray)defaultRawInputModes
{
  return self->defaultRawInputModes;
}

- (id)appendPasscodeInputModes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) != 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "keyboardAppearance");

    v20 = v4;
    if (v8 == 127)
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferencesActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForPreferenceKey:", *MEMORY[0x1E0DBDE00]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v4;
      if (v11)
      {
        v12 = v4;
        v20 = (id)objc_msgSend(v4, "mutableCopy");
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v23 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
              if (-[UIKeyboardInputModeController identifierIsValidSystemInputMode:](self, "identifierIsValidSystemInputMode:", v18))
              {
                v21[0] = MEMORY[0x1E0C809B0];
                v21[1] = 3221225472;
                v21[2] = __58__UIKeyboardInputModeController_appendPasscodeInputModes___block_invoke;
                v21[3] = &unk_1E16CCDA8;
                v21[4] = v18;
                if (objc_msgSend(v12, "indexOfObjectPassingTest:", v21) == 0x7FFFFFFFFFFFFFFFLL)
                  objc_msgSend(v20, "addObject:", v18);
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v15);
        }

        v4 = v12;
      }

    }
  }
  else
  {

    v20 = v4;
  }

  return v20;
}

- (id)_systemInputModePassingLanguageTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int IsNonLinguistic;
  id *v10;
  id v11;
  unsigned int (**v12)(id, void *);
  id v13;
  void *v14;
  void *v15;
  char v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  char v25;
  uint64_t v26;
  _QWORD v28[4];
  id v29;
  unsigned int (**v30)(id, void *);
  _QWORD v31[4];
  id v32;

  v4 = a3;
  -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "normalizedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsNonLinguistic = UIKeyboardInputModeIsNonLinguistic(v8);

    if (!IsNonLinguistic)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke_2;
      v28[3] = &unk_1E16CCCA8;
      v10 = (id *)&v30;
      v12 = (unsigned int (**)(id, void *))v4;
      v30 = v12;
      v13 = v6;
      v29 = v13;
      -[UIKeyboardInputModeController _systemInputModePassingTest:](self, "_systemInputModePassingTest:", v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "primaryLanguage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isEqualToString:", v15);

      v17 = &off_1E167A000;
      if ((v16 & 1) != 0)
      {
        v18 = v14;
      }
      else
      {
        TIGetDefaultInputModesForLanguage();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = &off_1E167A000;
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isExtensionInputMode");

          if (v23)
          {
            v11 = v18;

LABEL_14:
            goto LABEL_15;
          }
        }

      }
      if (!v12[2](v12, v18)
        || (objc_msgSend(v18, "primaryLanguage"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v25 = objc_msgSend(v13, "isEqualToString:", v24),
            v24,
            (v25 & 1) == 0))
      {
        objc_msgSend(v17[475], "intlInputMode");
        v26 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v26;
      }
      v11 = v18;
      goto LABEL_14;
    }
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke;
  v31[3] = &unk_1E16CCC80;
  v10 = &v32;
  v32 = v4;
  -[UIKeyboardInputModeController _systemInputModePassingTest:](self, "_systemInputModePassingTest:", v31);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v11;
}

- (void)updateUserSelectableInputModes
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputModeController keyboardInputModes](self, "keyboardInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController userSelectableInputModesFromInputModes:](self, "userSelectableInputModesFromInputModes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "identifier", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[UIKeyboardInputModeController setUserSelectableKeyboardInputModes:](self, "setUserSelectableKeyboardInputModes:", v6);
  -[UIKeyboardInputModeController setUserSelectableKeyboardInputModeIdentifiers:](self, "setUserSelectableKeyboardInputModeIdentifiers:", v5);

}

uint64_t __70__UIKeyboardInputModeController_currentSystemInputModeExcludingEmoji___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int IsASCIICapable;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isExtensionInputMode") & 1) == 0)
  {
    if (!*(_BYTE *)(a1 + 40)
      || (objc_msgSend(v3, "normalizedIdentifier"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("emoji")),
          v4,
          (v5 & 1) == 0))
    {
      if ((objc_msgSend(v3, "isSpecializedInputMode") & 1) == 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v8 = (id)UIKeyboardActiveInputModes;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v26;
LABEL_9:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v12);
            objc_msgSend(v3, "identifier", (_QWORD)v25);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v13) = UIKeyboardInputBaseLanguagesEqual(v13, v14);

            if ((v13 & 1) != 0)
              break;
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
              if (v10)
                goto LABEL_9;
              goto LABEL_23;
            }
          }

          objc_msgSend(*(id *)(a1 + 32), "keyboardInputModes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsObject:", v3);

          if ((v16 & 1) != 0
            || (objc_msgSend(v3, "identifier"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DBE198]),
                v17,
                (v18 & 1) != 0))
          {
            v6 = 1;
            goto LABEL_6;
          }
          objc_msgSend(v3, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          IsASCIICapable = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v19);

          if (!IsASCIICapable)
            goto LABEL_5;
          objc_msgSend(*(id *)(a1 + 32), "inputModeIdentifierLastUsedForLanguage:", CFSTR("NonASCII"));
          v8 = (id)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v8, "length"))
            goto LABEL_23;
          objc_msgSend(v3, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("intl"));

          if ((v22 & 1) != 0)
          {
            v6 = 1;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "ASCIICapableInputModeIdentifierForPreferredLanguages");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v23, "isEqualToString:", v24);

          }
        }
        else
        {
LABEL_23:
          v6 = 0;
        }

        goto LABEL_6;
      }
    }
  }
LABEL_5:
  v6 = 0;
LABEL_6:

  return v6;
}

- (NSArray)keyboardInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (id)userSelectableInputModesFromInputModes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIKeyboardInputModeController *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  unsigned int v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v42;
  id obj;
  id obja;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    if (!v7)
      goto LABEL_14;
    v8 = v7;
    v9 = *(_QWORD *)v58;
    obj = v6;
    while (1)
    {
      v10 = 0;
      v45 = v8;
      do
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v10);
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "multilingualSetForInputModeIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "count") >= 2)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v12))
          {

          }
          else
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v15);
            v16 = v9;
            v17 = self;
            v18 = v5;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v19, "isEqualToString:", v12);

            v5 = v18;
            self = v17;
            v9 = v16;
            v8 = v45;

            v6 = obj;
            if (!v47)
              goto LABEL_12;
          }
        }
        objc_msgSend(v5, "addObject:", v11);
LABEL_12:

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (!v8)
      {
LABEL_14:
        v20 = v6;
        goto LABEL_41;
      }
    }
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v21 = v4;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (v22)
  {
    v23 = v22;
    v46 = 0;
    v48 = 0;
    v6 = 0;
    v24 = *(_QWORD *)v54;
    v25 = *MEMORY[0x1E0DBE100];
    v42 = *MEMORY[0x1E0DBE158];
    obja = v21;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        v27 = v6;
        if (*(_QWORD *)v54 != v24)
          objc_enumerationMutation(obja);
        v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v28, "normalizedIdentifier", v42);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        TIGetInputModeProperties();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "BOOLValue");

        if (v32)
        {
          v6 = v28;

          ++v46;
        }
        else
        {
          objc_msgSend(v30, "objectForKey:", v42);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "BOOLValue");

          v48 += v34;
          v6 = v27;
        }

      }
      v21 = obja;
      v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
    }
    while (v23);
  }
  else
  {
    v46 = 0;
    v48 = 0;
    v6 = 0;
  }

  if (v48 == 1 && v46 == 1 && v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v36 = v21;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v50 != v39)
            objc_enumerationMutation(v36);
          if (*(id *)(*((_QWORD *)&v49 + 1) + 8 * j) != v6)
            objc_msgSend(v35, "addObject:");
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v49, v61, 16);
      }
      while (v38);
    }

    v21 = (id)objc_msgSend(v35, "copy");
  }
  v20 = v21;
  v5 = v20;
LABEL_41:

  return v5;
}

- (void)setUserSelectableKeyboardInputModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (void)setUserSelectableKeyboardInputModeIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (id)_systemInputModePassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, void *))a3;
  -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v4[2](v4, v5))
    goto LABEL_8;
  -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v4[2](v4, v6))
  {
    v7 = v6;
LABEL_9:
    v5 = v7;
    goto LABEL_10;
  }
  -[UIKeyboardInputModeController lastUsedInputMode](self, "lastUsedInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4[2](v4, v5))
    {
LABEL_8:
      v7 = v5;
      goto LABEL_9;
    }
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((((uint64_t (*)(id, void *))v4[2])(v4, v15) & 1) != 0)
        {
          v8 = v15;

          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }

  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", CFSTR("en_US"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v8 = v7;
LABEL_11:

  return v8;
}

uint64_t __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "primaryLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)normalizedInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDefaultRawInputModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setDefaultNormalizedInputModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)setDefaultKeyboardInputModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setDefaultInputModes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (BOOL)identifierIsValidSystemInputMode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0DBDBA8];
  v4 = a3;
  objc_msgSend(v3, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifierIsValidSystemInputMode:", v4);

  return v6;
}

- (BOOL)deviceStateIsLocked
{
  int v2;

  v2 = MKBGetDeviceLockState();
  return v2 != 3 && v2 != 0;
}

- (NSArray)enabledDictationLanguages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIKeyboardInputModeController activeDictationLanguages](self, "activeDictationLanguages", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[UIKeyboardInputModeController isDictationLanguageEnabled:](self, "isDictationLanguageEnabled:", v9))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)activeDictationLanguages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UIKeyboardInputModeController activeDictationSupportedInputModeIdentifiers](self, "activeDictationSupportedInputModeIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[UIKeyboardInputModeController defaultDictationLanguages:](self, "defaultDictationLanguages:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "addObjectsFromArray:", v10);
        }
        else
        {
          v18 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v12;
}

- (NSArray)activeDictationSupportedInputModeIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "languageWithRegion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "containsObject:", v10) & 1) != 0)
        {
          v11 = 0;
        }
        else
        {
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 0;
          v13 = objc_msgSend(v12, "supportsInputMode:error:", v9, &v15);
          v11 = v15;

          if (!v13)
            goto LABEL_11;
          objc_msgSend(v9, "languageWithRegion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);
        }

LABEL_11:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)lastInputModeSwitchTriggeredByASCIIToggle
{
  return self->_lastInputModeSwitchTriggeredByASCIIToggle;
}

+ (BOOL)dictationInputModeIsFunctional
{
  return +[UIDictationController dictationIsFunctional](UIDictationController, "dictationIsFunctional");
}

- (UIKeyboardInputMode)currentLinguisticInputMode
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[UIKeyboardInputModeController currentInputModeInPreference](self, "currentInputModeInPreference");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIKeyboardInputMode *)v6;
}

- (UIKeyboardInputMode)currentPublicInputMode
{
  id v2;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  char v12;

  if (!self->_suppressCurrentPublicInputMode)
  {
    -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("emoji"));

    if (v6)
    {
      -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7
        || (objc_msgSend(v7, "primaryLanguage"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("emoji")),
            v8,
            v9))
      {
        -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
        if (!v10)
          goto LABEL_8;
      }
      objc_msgSend(v7, "primaryLanguage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("emoji"));

      if ((v12 & 1) != 0)
      {
LABEL_8:
        v2 = 0;
LABEL_11:

        return (UIKeyboardInputMode *)v2;
      }
      v4 = v7;
    }
    v2 = v4;
    v7 = v2;
    goto LABEL_11;
  }
  v2 = 0;
  return (UIKeyboardInputMode *)v2;
}

- (NSString)inputModeContextIdentifier
{
  return self->_inputModeContextIdentifier;
}

- (id)userSelectableInputModeIdentifiersFromInputModeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[UIKeyboardInputModeController userSelectableInputModesFromInputModes:](self, "userSelectableInputModesFromInputModes:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController identifiersFromInputModes:](self, "identifiersFromInputModes:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)identifiersFromInputModes:(id)a3
{
  id v3;
  void *v4;
  id v5;
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
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "identifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setAdditionalTextInputLocales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)lastUsedInputModeForTextInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  void *v48;
  uint64_t v49;
  void *v50;
  id obj;
  id obja;
  void *v53;
  UIKeyboardInputModeController *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKeyboardInputModeController setDocumentInputMode:](self, "setDocumentInputMode:", v4);
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2F0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v4;
    objc_msgSend(v8, "languageWithRegion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v7;
    v54 = self;
    if (objc_msgSend(v8, "isExtensionInputMode"))
    {
      objc_msgSend(v8, "languageWithRegion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        TIGetDefaultInputModesForLanguage();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          TIInputModeGetLanguageWithRegion();
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v7, "allKeys");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
            if (v18)
            {
              v19 = v18;
              v48 = v14;
              v20 = *(_QWORD *)v64;
              while (2)
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v64 != v20)
                    objc_enumerationMutation(obj);
                  v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                  TIInputModeGetBaseLanguage();
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v16, "isEqualToString:", v23);

                  if (v24)
                  {
                    v26 = v22;

                    v16 = v26;
                    goto LABEL_17;
                  }
                }
                v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
                if (v19)
                  continue;
                break;
              }
LABEL_17:
              v7 = v53;
              self = v54;
              v14 = v48;
            }

          }
          v11 = v16;
        }

      }
      v9 = v11;
    }
    objc_msgSend(v7, "objectForKey:", v9, v48);
    v27 = objc_claimAutoreleasedReturnValue();
    v49 = v27;
    obja = v9;
    if (v27)
    {
      +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v27, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isExtensionInputMode"))
      {
        objc_msgSend(v8, "languageWithRegion");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPrimaryLanguage:", v29);

      }
      if (v28)
      {
        v30 = v28;

        v8 = v30;
      }

    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes", v49);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v60;
LABEL_30:
      v35 = 0;
      while (1)
      {
        if (*(_QWORD *)v60 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v35);
        objc_msgSend(v36, "identifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v37, "isEqualToString:", v38);

        if ((v39 & 1) != 0)
          break;
        if (v33 == ++v35)
        {
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          if (v33)
            goto LABEL_30;
          goto LABEL_36;
        }
      }
    }
    else
    {
LABEL_36:

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[UIKeyboardInputModeController activeInputModes](v54, "activeInputModes");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      if (!v40)
      {
LABEL_44:

        -[UIKeyboardInputModeController currentInputModeInPreference](v54, "currentInputModeInPreference");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:

        goto LABEL_47;
      }
      v41 = v40;
      v42 = *(_QWORD *)v56;
LABEL_38:
      v43 = 0;
      while (1)
      {
        if (*(_QWORD *)v56 != v42)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v43);
        objc_msgSend(v36, "normalizedIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "normalizedIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v44, "isEqualToString:", v45);

        if ((v46 & 1) != 0)
          break;
        if (v41 == ++v43)
        {
          v41 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
          if (v41)
            goto LABEL_38;
          goto LABEL_44;
        }
      }
    }
    -[UIKeyboardInputModeController inputModeToRestoreFrom:](v54, "inputModeToRestoreFrom:", v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_46;
  }
  v25 = 0;
LABEL_47:

  return v25;
}

- (id)textInputModeForResponder:(id)a3
{
  id result;

  self->_suppressCurrentPublicInputMode = 1;
  result = (id)objc_msgSend(a3, "textInputMode");
  self->_suppressCurrentPublicInputMode = 0;
  return result;
}

- (NSArray)inputModesWithoutHardwareSupport
{
  NSArray *inputModesWithoutHardwareSupport;
  NSArray *v4;
  NSArray *v5;

  inputModesWithoutHardwareSupport = self->_inputModesWithoutHardwareSupport;
  if (!inputModesWithoutHardwareSupport)
  {
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("emoji"), CFSTR("ja_JP-HWR"), CFSTR("zh_Hant-HWR"), CFSTR("zh_Hans-HWR"), CFSTR("yue_Hant-HWR"), 0);
    v5 = self->_inputModesWithoutHardwareSupport;
    self->_inputModesWithoutHardwareSupport = v4;

    inputModesWithoutHardwareSupport = self->_inputModesWithoutHardwareSupport;
  }
  return inputModesWithoutHardwareSupport;
}

- (void)updateCurrentInputMode:(id)a3
{
  UIKeyboardInputMode *v5;
  UIKeyboardInputMode *currentInputMode;
  void *v7;
  UIKeyboardInputMode *v8;
  UIKeyboardInputMode *inputModeThatInvokeEmoji;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (UIKeyboardInputMode *)a3;
  currentInputMode = self->_currentInputMode;
  if (currentInputMode == v5)
  {
    v10 = 0;
  }
  else
  {
    if (!-[UIKeyboardInputMode isSpecializedInputMode](currentInputMode, "isSpecializedInputMode")
      && !-[UIKeyboardInputMode isSpecializedInputMode](v5, "isSpecializedInputMode"))
    {
      +[UIDictationController activeInstance](UIDictationController, "activeInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endSmartLanguageSelectionOverride");

    }
    v8 = self->_currentInputMode;
    objc_storeStrong((id *)&self->_currentInputMode, a3);
    if (self->_inputModeThatInvokeEmoji && !-[UIKeyboardInputMode isEmojiInputMode](v5, "isEmojiInputMode"))
    {
      inputModeThatInvokeEmoji = self->_inputModeThatInvokeEmoji;
      self->_inputModeThatInvokeEmoji = 0;

    }
    if (v8)
    {
      v13 = CFSTR("UITextInputFromInputModeKey");
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("UITextInputCurrentInputModeDidChangeNotification"), 0, v10);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("UITextInputDidPersistFindUINotification"), 0, v10);

}

- (id)inputModeWithIdentifier:(id)a3
{
  return +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", a3);
}

- (void)willEnterForeground:(id)a3
{
  -[UIKeyboardInputModeController _beginContinuousDiscoveryIfNeeded](self, "_beginContinuousDiscoveryIfNeeded", a3);
  -[UIKeyboardInputModeController _clearAllExtensionsIfNeeded](self, "_clearAllExtensionsIfNeeded");
}

- (void)_beginContinuousDiscoveryIfNeeded
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  if (-[UIKeyboardInputModeController shouldRunContinuousDiscovery](self, "shouldRunContinuousDiscovery"))
  {
    -[UIKeyboardInputModeController extensionMatchingContext](self, "extensionMatchingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else if (-[UIKeyboardInputModeController _mayContainExtensionInputModes](self, "_mayContainExtensionInputModes"))
    {
      v4 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x1E0C80D38], block);
    }
  }
}

- (BOOL)shouldRunContinuousDiscovery
{
  return self->_shouldRunContinuousDiscovery;
}

- (id)nextInputModeInPreferenceListForTraits:(id)a3 updatePreference:(BOOL)a4 skipEmoji:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[UIKeyboardInputModeController nextInputModeToUseForTraits:updatePreference:](self, "nextInputModeToUseForTraits:updatePreference:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && v5)
  {
    objc_msgSend(v9, "normalizedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("emoji"));

    if ((v12 & 1) == 0)
      goto LABEL_18;
  }
  else if (v9)
  {
    goto LABEL_18;
  }
  +[UIKeyboardInputMode intlInputMode](UIKeyboardInputMode, "intlInputMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController activeUserSelectableInputModes](self, "activeUserSelectableInputModes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)UIKeyboardActiveInputModes;
  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if (v17)
  {
    objc_msgSend(v14, "arrayByAddingObject:", v13);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v18;
  }
  if (v5)
    v19 = 3;
  else
    v19 = 2;
  -[UIKeyboardInputModeController nextInputModeFromList:withFilter:withTraits:](self, "nextInputModeFromList:withFilter:withTraits:", v14, v19, v8);
  v20 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v20;
  if (!v20)
  {
    -[UIKeyboardInputModeController nextInputModeFromList:withFilter:withTraits:](self, "nextInputModeFromList:withFilter:withTraits:", v14, v5, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[UIKeyboardInputMode intlInputMode](UIKeyboardInputMode, "intlInputMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (v6)
  {
    -[UIKeyboardInputModeController lastUsedInputMode](self, "lastUsedInputMode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[UIKeyboardInputModeController setLastUsedInputMode:](self, "setLastUsedInputMode:", 0);
      -[UIKeyboardInputModeController _setCurrentAndNextInputModePreference](self, "_setCurrentAndNextInputModePreference");
    }
  }

LABEL_18:
  return v10;
}

- (NSArray)userSelectableKeyboardInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (id)nextInputModeToUseForTraits:(id)a3 updatePreference:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a4;
  v6 = a3;
  -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_11:
    if (!v4)
      goto LABEL_14;
    goto LABEL_12;
  }
  -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v9))
    goto LABEL_9;
  -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "indexOfObject:", v11) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:

LABEL_9:
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isAllowedForTraits:", v6)
    || (v13 = objc_msgSend(v6, "keyboardType"), v13 <= 0xB) && ((1 << v13) & 0x930) != 0
    || v13 == 127)
  {

    goto LABEL_8;
  }
  -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
  v21 = v16;
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetMultilingualID();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetMultilingualID();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v20, "length") || !objc_msgSend(v23, "length"))
  {

    goto LABEL_21;
  }
  v19 = objc_msgSend(v20, "isEqualToString:", v23);

  if ((v19 & 1) != 0)
    goto LABEL_10;
LABEL_21:
  -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_14;
LABEL_12:
  -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIKeyboardInputModeController setNextInputModeToUse:](self, "setNextInputModeToUse:", 0);
    -[UIKeyboardInputModeController _setCurrentAndNextInputModePreference](self, "_setCurrentAndNextInputModePreference");
  }
LABEL_14:

  return v7;
}

- (UIKeyboardInputMode)nextInputModeToUse
{
  return self->_nextInputModeToUse;
}

- (id)nextInputModeInPreferenceListForTraits:(id)a3 updatePreference:(BOOL)a4
{
  return -[UIKeyboardInputModeController nextInputModeInPreferenceListForTraits:updatePreference:skipEmoji:](self, "nextInputModeInPreferenceListForTraits:updatePreference:skipEmoji:", a3, a4, 0);
}

- (id)nextInputModeFromList:(id)a3 withFilter:(unint64_t)a4 withTraits:(id)a5
{
  id v8;
  char v9;
  uint64_t (*v10)(void *, void *);
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  int v25;
  id v27;

  v8 = a3;
  v27 = a5;
  switch(a4)
  {
    case 0uLL:
      v9 = 0;
      v10 = _UITextInputTraitsAllowedInputMode;
      break;
    case 1uLL:
      v9 = 0;
      v10 = _UITextInputTraitsAllowedInputModeExceptEmoji;
      break;
    case 2uLL:
      v9 = 0;
      v10 = _UITextInputTraitsAllowedInputModeExcludeLastAndCurrentInputModes;
      break;
    case 3uLL:
      v9 = 0;
      v10 = _UITextInputTraitsAllowedInputModeExcludeLastAndCurrentInputModesAndEmoji;
      break;
    case 4uLL:
      v9 = 0;
      v10 = (uint64_t (*)(void *, void *))_UIKeyboardInputModeDefaultLayoutIsASCIICapable;
      break;
    case 5uLL:
      v9 = 0;
      v10 = (uint64_t (*)(void *, void *))_UIKeyboardInputModeDefaultLayoutIsCarPlayEnabled;
      break;
    default:
      v10 = 0;
      v9 = 1;
      break;
  }
  v11 = objc_msgSend(v8, "count");
  if (v11 == 1)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v9 & 1) == 0 && (v10(v14, v27) & 1) == 0)
    {

LABEL_31:
      v15 = 0;
    }
  }
  else
  {
    v12 = v11;
    if (v11)
    {
      -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16
        && (v17 = (void *)v16,
            -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v8, "indexOfObject:", v18),
            v18,
            v17,
            v19 != 0x7FFFFFFFFFFFFFFFLL))
      {
        v20 = v19 + 1;
      }
      else
      {
        v20 = v12;
      }
      v21 = 0;
      do
      {
        while (1)
        {
          objc_msgSend(v8, "objectAtIndex:", (int)((v21 + v20) % v12));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v15, "isEqual:", v22);

          if ((v23 & 1) != 0)
            break;
          if ((v9 & 1) != 0 || (v10(v15, v27) & 1) != 0)
            goto LABEL_32;

          if (++v21 == v12)
            goto LABEL_28;
        }

        ++v21;
      }
      while (v21 != v12);
      if ((v9 & 1) != 0)
        goto LABEL_29;
LABEL_28:
      -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v10(v24, v27);

      if (!v25)
        goto LABEL_31;
LABEL_29:
      -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIKeyboardInputMode intlInputMode](UIKeyboardInputMode, "intlInputMode");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v13;
  }
LABEL_32:

  return v15;
}

- (id)activeUserSelectableInputModes
{
  id v3;

  v3 = -[UIKeyboardInputModeController enabledInputModeIdentifiers](self, "enabledInputModeIdentifiers");
  return -[UIKeyboardInputModeController userSelectableKeyboardInputModes](self, "userSelectableKeyboardInputModes");
}

- (UIKeyboardInputMode)currentInputModeInPreference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length")
    || (-[UIKeyboardInputModeController keyboardInputModeIdentifiers](self, "keyboardInputModeIdentifiers"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", v5),
        v6,
        (v7 & 1) == 0))
  {
    -[UIKeyboardInputModeController keyboardInputModeIdentifiers](self, "keyboardInputModeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {
      -[UIKeyboardInputModeController keyboardInputModeIdentifiers](self, "keyboardInputModeIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v5);

      if ((v10 & 1) == 0)
      {
        -[UIKeyboardInputModeController activeInputModeIdentifiers](self, "activeInputModeIdentifiers");
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v11;
      }
    }
    -[UIKeyboardInputModeController fallbackCurrentInputModeForFilteredInputModeIdentifier:fromInputModeIdentifiers:](self, "fallbackCurrentInputModeForFilteredInputModeIdentifier:fromInputModeIdentifiers:", v5, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "hasPrefix:", CFSTR("emoji")))
    {
      if ((unint64_t)objc_msgSend(v8, "count") < 2)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndex:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
      }

      v12 = (void *)v13;
    }
    if (!objc_msgSend(v12, "length"))
    {
      -[UIKeyboardInputModeController defaultEnabledInputModesForCurrentLocale:](self, "defaultEnabledInputModesForCurrentLocale:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }

    v5 = v12;
  }
  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIKeyboardInputMode *)v16;
}

- (NSArray)keyboardInputModeIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (id)fallbackCurrentInputModeForFilteredInputModeIdentifier:(id)a3 fromInputModeIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  UIKeyboardGetComponentsFromLanguageIdentifier(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sw"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (objc_msgSend(&unk_1E1A9B298, "objectForKeyedSubscript:", v9), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    -[UIKeyboardInputModeController inputModeByReplacingSoftwareLayoutWithSoftwareLayout:inInputMode:](self, "inputModeByReplacingSoftwareLayoutWithSoftwareLayout:inInputMode:", v10, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v12))
      v13 = v12;
    else
      v13 = 0;

  }
  else
  {
    objc_msgSend(v7, "firstObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
    v14 = v13;
  else
    v14 = v6;
  v15 = v14;

  return v15;
}

- (NSArray)normalizedEnabledInputModeIdentifiers
{
  return (NSArray *)-[UIKeyboardInputModeController enabledInputModeIdentifiers:](self, "enabledInputModeIdentifiers:", 1);
}

- (NSArray)userSelectableKeyboardInputModeIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (NSArray)activeUserSelectableInputModeIdentifiers
{
  id v3;

  v3 = -[UIKeyboardInputModeController enabledInputModeIdentifiers](self, "enabledInputModeIdentifiers");
  return -[UIKeyboardInputModeController userSelectableKeyboardInputModeIdentifiers](self, "userSelectableKeyboardInputModeIdentifiers");
}

- (NSArray)activeInputModeIdentifiers
{
  id v3;

  v3 = -[UIKeyboardInputModeController enabledInputModeIdentifiers](self, "enabledInputModeIdentifiers");
  return -[UIKeyboardInputModeController keyboardInputModeIdentifiers](self, "keyboardInputModeIdentifiers");
}

- (id)activeInputModes
{
  id v3;

  v3 = -[UIKeyboardInputModeController enabledInputModeIdentifiers](self, "enabledInputModeIdentifiers");
  return -[UIKeyboardInputModeController keyboardInputModes](self, "keyboardInputModes");
}

- (NSArray)enabledInputModeIdentifiers
{
  return (NSArray *)-[UIKeyboardInputModeController enabledInputModeIdentifiers:](self, "enabledInputModeIdentifiers:", 0);
}

- (void)updateCurrentAndNextInputModes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputModeSelectionSequence");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setCurrentUsedInputMode:](self, "setCurrentUsedInputMode:", v6);

  }
  if ((unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    objc_msgSend(v11, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setLastUsedInputMode:](self, "setLastUsedInputMode:", v8);

  }
  if ((unint64_t)objc_msgSend(v11, "count") >= 3)
  {
    objc_msgSend(v11, "objectAtIndex:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setNextInputModeToUse:](self, "setNextInputModeToUse:", v10);

  }
}

- (UIKeyboardInputMode)lastUsedInputMode
{
  return self->_lastUsedInputMode;
}

void __58__UIKeyboardInputModeController_sharedInputModeController__block_invoke()
{
  UIKeyboardInputModeController *v0;
  void *v1;

  v0 = objc_alloc_init(UIKeyboardInputModeController);
  v1 = (void *)qword_1ECD78FD0;
  qword_1ECD78FD0 = (uint64_t)v0;

}

- (UIKeyboardInputModeController)init
{
  UIKeyboardInputModeController *v2;
  void *v3;
  void *v4;
  int v5;
  int *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint32_t v10;
  void *v11;
  _QWORD aBlock[5];
  _QWORD v14[5];
  int *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardInputModeController;
  v2 = -[UIKeyboardInputModeController init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didEnterBackground_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_willEnterForeground_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_didEnterBackground_, *MEMORY[0x1E0D46EC8], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardsPreferencesChanged_, CFSTR("AppleKeyboardsPreferencesChangedNotification"), 0);
    _UIMainBundleIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.springboard"));

    if (v5)
    {
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3032000000;
      v14[3] = __Block_byref_object_copy__118;
      v14[4] = __Block_byref_object_dispose__118;
      v6 = v2;
      v15 = v6;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __37__UIKeyboardInputModeController_init__block_invoke;
      aBlock[3] = &unk_1E16CCC58;
      aBlock[4] = v14;
      v7 = _Block_copy(aBlock);
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      v10 = notify_register_dispatch("com.apple.managedconfiguration.passcodechanged", v6 + 11, v8, v7);

      if (v10)
        NSLog(CFSTR("Failed to register for Passcode changed notifications"));
      +[UIPeripheralHost setKeyboardOnScreenNotifyKey:](UIPeripheralHost, "setKeyboardOnScreenNotifyKey:", 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_handleSpecificHardwareKeyboard_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

      _Block_object_dispose(v14, 8);
    }

  }
  return v2;
}

- (void)_clearAllExtensionsIfNeeded
{
  void *v3;
  _QWORD v4[5];

  if (self->_allExtensions)
  {
    -[UIKeyboardInputModeController keyboardInputModes](self, "keyboardInputModes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__UIKeyboardInputModeController__clearAllExtensionsIfNeeded__block_invoke;
    v4[3] = &unk_1E16CCE38;
    v4[4] = self;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

  }
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  id extensionMatchingContext;
  NSArray *allExtensions;
  NSArray *allowedExtensions;
  NSString *newModeForUserNotification;
  NSObject *keyboardTagForUserNotification;
  __CFUserNotification *userNotification;
  __CFRunLoop *Main;
  NSArray *additionalTextInputLocales;
  UITextInputMode *documentInputMode;
  UIKeyboardInputMode *lastUsedInputMode;
  UIKeyboardInputMode *nextInputModeToUse;
  UIKeyboardInputMode *currentUsedInputMode;
  UIKeyboardInputMode *currentInputMode;
  UIKeyboardInputMode *inputModeThatInvokeEmoji;
  NSArray *inputModesWithoutHardwareSupport;
  objc_super v21;
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
    notify_cancel(self->_notifyPasscodeChangedToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("UIApplicationDidEnterBackgroundNotification");
  v22[1] = CFSTR("UIApplicationWillEnterForegroundNotification");
  v22[2] = CFSTR("AppleKeyboardsPreferencesChangedNotification");
  v22[3] = CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification");
  v4 = *MEMORY[0x1E0D46EC8];
  v22[4] = *MEMORY[0x1E0DBE478];
  v22[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v5);

  if (self->_extensionMatchingContext)
  {
    objc_msgSend(MEMORY[0x1E0CB35D8], "endMatchingExtensions:");
    extensionMatchingContext = self->_extensionMatchingContext;
    self->_extensionMatchingContext = 0;

  }
  allExtensions = self->_allExtensions;
  self->_allExtensions = 0;

  allowedExtensions = self->_allowedExtensions;
  self->_allowedExtensions = 0;

  newModeForUserNotification = self->_newModeForUserNotification;
  self->_newModeForUserNotification = 0;

  keyboardTagForUserNotification = self->_keyboardTagForUserNotification;
  self->_keyboardTagForUserNotification = 0;

  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    CFRelease(self->_userNotification);
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_userNotificationRunLoopSource);
    self->_userNotification = 0;
  }
  -[UIKeyboardInputModeController setKeyboardInputModes:](self, "setKeyboardInputModes:", 0);
  -[UIKeyboardInputModeController setUserSelectableKeyboardInputModes:](self, "setUserSelectableKeyboardInputModes:", 0);
  -[UIKeyboardInputModeController setKeyboardInputModeIdentifiers:](self, "setKeyboardInputModeIdentifiers:", 0);
  -[UIKeyboardInputModeController setUserSelectableKeyboardInputModeIdentifiers:](self, "setUserSelectableKeyboardInputModeIdentifiers:", 0);
  -[UIKeyboardInputModeController setEnabledInputModes:](self, "setEnabledInputModes:", 0);
  -[UIKeyboardInputModeController setNormalizedInputModes:](self, "setNormalizedInputModes:", 0);
  -[UIKeyboardInputModeController setDefaultKeyboardInputModes:](self, "setDefaultKeyboardInputModes:", 0);
  -[UIKeyboardInputModeController setDefaultRawInputModes:](self, "setDefaultRawInputModes:", 0);
  -[UIKeyboardInputModeController setDefaultInputModes:](self, "setDefaultInputModes:", 0);
  -[UIKeyboardInputModeController setDefaultNormalizedInputModes:](self, "setDefaultNormalizedInputModes:", 0);
  -[UIKeyboardInputModeController setInputModeContextIdentifier:](self, "setInputModeContextIdentifier:", 0);
  -[UIKeyboardInputModeController setSuggestedInputModesForSiriLanguage:](self, "setSuggestedInputModesForSiriLanguage:", 0);
  additionalTextInputLocales = self->_additionalTextInputLocales;
  self->_additionalTextInputLocales = 0;

  documentInputMode = self->_documentInputMode;
  self->_documentInputMode = 0;

  lastUsedInputMode = self->_lastUsedInputMode;
  self->_lastUsedInputMode = 0;

  nextInputModeToUse = self->_nextInputModeToUse;
  self->_nextInputModeToUse = 0;

  currentUsedInputMode = self->_currentUsedInputMode;
  self->_currentUsedInputMode = 0;

  currentInputMode = self->_currentInputMode;
  self->_currentInputMode = 0;

  inputModeThatInvokeEmoji = self->_inputModeThatInvokeEmoji;
  self->_inputModeThatInvokeEmoji = 0;

  inputModesWithoutHardwareSupport = self->_inputModesWithoutHardwareSupport;
  self->_inputModesWithoutHardwareSupport = 0;

  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardInputModeController;
  -[UIKeyboardInputModeController dealloc](&v21, sel_dealloc);
}

uint64_t __37__UIKeyboardInputModeController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "saveDeviceUnlockPasscodeInputModes");
}

- (void)setShouldRunContinuousDiscovery:(BOOL)a3
{
  self->_shouldRunContinuousDiscovery = a3;
  -[UIKeyboardInputModeController _beginContinuousDiscoveryIfNeeded](self, "_beginContinuousDiscoveryIfNeeded");
}

- (void)setCurrentInputModeInPreference:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "primaryLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("emoji"));

  if ((v4 & 1) == 0)
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateLastUsedInputMode:", v7);

  }
}

uint64_t __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UIKeyboardInputMode)hardwareInputMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isExtensionInputMode"))
  {

  }
  else
  {
    -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetVariant();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("HWR"));

    if (v7)
    {
      +[UIKeyboardInputMode intlInputMode](UIKeyboardInputMode, "intlInputMode");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  -[UIKeyboardInputModeController currentInputMode](self, "currentInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyboardInputModeToReturn");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return (UIKeyboardInputMode *)v11;
  }
  -[UIKeyboardInputModeController _systemInputModePassingLanguageTest:](self, "_systemInputModePassingLanguageTest:", &__block_literal_global_114_1);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v8;
  return (UIKeyboardInputMode *)v11;
}

BOOL __50__UIKeyboardInputModeController_hardwareInputMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;

  v2 = a2;
  if ((objc_msgSend(v2, "isExtensionInputMode") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "hardwareLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v4 != 0;

  }
  return v3;
}

- (id)inputModeToRestoreFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "isMultilingual"))
  {
    objc_msgSend(v3, "multilingualSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    v9 = v3;
    if ((v8 & 1) == 0)
    {
      if (!objc_msgSend(v3, "isMultiscript")
        || (objc_msgSend(v3, "identifier"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = UIKeyboardShowsTransliterationCandidatesForInputMode(),
            v10,
            v9 = v3,
            (v11 & 1) == 0))
      {
        v9 = v5;
      }
    }
    v12 = v9;

  }
  else
  {
    v12 = v3;
  }

  return v12;
}

- (void)setDocumentInputMode:(id)a3
{
  UITextInputMode *v4;
  UITextInputMode *documentInputMode;
  id v6;

  objc_msgSend(a3, "primaryLanguage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v6);
  v4 = (UITextInputMode *)objc_claimAutoreleasedReturnValue();
  documentInputMode = self->_documentInputMode;
  self->_documentInputMode = v4;

}

- (void)_inputModeChangedWhileContextTracked
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
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
  int v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputModeController inputModeContextIdentifier](self, "inputModeContextIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKeyboardInputModeController _prefixedKey](self, "_prefixedKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputModeController _prefixedSetTimeKey](self, "_prefixedSetTimeKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("UITextInputContextIdentifiers"));
      objc_msgSend(v8, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isExtensionInputMode");

      if (v11)
      {
        v12 = (void *)MEMORY[0x1E0CB36F8];
        -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
      }
      else
      {
        -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetLanguageWithRegion();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = 0;
      }

      if (!v9)
        goto LABEL_15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isExtensionInputMode");

        if (v18)
        {
          v19 = v9;
          if (v14 && (objc_msgSend(v14, "isEqualToData:", v19) & 1) != 0)
            goto LABEL_20;
LABEL_16:
          -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isExtensionInputMode");

          if (v23)
            v24 = v14;
          else
            v24 = v15;
          objc_msgSend(v8, "setObject:forKey:", v24, v6);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v25, v7);

          objc_msgSend(v8, "synchronize");
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = CFSTR("UITextInputContextIdentifierPreferencesDomainKey");
          v30[1] = CFSTR("UITextInputContextIdentifierPreferencesIdentifierKey");
          v31[0] = CFSTR("UITextInputContextIdentifiers");
          v31[1] = v6;
          v30[2] = CFSTR("UITextInputContextIdentifierPreferencesIdentifierSetTimeKey");
          v31[2] = v7;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "postNotificationName:object:userInfo:", CFSTR("UITextInputContextIdentifierDataDidUpdateNotification"), 0, v27);

          goto LABEL_20;
        }
LABEL_15:
        v19 = 0;
        goto LABEL_16;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v9;
        -[UIKeyboardInputModeController currentPublicInputMode](self, "currentPublicInputMode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isExtensionInputMode");

        if (v21)
        {

          goto LABEL_15;
        }
        v28 = objc_msgSend(v29, "isEqualToString:", v15);

        v19 = 0;
        if ((v28 & 1) == 0)
          goto LABEL_16;
      }
      else
      {
        v19 = 0;
      }
LABEL_20:

    }
  }
}

- (id)_prefixedKey
{
  void *v2;
  void *v3;

  -[UIKeyboardInputModeController inputModeContextIdentifier](self, "inputModeContextIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(CFSTR("ID_"), "stringByAppendingString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_prefixedSetTimeKey
{
  void *v2;
  void *v3;

  -[UIKeyboardInputModeController _prefixedKey](self, "_prefixedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("_SETTIME"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)defaultsLastChangedDate
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKeyboardInputModeController _prefixedSetTimeKey](self, "_prefixedSetTimeKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("UITextInputContextIdentifiers"));
    objc_msgSend(v3, "objectForKey:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setDefaultsLastChangedDate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIKeyboardInputModeController _prefixedSetTimeKey](self, "_prefixedSetTimeKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("UITextInputContextIdentifiers"));
    objc_msgSend(v5, "setObject:forKey:", v6, v4);
    objc_msgSend(v5, "synchronize");

  }
}

- (UIKeyboardInputMode)lastUsedInputModeForCurrentContext
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  +[UIPeripheralHost sharedInstance](UIPeripheralHost, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastUsedInputModeForCurrentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[UIKeyboardInputModeController currentInputModeInPreference](self, "currentInputModeInPreference");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (UIKeyboardInputMode *)v7;
}

- (id)suggestedDictationLanguagesForDeviceLanguage
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "suggestedDictationLanguagesForDeviceLanguage");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "suggestedDictationLanguageForDeviceLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v27[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v6;
LABEL_7:

    goto LABEL_9;
  }
  v9 = 0;
LABEL_9:
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = (__CFString *)*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15);
          if (-[__CFString hasPrefix:](v16, "hasPrefix:", CFSTR("zh")))
          {
            +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "languageCode");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v18, "isEqualToString:", CFSTR("yue-CN")) & 1) != 0
              || objc_msgSend(v18, "isEqualToString:", CFSTR("zh-HK")))
            {
              v19 = CFSTR("yue_CN");
              if ((-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("zh_CN")) & 1) != 0
                || (v19 = CFSTR("zh_HK"),
                    -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("zh_TW"))))
              {

                v16 = (__CFString *)v19;
              }
            }

          }
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v9 = v21;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)keyboardLanguageForDictationLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (qword_1ECD78FE8 != -1)
    dispatch_once(&qword_1ECD78FE8, &__block_literal_global_150_0);
  objc_msgSend((id)qword_1ECD78FE0, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v20 = v4;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeInputModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "languageWithRegion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKeyboardInputModeController defaultDictationLanguages:](self, "defaultDictationLanguages:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v23;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v23 != v17)
                    objc_enumerationMutation(v14);
                  objc_msgSend((id)qword_1ECD78FE0, "setObject:forKey:", v12, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              }
              while (v16);
            }
          }
          else
          {
            objc_msgSend((id)qword_1ECD78FE0, "setObject:forKey:", v12, v12);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v9);
    }

    v4 = v20;
    objc_msgSend((id)qword_1ECD78FE0, "objectForKey:", v20);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __70__UIKeyboardInputModeController_keyboardLanguageForDictationLanguage___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECD78FE0;
  qword_1ECD78FE0 = (uint64_t)v0;

}

- (id)updateEnabledDictationLanguages:(BOOL)a3
{
  id v3;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__118;
  v11 = __Block_byref_object_dispose__118;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__UIKeyboardInputModeController_updateEnabledDictationLanguages___block_invoke;
  v5[3] = &unk_1E16CCD18;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  -[UIKeyboardInputModeController updateEnabledDictationAndSLSLanguagesWithCompletionBlock:](self, "updateEnabledDictationAndSLSLanguagesWithCompletionBlock:", v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __65__UIKeyboardInputModeController_updateEnabledDictationLanguages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
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
  uint64_t v18;
  void *v19;
  id v20;

  v5 = a2;
  v20 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
    goto LABEL_3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inputDelegateManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 32), "keyboardInputModes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "keyboardInputModes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "languageWithRegion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v15);

    }
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferencesActions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setEnabledDictationLanguages:", v5);

    if (_os_feature_enabled_impl())
      objc_msgSend(*(id *)(a1 + 32), "setDictationSLSLanguagesEnabled:", v20);
  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v5;

}

+ (id)disallowedDictationLanguagesForDeviceLanguage
{
  char v2;

  UIKeyboardHasCompletedBuddy();
  if ((v2 & 1) != 0)
    return 0;
  if (qword_1ECD78FF8 != -1)
    dispatch_once(&qword_1ECD78FF8, &__block_literal_global_156_0);
  return (id)qword_1ECD78FF0;
}

void __78__UIKeyboardInputModeController_disallowedDictationLanguagesForDeviceLanguage__block_invoke()
{
  uint64_t v0;
  void *v1;
  __CFString *v2;
  __CFString *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  v2 = &stru_1E16EDF20;
  if (v0)
    v2 = (__CFString *)v0;
  v3 = v2;

  v4 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(&unk_1E1A9B270, "objectForKeyedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    v5 = v8;
  else
    v5 = (id)MEMORY[0x1E0C9AA60];
  v6 = objc_msgSend(v4, "initWithArray:", v5);
  v7 = (void *)qword_1ECD78FF0;
  qword_1ECD78FF0 = v6;

}

- (void)updateEnabledDictationAndSLSLanguagesWithCompletionBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  uint64_t v47;
  int v48;
  void *v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id obj;
  uint64_t v72;
  UIKeyboardInputModeController *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  objc_msgSend((id)objc_opt_class(), "disallowedDictationLanguagesForDeviceLanguage");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForPreferenceKey:", CFSTR("DictationLanguagesEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardInputModeController getDictationSLSLanguagesEnabled](self, "getDictationSLSLanguagesEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keysOfEntriesPassingTest:", &__block_literal_global_170_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v8, "count");

  -[UIKeyboardInputModeController suggestedDictationLanguagesForDeviceLanguage](self, "suggestedDictationLanguagesForDeviceLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v73 = self;
  -[UIKeyboardInputModeController activeDictationSupportedInputModeIdentifiers](self, "activeDictationSupportedInputModeIdentifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v76 = v11;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (v74)
  {
    v72 = *(_QWORD *)v90;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v90 != v72)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * v12);
        -[UIKeyboardInputModeController defaultDictationLanguages:](v73, "defaultDictationLanguages:", v13, v69);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v14;
        v75 = v12;
        if (!v14)
        {
          objc_msgSend(v6, "allKeys");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "containsObject:", v13);

          if (v40)
          {
            objc_msgSend(v6, "objectForKey:", v13);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "BOOLValue");

          }
          else
          {
            v42 = objc_msgSend(v70, "containsObject:", v13) ^ 1;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v43, v13);

          objc_msgSend(v7, "objectForKeyedSubscript:", v13);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "BOOLValue");

          if (v45)
          {
            v46 = v76;
            v47 = MEMORY[0x1E0C9AAB0];
            goto LABEL_45;
          }
          if (v77 < 4)
            v48 = v42;
          else
            v48 = 0;
          if (v48 == 1
            && (objc_msgSend(v7, "allKeys"),
                v49 = (void *)objc_claimAutoreleasedReturnValue(),
                v50 = objc_msgSend(v49, "containsObject:", v13),
                v49,
                (v50 & 1) == 0))
          {
            v52 = v13;
            v11 = v76;
            objc_msgSend(v76, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v52);
            ++v77;
          }
          else
          {
            v46 = v76;
            v47 = MEMORY[0x1E0C9AAA0];
LABEL_45:
            v51 = v13;
            v11 = v46;
            objc_msgSend(v46, "setObject:forKey:", v47, v51);
          }
          v15 = 0;
          goto LABEL_47;
        }
        v15 = v14;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v79 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
        if (!v79)
        {
          v11 = v76;
          goto LABEL_47;
        }
        v78 = *(_QWORD *)v86;
        v11 = v76;
        do
        {
          for (i = 0; i != v79; ++i)
          {
            if (*(_QWORD *)v86 != v78)
              objc_enumerationMutation(v80);
            v17 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            objc_msgSend(v6, "allKeys");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "containsObject:", v17);

            if (v19)
            {
              objc_msgSend(v6, "objectForKey:", v17);
              v22 = objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend((id)v22, "BOOLValue");

              objc_msgSend(v7, "objectForKey:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v22) = objc_msgSend(v21, "BOOLValue");
              if ((v22 & 1) == 0 && (_DWORD)v20)
              {
                objc_msgSend(v7, "allKeys");
                v23 = v10;
                v24 = v9;
                v25 = v7;
                v26 = v6;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v22) = objc_msgSend(v27, "containsObject:", v17) ^ 1;

                v6 = v26;
                v7 = v25;
                v9 = v24;
                v10 = v23;
                v11 = v76;
              }

            }
            else if (v9
                   && (objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9),
                       v28 = (void *)objc_claimAutoreleasedReturnValue(),
                       objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v80),
                       v29 = (void *)objc_claimAutoreleasedReturnValue(),
                       v30 = objc_msgSend(v28, "isSubsetOfSet:", v29),
                       v29,
                       v28,
                       v30))
            {
              v31 = objc_msgSend(v9, "containsObject:", v17);
              LODWORD(v22) = v31;
              v20 = v31;
            }
            else
            {
              objc_msgSend(v80, "firstObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = v17 == v32;

              v20 = v22;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKey:", v33, v17);

            objc_msgSend(v7, "objectForKeyedSubscript:", v17);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "BOOLValue");

            if (v35)
            {
              v36 = v11;
              v37 = MEMORY[0x1E0C9AAB0];
            }
            else
            {
              if (v77 < 4)
                v38 = v22;
              else
                v38 = 0;
              v36 = v11;
              if (v38 == 1)
              {
                objc_msgSend(v11, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v17);
                ++v77;
                continue;
              }
              v37 = MEMORY[0x1E0C9AAA0];
            }
            objc_msgSend(v36, "setObject:forKey:", v37, v17);
          }
          v15 = v80;
          v79 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
        }
        while (v79);
LABEL_47:

        v12 = v75 + 1;
      }
      while (v75 + 1 != v74);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
      v74 = v53;
    }
    while (v53);
  }

  objc_msgSend(v11, "keysOfEntriesPassingTest:", &__block_literal_global_173_0);
  v54 = v11;
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "count");

  v57 = v69;
  if (v56 <= 1)
  {
    -[UIKeyboardInputModeController activeDictationLanguages](v73, "activeDictationLanguages");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "count");

    if (v59 > 4)
    {
      objc_msgSend(v10, "keysOfEntriesPassingTest:", &__block_literal_global_174);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "count");

      v62 = objc_msgSend(v10, "count");
      if (v62 <= objc_msgSend(v6, "count") || v61 < 2)
      {
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_5;
        v81[3] = &unk_1E16B5BD8;
        v54 = v76;
        v82 = v76;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v81);
        v63 = v82;
      }
      else
      {
        v83[0] = MEMORY[0x1E0C809B0];
        v83[1] = 3221225472;
        v83[2] = __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_4;
        v83[3] = &unk_1E16B5BD8;
        v54 = v76;
        v84 = v76;
        objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v83);
        v63 = v84;
      }

    }
    else
    {
      v54 = v76;
      objc_msgSend(v76, "removeAllObjects");
    }
  }
  (*((void (**)(id, void *, void *))v69 + 2))(v69, v10, v54);
  if (v70)
  {
    v64 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "allKeys");
    v65 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)v65;
    if (v65)
      v67 = v65;
    else
      v67 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v64, "setWithArray:", v67, v69);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "intersectSet:", v68);

    v54 = v76;
  }

}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue");
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue");
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue");
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], a2);
}

+ (BOOL)shouldShowDictationMic
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL result;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "dictationIsEnabled") & 1) == 0 && (objc_msgSend(v3, "suppressDictationOptIn") & 1) != 0)
  {
    LOBYTE(v4) = 0;
LABEL_11:

    return v4;
  }
  objc_msgSend(v2, "enabledDictationLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    LOBYTE(v4) = 0;
    goto LABEL_10;
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = getAFDictationRestrictedSymbolLoc_ptr;
  v14 = getAFDictationRestrictedSymbolLoc_ptr;
  if (!getAFDictationRestrictedSymbolLoc_ptr)
  {
    v7 = AssistantServicesLibrary();
    v6 = dlsym(v7, "AFDictationRestricted");
    v12[3] = (uint64_t)v6;
    getAFDictationRestrictedSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v11, 8);
  if (v6)
  {
    v4 = ((uint64_t (*)(void))v6)() ^ 1;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _AFDictationRestricted(void)");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("UIKeyboardInputModeController.m"), 118, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)changePreferredEmojiSearchInputModeForInputDelegate:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIdleDetection:", 0);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputDelegateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setForwardingInputDelegate:", v4);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enableTransientInputDelegateSelectionMode");

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "responder");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardInputModeController currentInputModeInPreference](self, "currentInputModeInPreference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textInputContextIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v15, "textInputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController lastUsedInputModeForTextInputMode:](self, "lastUsedInputModeForTextInputMode:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  if (!v10 || (objc_msgSend(v10, "isEmojiInputMode") & 1) != 0 || (objc_msgSend(v10, "supportsEmojiSearch") & 1) == 0)
  {
    -[UIKeyboardInputModeController currentSystemInputModeExcludingEmoji:](self, "currentSystemInputModeExcludingEmoji:", 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  -[UIKeyboardInputModeController setCurrentInputMode:](self, "setCurrentInputMode:", v10);

}

- (BOOL)containsEmojiInputMode
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "normalizedIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("emoji"));

        if ((v8 & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)containsDictationSupportedInputMode
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        LOBYTE(v6) = objc_msgSend(v7, "supportsInputMode:error:", v6, &v9);

        if ((v6 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setDictationSLSLanguagesEnabled:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDictationSLSLanguagesEnabled:", v3);

}

- (id)getDictationSLSLanguagesEnabled
{
  void *v2;
  void *v3;

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictationSLSLanguagesEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCurrentInputMode:(id)a3
{
  -[UIKeyboardInputModeController _setCurrentInputMode:force:](self, "_setCurrentInputMode:force:", a3, 0);
}

- (void)_setCurrentInputMode:(id)a3 force:(BOOL)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v15);

    if ((v8 & 1) == 0)
    {
      -[UIKeyboardInputModeController normalizedInputModes](self, "normalizedInputModes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "normalizedIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "indexOfObject:", v10);

      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[UIKeyboardInputModeController enabledInputModes](self, "enabledInputModes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
  }
  if (v6)
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setInputMode:", v6);

    goto LABEL_7;
  }
LABEL_8:

}

- (BOOL)currentLocaleRequiresExtendedSetup
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v9;
  id v10;

  -[UIKeyboardInputModeController suggestedInputModesForCurrentLocale:fallbackToDefaultInputModes:](self, "suggestedInputModesForCurrentLocale:fallbackToDefaultInputModes:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = 0;
  -[UIKeyboardInputModeController getHardwareKeyboardLanguage:countryCode:](self, "getHardwareKeyboardLanguage:countryCode:", &v10, &v9);
  v4 = v10;
  v5 = v9;
  -[UIKeyboardInputModeController suggestedInputModesForHardwareKeyboardLanguage:countryCode:inputModes:](self, "suggestedInputModesForHardwareKeyboardLanguage:countryCode:inputModes:", v4, v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "count");
  LOBYTE(v7) = (unint64_t)(objc_msgSend(v6, "count") + v7) > 1;

  return v7;
}

- (id)filteredInputModesForSiriLanguageFromInputModes:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v10, v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardInputModeController suggestedInputModesForSiriLanguage](self, "suggestedInputModesForSiriLanguage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "normalizedIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsObject:", v13);

        v15 = v5;
        if ((v14 & 1) != 0
          || (objc_msgSend(v11, "primaryLanguage"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("mul")),
              v16,
              v15 = v24,
              v17))
        {
          objc_msgSend(v15, "addObject:", v10);
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  if (!objc_msgSend(v5, "count"))
  {
    -[UIKeyboardInputModeController suggestedInputModesForSiriLanguage](self, "suggestedInputModesForSiriLanguage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      -[UIKeyboardInputModeController suggestedInputModesForSiriLanguage](self, "suggestedInputModesForSiriLanguage");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v21);

    }
  }
  v22 = v24;
  if (objc_msgSend(v24, "count", v24))
    objc_msgSend(v5, "addObjectsFromArray:", v22);

  return v5;
}

- (id)filteredTVInputModesFromInputModes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (qword_1ECD79008 != -1)
    dispatch_once(&qword_1ECD79008, &__block_literal_global_179_0);
  if (!_os_feature_enabled_impl())
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = v3;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v41;
LABEL_16:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v17);
        v19 = (void *)qword_1ECD79000;
        objc_msgSend(v18, "normalizedIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v19, "containsObject:", v20);

        if (!(_DWORD)v19)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v15)
            goto LABEL_16;
          goto LABEL_22;
        }
      }
      v5 = v18;

      if (!v5)
        goto LABEL_26;
      if ((objc_msgSend(v5, "defaultLayoutIsASCIICapable") & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v5, 0);
        v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      v21 = 0;
    }
    else
    {
LABEL_22:

      v5 = 0;
LABEL_26:
      v21 = 1;
    }
    UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(CFSTR("en_US@hw=Automatic"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v21 & 1) != 0)
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v23, 0, v39, (_QWORD)v40);
    else
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v5, v23, 0, (_QWORD)v40);
    v4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
    objc_msgSend(v5, "normalizedIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("ja_JP-Kana"));

    if (v25)
    {
      UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(CFSTR("ja_JP-Romaji@hw=Automatic"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "insertObject:atIndex:", v27, 1);

    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    TIInputModeGetBaseLanguage();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetRegion();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetVariant();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v30, "isEqualToString:", CFSTR("zh")) & 1) != 0
       || objc_msgSend(v30, "isEqualToString:", CFSTR("en")))
      && objc_msgSend(v31, "isEqualToString:", CFSTR("HK")))
    {
      objc_msgSend(v4, "removeAllObjects");
      UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(CFSTR("zh_Hant-Wubihua@hw=Automatic"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v34);

      v35 = CFSTR("zh_Hant-Sucheng@hw=Automatic");
    }
    else
    {
      if (!objc_msgSend(v30, "isEqualToString:", CFSTR("es"))
        || !objc_msgSend(v32, "isEqualToString:", CFSTR("419")))
      {
        goto LABEL_42;
      }
      objc_msgSend(v4, "removeAllObjects");
      v35 = CFSTR("es_MX@hw=Automatic");
    }
    UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v37);

LABEL_42:
    goto LABEL_43;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v11 = qword_1ECD79000;
        objc_msgSend(v10, "normalizedIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend((id)v11, "containsObject:", v12);

        if ((v11 & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v7);
  }
LABEL_43:

  return v4;
}

void __68__UIKeyboardInputModeController_filteredTVInputModesFromInputModes___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD79000;
  qword_1ECD79000 = (uint64_t)&unk_1E1A937B8;

}

- (id)inputModeByReplacingSoftwareLayoutWithSoftwareLayout:(id)a3 inInputMode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  UIKeyboardGetComponentsFromLanguageIdentifier(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sw"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sw=%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sw=%@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)filteredPadInputModesFromInputModes:(id)a3 withRules:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    v31 = *(_QWORD *)v42;
    v32 = v6;
    do
    {
      v10 = 0;
      v33 = v8;
      do
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * v10);
        objc_msgSend(v11, "softwareLayout");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "softwareLayout");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v36 = v10;
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v15 = v6;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v38;
              do
              {
                v19 = 0;
                do
                {
                  if (*(_QWORD *)v38 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v19);
                  if (v11 != v20)
                  {
                    objc_msgSend(v11, "normalizedIdentifier");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "normalizedIdentifier");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v21, "isEqualToString:", v22) & 1) != 0)
                    {
                      objc_msgSend(v20, "softwareLayout");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(v23, "isEqualToString:", v14);

                      if ((v24 & 1) != 0)
                      {

                        v9 = v31;
                        v6 = v32;
                        v8 = v33;
                        v10 = v36;
                        goto LABEL_23;
                      }
                    }
                    else
                    {

                    }
                  }
                  ++v19;
                }
                while (v17 != v19);
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              }
              while (v17);
            }

            objc_msgSend(v11, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKeyboardInputModeController inputModeByReplacingSoftwareLayoutWithSoftwareLayout:inInputMode:](self, "inputModeByReplacingSoftwareLayoutWithSoftwareLayout:inInputMode:", v14, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v26);
            v27 = objc_claimAutoreleasedReturnValue();

            v11 = (id)v27;
            v9 = v31;
            v6 = v32;
            v8 = v33;
            v10 = v36;
          }

        }
        objc_msgSend(v35, "addObject:", v11);
LABEL_23:

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v8);
  }

  v28 = (void *)objc_msgSend(v35, "copy");
  return v28;
}

- (id)fallbackCurrentInputModeForFilteredInputMode:(id)a3 fromInputModes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  int v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIKeyboardInputModeController identifiersFromInputModes:](self, "identifiersFromInputModes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController fallbackCurrentInputModeForFilteredInputModeIdentifier:fromInputModeIdentifiers:](self, "fallbackCurrentInputModeForFilteredInputModeIdentifier:fromInputModeIdentifiers:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v7;
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "identifier", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v10);

        if (v17)
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

void __75__UIKeyboardInputModeController_updateDefaultInputModesIfNecessaryForIdiom__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "identifierWithLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "normalizedIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
}

uint64_t __58__UIKeyboardInputModeController_appendPasscodeInputModes___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;

  TIInputModeGetNormalizedIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetNormalizedIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "isEqualToString:", v1);

  return v2;
}

- (id)suggestedInputModesForCurrentLocale:(BOOL)a3 fallbackToDefaultInputModes:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  BOOL v13;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBDDF8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __97__UIKeyboardInputModeController_suggestedInputModesForCurrentLocale_fallbackToDefaultInputModes___block_invoke;
  v12[3] = &__block_descriptor_33_e27___NSArray_16__0__NSString_8l;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0DBDBA8], "_inputModesForLocale:language:modeFetcher:", v7, v9, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __97__UIKeyboardInputModeController_suggestedInputModesForCurrentLocale_fallbackToDefaultInputModes___block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedInputModesForLanguage(a2, *(unsigned __int8 *)(a1 + 32));
}

- (id)suggestedInputModesForHardwareKeyboardLanguage:(id)a3 countryCode:(id)a4 inputModes:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;

  v8 = a5;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    v10 = (void *)MEMORY[0x1E0C99DE8];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController inputModeToAddForKeyboardLanguage:countryCode:activeModes:](self, "inputModeToAddForKeyboardLanguage:countryCode:activeModes:", v12, v11, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "addObject:", v13);
      if (objc_msgSend(v8, "count") == 1)
        objc_msgSend(v9, "addObject:", CFSTR("emoji"));
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UIKeyboardSuggestedInputMode *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = 0;
  v33 = 0;
  -[UIKeyboardInputModeController getHardwareKeyboardLanguage:countryCode:](self, "getHardwareKeyboardLanguage:countryCode:", &v33, &v32);
  v5 = (unint64_t)v33;
  v6 = (unint64_t)v32;
  v7 = 0;
  if (v5 | v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v11);
    }

    -[UIKeyboardInputModeController suggestedInputModesForHardwareKeyboardLanguage:countryCode:inputModes:](self, "suggestedInputModesForHardwareKeyboardLanguage:countryCode:inputModes:", v5, v6, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = -[UIKeyboardSuggestedInputMode initWithIdentifier:enabled:]([UIKeyboardSuggestedInputMode alloc], "initWithIdentifier:enabled:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20), 1);
          objc_msgSend(v7, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v18);
    }

    v4 = v23;
  }

  return v7;
}

- (id)suggestedInputModesForCurrentLocale
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  UIKeyboardInputModeController *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferencesActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForPreferenceKey:", *MEMORY[0x1E0DBDDF8]);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v7;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v32 = (void *)v6;
  v30 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0DBDBA8], "_inputModesForLocale:language:modeFetcher:", v6, v8, &__block_literal_global_247_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:](self, "suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:", 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v29 = self;
  -[UIKeyboardInputModeController suggestedInputModesForCurrentLocale:fallbackToDefaultInputModes:](self, "suggestedInputModesForCurrentLocale:fallbackToDefaultInputModes:", 0, 1);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  v11 = &off_1E167A000;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v42;
    v33 = *(_QWORD *)v42;
    do
    {
      v14 = 0;
      v34 = v12;
      do
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v14);
        if ((objc_msgSend(v9, "containsObject:", v15) & 1) != 0)
        {
          v16 = 1;
        }
        else
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v17 = v35;
          v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v16)
          {
            v18 = v3;
            v19 = *(_QWORD *)v38;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v38 != v19)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "normalizedIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "isEqualToString:", v15);

                if ((v22 & 1) != 0)
                {
                  v16 = 1;
                  goto LABEL_21;
                }
              }
              v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v16)
                continue;
              break;
            }
LABEL_21:
            v3 = v18;
            v11 = &off_1E167A000;
            v13 = v33;
            v12 = v34;
          }

        }
        v23 = (void *)objc_msgSend(objc_alloc((Class)v11[488]), "initWithIdentifier:enabled:", v15, v16);
        objc_msgSend(v3, "addObject:", v23);

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v12);
  }

  -[UIKeyboardInputModeController suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:](v29, "suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v24);

  v25 = (void *)objc_msgSend(objc_alloc((Class)v11[488]), "initWithIdentifier:enabled:", CFSTR("emoji"), 1);
  v26 = objc_msgSend(v3, "indexOfObject:", v25);
  if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_28;
  v27 = v26;
  if (v26 + 1 != objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "removeObjectAtIndex:", v27);
LABEL_28:
    objc_msgSend(v3, "addObject:", v25);
  }

  return v3;
}

id __68__UIKeyboardInputModeController_suggestedInputModesForCurrentLocale__block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedDefaultInputModesForLanguage(a2);
}

- (id)suggestedInputModesForLocales:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t k;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  char v33;
  UIKeyboardSuggestedInputMode *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  UIKeyboardSuggestedInputMode *v40;
  void *v41;
  UIKeyboardSuggestedInputMode *v42;
  uint64_t v43;
  uint64_t v44;
  UIKeyboardInputModeController *v46;
  void *v47;
  id v48;
  id obj;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v46 = self;
  v74 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v67 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0DBDBA8];
        objc_msgSend(v9, "localeIdentifier", v46);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "languageCode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_inputModesForLocale:language:modeFetcher:", v11, v12, &__block_literal_global_248_0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v53, "addObjectsFromArray:", v13);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v6);
  }

  -[UIKeyboardInputModeController suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:](v46, "suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v4;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  v16 = v51;
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v63 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        v21 = (void *)MEMORY[0x1E0DBDBA8];
        objc_msgSend(v20, "localeIdentifier", v46);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "languageCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_inputModesForLocale:language:modeFetcher:", v22, v23, &__block_literal_global_249_0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "addObjectsFromArray:", v24);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v17);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v48 = v14;
  v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v52)
  {
    v25 = 0;
    v50 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v52; ++k)
      {
        if (*(_QWORD *)v59 != v50)
          objc_enumerationMutation(v48);
        v27 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
        if ((objc_msgSend(v53, "containsObject:", v27, v46) & 1) != 0)
        {
          v28 = 1;
        }
        else
        {
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v29 = v47;
          v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          if (v28)
          {
            v30 = *(_QWORD *)v55;
            while (2)
            {
              for (m = 0; m != v28; ++m)
              {
                if (*(_QWORD *)v55 != v30)
                  objc_enumerationMutation(v29);
                objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * m), "normalizedIdentifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "isEqualToString:", v27);

                if ((v33 & 1) != 0)
                {
                  v28 = 1;
                  goto LABEL_32;
                }
              }
              v28 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
              if (v28)
                continue;
              break;
            }
          }
LABEL_32:

        }
        v34 = -[UIKeyboardSuggestedInputMode initWithIdentifier:enabled:]([UIKeyboardSuggestedInputMode alloc], "initWithIdentifier:enabled:", v27, v28);
        v35 = (void *)MEMORY[0x1E0C99DC8];
        -[UIKeyboardInputMode primaryLanguage](v34, "primaryLanguage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localeWithLocaleIdentifier:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "languageCode");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("en"));

        if ((v28 & v39 & v25) == 1)
        {
          v40 = -[UIKeyboardSuggestedInputMode initWithIdentifier:enabled:]([UIKeyboardSuggestedInputMode alloc], "initWithIdentifier:enabled:", v27, 0);

          v25 = 1;
          v34 = v40;
        }
        else
        {
          v25 |= v28 & v39;
        }
        v16 = v51;
        objc_msgSend(v51, "addObject:", v34);

      }
      v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v52);
  }

  -[UIKeyboardInputModeController suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:](v46, "suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:", v16);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v41);

  v42 = -[UIKeyboardSuggestedInputMode initWithIdentifier:enabled:]([UIKeyboardSuggestedInputMode alloc], "initWithIdentifier:enabled:", CFSTR("emoji"), 1);
  v43 = objc_msgSend(v16, "indexOfObject:", v42);
  if (v43 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_41;
  v44 = v43;
  if (v43 + 1 != objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "removeObjectAtIndex:", v44);
LABEL_41:
    objc_msgSend(v16, "addObject:", v42, v46);
  }

  return v16;
}

id __63__UIKeyboardInputModeController_suggestedInputModesForLocales___block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedDefaultInputModesForLanguage(a2);
}

id __63__UIKeyboardInputModeController_suggestedInputModesForLocales___block_invoke_2(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedInputModesForLanguage(a2, 1);
}

- (id)suggestedInputModesForPreferredLanguages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  UIKeyboardSuggestedInputMode *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0DBDBA8], "_inputModesForLocale:language:modeFetcher:", v4, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10), &__block_literal_global_250_1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "array", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = -[UIKeyboardSuggestedInputMode initWithIdentifier:enabled:]([UIKeyboardSuggestedInputMode alloc], "initWithIdentifier:enabled:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17), 1);
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  -[UIKeyboardInputModeController suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:](self, "suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObjectsFromArray:", v19);

  return v12;
}

id __73__UIKeyboardInputModeController_suggestedInputModesForPreferredLanguages__block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedInputModesForLanguage(a2, 1);
}

- (void)loadSuggestedInputModesForSiriLanguage
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  UIKeyboardInputModeController *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("yue")) & 1) != 0
    || (objc_msgSend(v4, "hasPrefix:", CFSTR("wuu")) & 1) != 0)
  {
    v5 = CFSTR("zh-CN");
LABEL_4:

    v4 = (void *)v5;
    goto LABEL_5;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zh-HK")) & 1) != 0)
  {
    v5 = CFSTR("yue-Hant");
    goto LABEL_4;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("zh-TW")))
  {
    v5 = CFSTR("zh-Hant");
    goto LABEL_4;
  }
LABEL_5:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v20 = self;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    UIKeyboardGetSupportedInputModes();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "primaryLanguage");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "hasPrefix:", v7);

          if (v15)
          {
            objc_msgSend(v13, "primaryLanguage");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "isEqualToString:", v4);

            objc_msgSend(v13, "normalizedIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v6, "insertObject:atIndex:", v18, 0);
            else
              objc_msgSend(v6, "addObject:", v18);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    -[UIKeyboardInputModeController setSuggestedInputModesForSiriLanguage:](v20, "setSuggestedInputModesForSiriLanguage:", v6);
  }
  else
  {
    -[UIKeyboardInputModeController normalizedEnabledInputModeIdentifiers](self, "normalizedEnabledInputModeIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputModeController setSuggestedInputModesForSiriLanguage:](self, "setSuggestedInputModesForSiriLanguage:", v19);

  }
}

- (void)didEnterBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (pthread_main_np())
  {
    -[UIKeyboardInputModeController extensionMatchingContext](self, "extensionMatchingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && v5)
    {
      -[UIKeyboardInputModeController extensionMatchingContext](self, "extensionMatchingContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputModeController setExtensionMatchingContext:](self, "setExtensionMatchingContext:", 0);
      objc_msgSend(MEMORY[0x1E0CB35D8], "endMatchingExtensions:", v6);

    }
    -[UIKeyboardInputModeController _clearAllExtensionsIfNeeded](self, "_clearAllExtensionsIfNeeded");
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__UIKeyboardInputModeController_didEnterBackground___block_invoke;
    v7[3] = &unk_1E16B1B50;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

uint64_t __52__UIKeyboardInputModeController_didEnterBackground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEnterBackground:", *(_QWORD *)(a1 + 40));
}

- (void)_clearAllExtensions
{
  NSArray *allExtensions;
  NSArray *allowedExtensions;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIKeyboardInputModeController *v11;

  if (pthread_main_np())
  {
    allExtensions = self->_allExtensions;
    self->_allExtensions = 0;

    allowedExtensions = self->_allowedExtensions;
    self->_allowedExtensions = 0;

    -[UIKeyboardInputModeController setEnabledInputModes:](self, "setEnabledInputModes:", 0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)qword_1ECD78FC8;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__UIKeyboardInputModeController__clearAllExtensions__block_invoke;
    v9[3] = &unk_1E16CCE10;
    v10 = v6;
    v11 = self;
    v8 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);
    objc_msgSend((id)qword_1ECD78FC8, "removeObjectsForKeys:", v8);

  }
  else
  {
    -[UIKeyboardInputModeController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 1);
  }
}

void __52__UIKeyboardInputModeController__clearAllExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isExtensionInputMode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v6 = *(_QWORD *)(a1 + 40);
    if (*(id *)(v6 + 8) == v5)
    {
      *(_QWORD *)(v6 + 8) = 0;

    }
  }

}

uint64_t __60__UIKeyboardInputModeController__clearAllExtensionsIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isStalledExtensionInputMode");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_clearAllExtensions");
    *a4 = 1;
  }
  return result;
}

- (id)_allExtensionsFromMatchingExtensions:(id)a3
{
  NSArray *v5;
  void *v6;
  uint64_t v7;
  id v8;
  dispatch_semaphore_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSArray *v14;
  NSArray *allExtensions;
  NSArray *v16;
  NSArray *allowedExtensions;
  NSArray *v18;
  _QWORD v20[4];
  NSArray *v21;
  uint64_t *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[4];
  id v33;

  v5 = (NSArray *)a3;
  if (-[NSArray count](v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke;
    v32[3] = &unk_1E16CCE60;
    v8 = v6;
    v33 = v8;
    -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v32);
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__118;
    v30 = __Block_byref_object_dispose__118;
    v31 = 0;
    v9 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _UIMainBundleIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_2;
    v23[3] = &unk_1E16CCE88;
    v25 = &v26;
    v12 = v9;
    v24 = v12;
    objc_msgSend(v10, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:hostAppBundleID:accountIsManaged:completion:", v8, v11, 0, v23);

    v13 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v12, v13);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)v27[5], "count"));
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_3;
    v20[3] = &unk_1E16CCEB0;
    v22 = &v26;
    v14 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v20);
    allExtensions = self->_allExtensions;
    self->_allExtensions = v5;
    v16 = v5;

    allowedExtensions = self->_allowedExtensions;
    self->_allowedExtensions = v14;
    v18 = v14;

    v5 = self->_allExtensions;
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    objc_storeStrong((id *)&self->_allExtensions, a3);
    objc_storeStrong((id *)&self->_allowedExtensions, a3);
  }
  return v5;
}

void __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v6 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "extensionMatchingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = (void *)MEMORY[0x1E0CB35D8];
    v7 = *MEMORY[0x1E0CB2A28];
    v8[0] = CFSTR("com.apple.keyboard-service");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_2;
    v6[3] = &unk_1E16CCF00;
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "beginMatchingExtensionsWithAttributes:completion:", v4, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExtensionMatchingContext:", v5);

  }
}

void __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  dispatch_time_t v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBDDF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "identifierIsValidSystemInputMode:", v12) & 1) == 0)
        {
          if (!objc_msgSend(v3, "count")
            || (v16[0] = MEMORY[0x1E0C809B0],
                v16[1] = 3221225472,
                v16[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_3,
                v16[3] = &unk_1E16CCED8,
                v16[4] = v12,
                objc_msgSend(v3, "indexOfObjectPassingTest:", v16) == 0x7FFFFFFFFFFFFFFFLL))
          {
            objc_msgSend(v4, "addObject:", v12);
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v4, "count"))
  {
    v13 = dispatch_time(0, 18000000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_4;
    block[3] = &unk_1E16B1B50;
    block[4] = *(_QWORD *)(a1 + 32);
    v15 = v4;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

  }
  objc_msgSend(*(id *)(a1 + 32), "_clearAllExtensionsIfNeeded");

}

uint64_t __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeInputModes:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_mayContainExtensionInputModes
{
  void *v2;
  void *v3;
  char v4;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allEnabledInputModesAreValid") ^ 1;

  return v4;
}

- (void)_removeInputModes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBDDF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = objc_msgSend(v8, "count");
  -[UIKeyboardInputModeController _clearAllExtensions](self, "_clearAllExtensions");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v15, (_QWORD)v20))
        {
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            objc_msgSend(v8, "removeObject:", v15);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  if (v9 != objc_msgSend(v8, "count"))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "preferencesActions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
      v19 = v8;
    else
      v19 = 0;
    objc_msgSend(v18, "saveInputModes:", v19, (_QWORD)v20);

  }
}

- (id)_MCFilteredExtensionIdentifiers
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (self->_skipExtensionInputModes
    || !-[UIKeyboardInputModeController verifyKeyboardExtensionsWithApp](self, "verifyKeyboardExtensionsWithApp"))
  {
    v4 = 0;
  }
  else
  {
    if (-[NSArray count](self->_allExtensions, "count"))
      return self->_allExtensions;
    v5 = (void *)MEMORY[0x1E0CB35D8];
    v10 = *MEMORY[0x1E0CB2A28];
    v11[0] = CFSTR("com.apple.keyboard-service");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    objc_msgSend(v5, "extensionsWithMatchingAttributes:error:", v6, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;

    if (v8)
    {
      NSLog(CFSTR("Failed to load keyboard extensions"));
      v4 = 0;
    }
    else
    {
      NSLog(CFSTR("Successfully load keyboard extensions"));
      -[UIKeyboardInputModeController _allExtensionsFromMatchingExtensions:](self, "_allExtensionsFromMatchingExtensions:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

- (BOOL)isLockscreenPasscodeKeyboard
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)UIApp, "_isSpringBoard"))
  {
    objc_msgSend(v2, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v2, "textInputTraits");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSecureTextEntry");

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)extensionInputModes
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  if (-[UIKeyboardInputModeController isLockscreenPasscodeKeyboard](self, "isLockscreenPasscodeKeyboard"))
    return 0;
  -[UIKeyboardInputModeController _MCFilteredExtensionIdentifiers](self, "_MCFilteredExtensionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_setCurrentAndNextInputModePreference
{
  void *v3;
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
  id v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v5);

    -[UIKeyboardInputModeController lastUsedInputMode](self, "lastUsedInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UIKeyboardInputModeController lastUsedInputMode](self, "lastUsedInputMode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v8);

      -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[UIKeyboardInputModeController nextInputModeToUse](self, "nextInputModeToUse");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v11);

      }
    }
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferencesActions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInputModeSelectionSequence:", v14);

}

- (void)clearNextInputModeToUse
{
  -[UIKeyboardInputModeController setNextInputModeToUse:](self, "setNextInputModeToUse:", 0);
}

- (id)nextInputModeToUseForTraits:(id)a3
{
  return -[UIKeyboardInputModeController nextInputModeToUseForTraits:updatePreference:](self, "nextInputModeToUseForTraits:updatePreference:", a3, 1);
}

- (id)nextInputModeInPreferenceListForTraits:(id)a3
{
  return -[UIKeyboardInputModeController nextInputModeInPreferenceListForTraits:updatePreference:](self, "nextInputModeInPreferenceListForTraits:updatePreference:", a3, 1);
}

+ (id)inputModeIdentifierForPreferredLanguages:(id)a3 passingTest:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *);
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (uint64_t (**)(id, void *))a4;
  v7 = objc_msgSend(v5, "count");
  v8 = 0;
  if (v6 && v7)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v21 = v5;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          TIGetDefaultInputModesForLanguage();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v23;
LABEL_10:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v23 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
              if ((v6[2](v6, v19) & 1) != 0)
                break;
              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                if (v16)
                  goto LABEL_10;
                goto LABEL_16;
              }
            }
            v8 = v19;

            if (v8)
              goto LABEL_21;
          }
          else
          {
LABEL_16:

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
      v8 = 0;
LABEL_21:
      v5 = v21;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (id)ASCIICapableInputModeIdentifierForPreferredLanguages
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inputModeIdentifierForPreferredLanguages:passingTest:", v3, &__block_literal_global_276);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    TIGetDefaultInputModesForLanguage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

uint64_t __85__UIKeyboardInputModeController_ASCIICapableInputModeIdentifierForPreferredLanguages__block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(a2);
}

- (id)inputModeIdentifierLastUsedForLanguage:(id)a3
{
  return -[UIKeyboardInputModeController inputModeIdentifierLastUsedForLanguage:includingExtensions:](self, "inputModeIdentifierLastUsedForLanguage:includingExtensions:", a3, 1);
}

- (id)inputModeIdentifierLastUsedForLanguage:(id)a3 includingExtensions:(BOOL)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t k;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  id v51;
  id v52;
  id v54;
  id v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("ASCIICapable"))
    || (UIKeyboardGetCurrentInputMode(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = UIKeyboardLayoutSupportsASCIIToggleKey(v6),
        v6,
        v7))
  {
    TIInputModeGetLanguageWithRegion();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferencesActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2F0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v5 = v8;
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("NonASCII"))
      && !UIKeyboardLayoutSupportsASCIIToggleKey(v12)
      || v12
      && !a4
      && (+[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v12), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "isExtensionInputMode"), v13, v5 = v8, v14))
    {

      v12 = 0;
    }
    v15 = (id)UIKeyboardActiveInputModes;
    if ((objc_msgSend(v15, "containsObject:", v12) & 1) == 0)
    {

      v12 = 0;
    }
    if (objc_msgSend(v15, "count") == 1)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("ASCIICapable")))
      {
        UIKeyboardGetCurrentInputMode();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetNormalizedIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        UIKeyboardGetPreferredASCIICapableInputModeForInputMode((uint64_t)v17);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("NonASCII")))
          goto LABEL_21;
        UIKeyboardGetCurrentInputMode();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetNormalizedIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        UIKeyboardGetPreferredNonASCIICapableInputModeForInputMode((uint64_t)v17);
        v18 = objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)v18;

      v12 = v19;
    }
LABEL_21:
    if (!objc_msgSend(v12, "length"))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("ASCIICapable")))
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v20 = v15;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
        if (v21)
        {
          v22 = v21;
          v54 = v15;
          v56 = v11;
          v23 = *(_QWORD *)v71;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v71 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
              if (!a4)
              {
                +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isExtensionInputMode");

                if ((v27 & 1) != 0)
                  continue;
              }
              if (UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v25))
              {
                v28 = v25;

                goto LABEL_48;
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
            if (v22)
              continue;
            break;
          }
          v28 = v12;
LABEL_48:
          v11 = v56;
          v15 = v54;
        }
        else
        {
          v28 = v12;
        }

        if (objc_msgSend(v28, "length"))
        {
          v12 = v28;
          goto LABEL_79;
        }
        objc_msgSend((id)objc_opt_class(), "ASCIICapableInputModeIdentifierForPreferredLanguages");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v5, "isEqualToString:", CFSTR("NonASCII")))
      {
        v68 = 0uLL;
        v69 = 0uLL;
        v66 = 0uLL;
        v67 = 0uLL;
        v28 = v15;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
        if (v29)
        {
          v30 = v29;
          v55 = v15;
          v57 = v11;
          v31 = *(_QWORD *)v67;
          while (2)
          {
            for (j = 0; j != v30; ++j)
            {
              if (*(_QWORD *)v67 != v31)
                objc_enumerationMutation(v28);
              v33 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
              if (!a4)
              {
                +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "isExtensionInputMode");

                if ((v35 & 1) != 0)
                  continue;
              }
              if ((UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v33) & 1) == 0
                && UIKeyboardLayoutSupportsASCIIToggleKey(v33))
              {
                v51 = v33;

                v12 = v51;
                goto LABEL_75;
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
            if (v30)
              continue;
            break;
          }
LABEL_75:
          v11 = v57;
          v15 = v55;
        }
      }
      else
      {
        v64 = 0uLL;
        v65 = 0uLL;
        v62 = 0uLL;
        v63 = 0uLL;
        v36 = v15;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
        if (v37)
        {
          v38 = v37;
          v39 = v15;
          v40 = *(_QWORD *)v63;
          while (2)
          {
            for (k = 0; k != v38; ++k)
            {
              if (*(_QWORD *)v63 != v40)
                objc_enumerationMutation(v36);
              v42 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
              TIInputModeGetLanguageWithRegion();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "isEqualToString:", v5))
              {
                v44 = v42;

                v12 = v44;
                goto LABEL_63;
              }

            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
            if (v38)
              continue;
            break;
          }
LABEL_63:
          v15 = v39;
        }

        if (objc_msgSend(v12, "length"))
          goto LABEL_79;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v28 = v36;
        v45 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
        if (v45)
        {
          v46 = v45;
          v47 = v15;
          v48 = *(_QWORD *)v59;
          while (2)
          {
            for (m = 0; m != v46; ++m)
            {
              if (*(_QWORD *)v59 != v48)
                objc_enumerationMutation(v28);
              v50 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * m);
              if (UIKeyboardInputBaseLanguagesEqual((uint64_t)v50, v5))
              {
                v52 = v50;

                v12 = v52;
                goto LABEL_77;
              }
            }
            v46 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
            if (v46)
              continue;
            break;
          }
LABEL_77:
          v15 = v47;
        }
      }

    }
LABEL_79:

    goto LABEL_80;
  }
  v12 = 0;
LABEL_80:

  return v12;
}

- (id)inputModeLastUsedForLanguage:(id)a3
{
  return -[UIKeyboardInputModeController inputModeLastUsedForLanguage:includingExtensions:](self, "inputModeLastUsedForLanguage:includingExtensions:", a3, 1);
}

- (id)inputModeLastUsedForLanguage:(id)a3 includingExtensions:(BOOL)a4
{
  void *v4;
  void *v5;

  -[UIKeyboardInputModeController inputModeIdentifierLastUsedForLanguage:includingExtensions:](self, "inputModeIdentifierLastUsedForLanguage:includingExtensions:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)inputModeForASCIIToggleWithTraits:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v3 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "defaultLayoutIsASCIICapable");
  v7 = CFSTR("ASCIICapable");
  if (v6)
    v7 = CFSTR("NonASCII");
  v8 = v7;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputModeLastUsedForLanguage:includingExtensions:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqual:", v5) & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v10, "primaryLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12) && (objc_msgSend(v10, "isExtensionInputMode") & 1) == 0)
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(v10, "isAllowedForTraits:", v3);

  if (!v13)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v14 = v10;
LABEL_10:

  return v14;
}

- (void)updateLastUsedInputMode:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_inputModeThatInvokeEmoji)
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v4)
    {
      -[UIKeyboardInputModeController currentInputModeInPreference](self, "currentInputModeInPreference");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v6;
    }
    -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if ((v8 & 1) == 0)
    {
      -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v4, "normalizedIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("emoji"));

        if (v12)
        {
          v19 = CFSTR("UITextInputNextInputModeInputModeDidChangeKey");
          -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("UITextInputNextInputModeInputModeDidChangeNotification"), 0, v14);

        }
      }
      -[UIKeyboardInputModeController currentUsedInputMode](self, "currentUsedInputMode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputModeController setNextInputModeToUse:](self, "setNextInputModeToUse:", v16);

      -[UIKeyboardInputModeController setCurrentUsedInputMode:](self, "setCurrentUsedInputMode:", v4);
      -[UIKeyboardInputModeController setLastUsedInputMode:](self, "setLastUsedInputMode:", v4);
      -[UIKeyboardInputModeController _setCurrentAndNextInputModePreference](self, "_setCurrentAndNextInputModePreference");
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticGetKeyForInputMode();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarSetBoolean();

    }
  }

}

- (void)switchToCurrentSystemInputMode
{
  id v3;

  -[UIKeyboardInputModeController currentSystemInputMode](self, "currentSystemInputMode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController _setCurrentInputMode:force:](self, "_setCurrentInputMode:force:", v3, 1);

}

- (void)presentEnablementAndDataSharingPromptIfNeeded:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentEnablementAndDataSharingPromptIfNeeded:", v3);

}

- (void)switchToDictationInputMode
{
  -[UIKeyboardInputModeController switchToDictationInputModeWithOptions:](self, "switchToDictationInputModeWithOptions:", 0);
}

- (void)stopDictation
{
  void *v2;
  void *v3;
  id v4;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setReasonType:", 17);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopDictation");

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissDictationPopover");

}

- (void)switchToDictationInputModeWithOptions:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = +[UIDictationController reasonType:](UIDictationController, "reasonType:", v3);
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReasonType:", v4);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switchToDictationInputModeWithOptions:", v3);

}

- (BOOL)toggleDictationForResponder:(id)a3 withOption:(id)a4 firstResponderSetupCompletion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  unint64_t v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void (**v47)(_QWORD);

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = +[UIDictationController reasonType:](UIDictationController, "reasonType:", v8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = (id)objc_msgSend(v7, "performSelector:", sel_textInputTraits);
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textInputTraits");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v10 != 26
    || !+[UIDictationController isRunning](UIDictationController, "isRunning")
    && (objc_msgSend(v11, "forceDisableDictation") & 1) == 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || (objc_msgSend(v7, "forceDisableDictation") & 1) == 0))
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyboardWindow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 != v15)
      goto LABEL_11;
    v47 = v9;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "inputDelegateManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "forwardingInputDelegate");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29 == v7)
    {

      LOBYTE(v13) = 0;
      v9 = v47;
      goto LABEL_51;
    }
    objc_msgSend(v7, "becomeFirstResponder");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "inputDelegateManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "delegateRespectingForwardingDelegate:", 1);
    v32 = (id)objc_claimAutoreleasedReturnValue();

    if (v32 == v7)
    {
      objc_msgSend(v7, "_responderWindow");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33 == v15)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "inputDelegateManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "delegateRespectingForwardingDelegate:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "_overrideInputViewNextResponderWithResponder:", v36);
      }
    }
    objc_msgSend(v7, "_responderWindow");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v47;
    if (v37 != v15)
    {
LABEL_11:
      +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mobilenotes"));

      if ((objc_msgSend(v7, "isEditable") & 1) != 0)
        goto LABEL_12;
      if (!v13)
      {
LABEL_51:

        goto LABEL_52;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "setEditable:", 1);
LABEL_12:
        objc_msgSend(v7, "_responderWindow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "_isApplicationKeyWindow");

        if ((v19 & 1) == 0)
        {
          objc_msgSend(v7, "_responderWindow");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "makeKeyWindow");

        }
        v21 = objc_msgSend(v11, "returnKeyType");
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EDE24368) && v21 == 6)
          objc_msgSend(v7, "setUseAutomaticEndpointing:", 1);
        if ((objc_msgSend(v7, "isFirstResponder") & 1) == 0 && v16 != v15)
        {
          v22 = objc_msgSend(v11, "deferBecomingResponder");
          objc_msgSend(v11, "setDeferBecomingResponder:", 0);
          if (v10 <= 0x1A && ((1 << v10) & 0x4002600) != 0)
          {
            if (+[UIKeyboardImpl isDictationPopoverEnabled](UIKeyboardImpl, "isDictationPopoverEnabled"))
            {
              if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled"))
              {
                +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setKeyboardMinimizedByDictation:", 1);

                if (v10 == 13)
                  v10 = 27;
              }
            }
          }
          v13 = objc_msgSend(v7, "becomeFirstResponder");
          if (v13)
          {
            if (v9)
              v9[2](v9);
            if (v10 == 9)
              v24 = 8;
            else
              v24 = v10;
            +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setReasonType:", v24);

            +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "switchToDictationInputModeWithOptions:", v8);

          }
          objc_msgSend(v11, "setDeferBecomingResponder:", v22);
          goto LABEL_51;
        }
        v38 = +[UIDictationController isRunning](UIDictationController, "isRunning");
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setReasonType:", v10);

        if (v38)
        {
          +[UIDictationController activeInstance](UIDictationController, "activeInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stopDictation");

          +[UIDictationLandingView activeInstance](UIDictationLandingView, "activeInstance");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stopLanding");

          +[UIDictationController activeInstance](UIDictationController, "activeInstance");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "shouldSuppressSoftwareKeyboard");

          if (!v43)
          {
LABEL_50:
            LOBYTE(v13) = 1;
            goto LABEL_51;
          }
          if (v21 == 6)
            objc_msgSend(v7, "resignFirstResponder");
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setKeyboardMinimizedByDictation:", 0);
        }
        else
        {
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "showSoftwareKeyboardIfNeeded");

          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "switchToDictationInputModeWithOptions:", v8);
        }

        goto LABEL_50;
      }
    }
    LOBYTE(v13) = 0;
    goto LABEL_51;
  }
  LOBYTE(v13) = 0;
LABEL_52:

  return v13;
}

- (void)toggleDictationForResponder:(id)a3 WithOptions:(id)a4
{
  -[UIKeyboardInputModeController toggleDictationForResponder:withOption:firstResponderSetupCompletion:](self, "toggleDictationForResponder:withOption:firstResponderSetupCompletion:", a3, a4, 0);
}

- (void)stopDictationAndResignFirstResponder
{
  id v2;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopDictationAndResignFirstResponder");

}

- (void)forceDictationReturnToKeyboardInputMode
{
  id v2;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceDictationReturnToKeyboardInputMode");

}

- (void)performWithoutExtensionInputModes:(id)a3
{
  BOOL skipExtensionInputModes;

  skipExtensionInputModes = self->_skipExtensionInputModes;
  self->_skipExtensionInputModes = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_skipExtensionInputModes = skipExtensionInputModes;
  self->_cacheNeedsRefresh = 1;
}

- (void)performWithForcedExtensionInputModes:(id)a3
{
  BOOL skipExtensionInputModes;

  skipExtensionInputModes = self->_skipExtensionInputModes;
  self->_skipExtensionInputModes = 0;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_skipExtensionInputModes = skipExtensionInputModes;
}

- (void)startDictationConnectionForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDictationForFileAtURL:forInputModeIdentifier:", v14, v5);
LABEL_5:

    goto LABEL_6;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIKeyboardErrorDomain"), 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictationRequestDidFailWithError:", v13);

    goto LABEL_5;
  }
LABEL_6:

}

+ (id)multilingualSetForInputModeIdentifier:(id)a3
{
  return (id)TIInputModeGetMultilingualSet();
}

- (id)supportedInputModesFromArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIKeyboardInputModeController supportedInputModeIdentifiers](self, "supportedInputModeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        TIInputModeGetNormalizedIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "containsObject:", v13, (_QWORD)v15))
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)handleLastUsedInputMode:(id)a3 withNewInputMode:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v13 = (unint64_t)a3;
  v5 = a4;
  if (objc_msgSend((id)UIApp, "_isSpringBoard") && v13 | qword_1ECD79010)
  {
    if (v5)
    {
      if (!qword_1ECD79010)
      {
        v6 = objc_msgSend((id)v13, "copy");
        v7 = (void *)qword_1ECD79010;
        qword_1ECD79010 = v6;

      }
      if (v13)
      {
        v8 = objc_msgSend(v5, "copy");
        v9 = (void *)qword_1ECD79018;
        qword_1ECD79018 = v8;
LABEL_12:

        goto LABEL_13;
      }
      if ((objc_msgSend(v5, "isEqualToString:", qword_1ECD79018) & 1) == 0)
      {
        v12 = (void *)qword_1ECD79010;
        qword_1ECD79010 = 0;

        v9 = (void *)qword_1ECD79018;
        qword_1ECD79018 = 0;
        goto LABEL_12;
      }
    }
    else if ((objc_msgSend((id)qword_1ECD79010, "isEqualToString:", qword_1ECD79018) & 1) == 0)
    {
      v9 = (void *)objc_msgSend((id)qword_1ECD79010, "copy");
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferencesActions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLanguageAwareInputModeLastUsed:", v9);

      goto LABEL_12;
    }
  }
LABEL_13:

}

- (id)hardwareLayoutToUseForInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t HardwareKeyboardCountry;
  void *v9;
  void *v10;

  v4 = a3;
  BKSHIDServicesGetHardwareKeyboardLanguage();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length")
    && (+[UIDevice currentDevice](UIDevice, "currentDevice"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_isHardwareKeyboardAvailable"),
        v6,
        v7)
    && (HardwareKeyboardCountry = GSEventGetHardwareKeyboardCountry(), (_DWORD)HardwareKeyboardCountry))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HardwareKeyboardCountry);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[UIKeyboardInputModeController hardwareLayoutToUseForInputMode:hardwareKeyboardLanguage:countryCode:](self, "hardwareLayoutToUseForInputMode:hardwareKeyboardLanguage:countryCode:", v4, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)hardwareLayoutToUseForInputMode:(id)a3 hardwareKeyboardLanguage:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  UIKeyboardGetHardwareLayoutFromInputMode(v8, v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierWithLayouts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  -[UIKeyboardInputModeController supportedFullModesForHardwareKeyboard:countryCode:activeModes:matchedMode:](self, "supportedFullModesForHardwareKeyboard:countryCode:activeModes:matchedMode:", v10, v9, v13, &v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v27;
  if (objc_msgSend(v14, "count") && v15)
  {
    TIInputModeGetComponentsFromIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("hw"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && (objc_msgSend(v17, "isEqualToString:", CFSTR("Automatic")) & 1) == 0)
    {
      v19 = v18;

      v11 = v19;
    }

  }
  objc_msgSend(v8, "normalizedIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardGetSupportedHardwareKeyboardsForInputMode(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v21, "containsObject:", v11) || (v22 = v11) == 0)
  {
    objc_msgSend(v8, "normalizedIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardGetDefaultHardwareKeyboardLayoutForInputMode(v23);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      +[UIKeyboardInputMode intlInputMode](UIKeyboardInputMode, "intlInputMode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v8, "isEqual:", v24);

      if (v25)
      {
        UIKeyboardGetDefaultHardwareKeyboardLayoutForInputMode(CFSTR("en_US"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }
  }

  return v22;
}

- (id)inputModeToAddForKeyboardLanguage:(id)a3 countryCode:(id)a4 activeModes:(id)a5
{
  id v7;
  id v8;
  id v9;
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
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        TIInputModeGetNormalizedIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v17);

        TIInputModeGetLanguage();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v14);
  }

  v37 = 0;
  v31 = v8;
  -[UIKeyboardInputModeController supportedFullModesForHardwareKeyboard:countryCode:activeModes:matchedMode:](self, "supportedFullModesForHardwareKeyboard:countryCode:activeModes:matchedMode:", v7, v8, v12, &v37);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v37;
  if (v20)
  {
    v21 = 0;
    v22 = v19;
    goto LABEL_30;
  }
  -[UIKeyboardInputModeController supportedInputModesFromArray:](self, "supportedInputModesFromArray:", v19);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v22, "count"))
  {
    v21 = 0;
    goto LABEL_30;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v22;
  v21 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (!v21)
  {
    v28 = v22;
LABEL_28:

    goto LABEL_30;
  }
  v30 = v7;
  v23 = *(_QWORD *)v34;
LABEL_13:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v34 != v23)
      objc_enumerationMutation(v22);
    v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v24);
    TIInputModeGetNormalizedIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguage();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if ((UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v25) & 1) != 0)
    {
      if (!objc_msgSend(v11, "containsObject:", v27))
        break;
      goto LABEL_20;
    }
    if ((objc_msgSend(v10, "containsObject:", v26) & 1) == 0)
      break;
LABEL_20:

    if (v21 == (void *)++v24)
    {
      v21 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v21)
        goto LABEL_13;
      v28 = v22;
      v7 = v30;
      goto LABEL_25;
    }
  }

  if (v26)
  {
    -[UIKeyboardInputModeController fullInputModeFromIdentifier:hardwareKeyboardLanguage:](self, "fullInputModeFromIdentifier:hardwareKeyboardLanguage:", v26, v30);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardInputModeGetIdentifierFromComponents(v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v30;
LABEL_25:
    v20 = 0;
    goto LABEL_28;
  }
  v21 = 0;
  v20 = 0;
  v7 = v30;
LABEL_30:

  return v21;
}

- (id)fullInputModeFromIdentifier:(id)a3 hardwareKeyboardLanguage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v5 = a3;
  v6 = a4;
  TIInputModeGetComponentsFromIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  UIKeyboardGetSoftwareLayoutForHardwareKeyboardAndInputMode((uint64_t)v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("sw"));
  UIKeyboardGetDefaultInputModeLayoutForHardwareKeyboardWithCountryCode(v5, v6, &unk_1E1A98100);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = CFSTR("Automatic");
  objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("hw"));

  return v8;
}

- (void)showAddKeyboardAlertForInputModeIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  __CFUserNotification *v20;
  __CFRunLoop *Main;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SInt32 error[2];
  SInt32 *v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a3;
  +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  objc_msgSend(v6, "languageWithRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardLanguageNameInUILanguage(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MGCopyAnswer();
  v10 = objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("%@ Keyboard Detected"), CFSTR("%@ Keyboard Detected"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9);
  v11 = objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Do you want to configure this %@ for typing in %@?"), CFSTR("Do you want to configure this %@ for typing in %@?"));
  v28 = (void *)v10;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Add %@ Keyboard"), CFSTR("Add %@ Keyboard"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UINSLocalizedStringWithDefaultValue(CFSTR("Not Now"), CFSTR("Not Now"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v11;
  objc_msgSend(v15, "setObject:forKey:", v11, *MEMORY[0x1E0C9B800]);
  objc_msgSend(v15, "setObject:forKey:", v12, *MEMORY[0x1E0C9B810]);
  objc_msgSend(v15, "setObject:forKey:", v13, *MEMORY[0x1E0C9B838]);
  objc_msgSend(v15, "setObject:forKey:", v14, *MEMORY[0x1E0C9B830]);
  *(_QWORD *)error = 0;
  v30 = error;
  v31 = 0x2020000000;
  v16 = (_QWORD *)qword_1ECD79088;
  v32 = qword_1ECD79088;
  if (!qword_1ECD79088)
  {
    v17 = SpringBoardServicesLibrary_0();
    v16 = dlsym(v17, "SBUserNotificationDefaultButtonTag");
    *((_QWORD *)v30 + 3) = v16;
    qword_1ECD79088 = (uint64_t)v16;
  }
  _Block_object_dispose(error, 8);
  if (v16)
  {
    objc_msgSend(v15, "setObject:forKey:", &unk_1E1A98118, *v16);
    *(_QWORD *)error = 0;
    v30 = error;
    v31 = 0x2020000000;
    v18 = (_QWORD *)qword_1ECD79090;
    v32 = qword_1ECD79090;
    if (!qword_1ECD79090)
    {
      v19 = SpringBoardServicesLibrary_0();
      v18 = dlsym(v19, "SBUserNotificationAllowInSetupKey");
      *((_QWORD *)v30 + 3) = v18;
      qword_1ECD79090 = (uint64_t)v18;
    }
    _Block_object_dispose(error, 8);
    if (v18)
    {
      objc_msgSend(v15, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *v18);
      objc_storeStrong((id *)&self->_newModeForUserNotification, a3);
      error[0] = 0;
      v20 = CFUserNotificationCreate(0, 0.0, 3uLL, error, (CFDictionaryRef)v15);
      self->_userNotification = v20;
      self->_userNotificationRunLoopSource = CFUserNotificationCreateRunLoopSource(0, v20, (CFUserNotificationCallBack)__userNotificationCallback, 0);
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);

LABEL_9:
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationAllowInSetupKey(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("UIKeyboardInputModeController.m"), 103, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationDefaultButtonTag(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("UIKeyboardInputModeController.m"), 102, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

- (void)didAcceptAddKeyboardInputMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *newModeForUserNotification;
  NSObject *keyboardTagForUserNotification;
  NSString *v16;

  v16 = self->_newModeForUserNotification;
  -[UIKeyboardInputModeController enabledInputModeIdentifiers](self, "enabledInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObject:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveInputModes:", v4);

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferencesActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2F8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v16 == 0;
  else
    v10 = 1;
  if (!v10 && (objc_msgSend(v9, "isEqualToString:", v16) & 1) == 0)
    -[UIKeyboardInputModeController handleLastUsedInputMode:withNewInputMode:](self, "handleLastUsedInputMode:withNewInputMode:", v9, v16);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferencesActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLanguageAwareInputModeLastUsed:", v16);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "defaultsDidChange");

  newModeForUserNotification = self->_newModeForUserNotification;
  self->_newModeForUserNotification = 0;

  keyboardTagForUserNotification = self->_keyboardTagForUserNotification;
  self->_keyboardTagForUserNotification = 0;

  -[UIKeyboardInputModeController releaseAddKeyboardNotification](self, "releaseAddKeyboardNotification");
}

- (void)releaseAddKeyboardNotification
{
  __CFUserNotification *userNotification;
  __CFRunLoop *Main;

  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFRelease(userNotification);
    self->_userNotification = 0;
  }
  if (self->_userNotificationRunLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(self->_userNotificationRunLoopSource);
    self->_userNotificationRunLoopSource = 0;
  }
}

- (void)getHardwareKeyboardLanguage:(id *)a3 countryCode:(id *)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  uint64_t HardwareKeyboardCountry;
  void *v12;
  id v13;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "loadKeyboardsForSiriLanguage");

  if ((v8 & 1) != 0)
    return;
  BKSHIDServicesGetHardwareKeyboardLanguage();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_isHardwareKeyboardAvailable");

    if (v10)
    {
      HardwareKeyboardCountry = GSEventGetHardwareKeyboardCountry();
      if ((_DWORD)HardwareKeyboardCountry)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HardwareKeyboardCountry);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a3)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
  }
  v12 = 0;
  if (a3)
LABEL_8:
    *a3 = objc_retainAutorelease(v13);
LABEL_9:
  if (a4)
    *a4 = objc_retainAutorelease(v12);

}

- (NSString)hardwareKeyboardExclusivityIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x1E0D00D48], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeyboardDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "exclusivityIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "exclusivityIdentifier");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSString *)v4;
}

- (void)handleSpecificHardwareKeyboard:(id)a3
{
  UIKeyboardInputModeController *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  __CFUserNotification *userNotification;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  UIKeyboardInputModeController *v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v3 = self;
  v56 = *MEMORY[0x1E0C80C00];
  -[UIKeyboardInputModeController hardwareKeyboardExclusivityIdentifier](self, "hardwareKeyboardExclusivityIdentifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return;
  v53 = 0;
  v54 = 0;
  -[UIKeyboardInputModeController getHardwareKeyboardLanguage:countryCode:](v3, "getHardwareKeyboardLanguage:countryCode:", &v54, &v53);
  v5 = v54;
  v6 = v53;
  if (!objc_msgSend(v5, "length"))
  {
    if (!v6)
    {
      v7 = 0;
      goto LABEL_30;
    }
    v7 = v6;
LABEL_7:
    UIKeyboardHasCompletedBuddy();
    if (!v8)
      goto LABEL_30;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferencesActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0DBE2B0];
    objc_msgSend(v10, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2B0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "containsObject:", v7) & 1) != 0)
      goto LABEL_29;
    if (v12)
    {
      objc_msgSend(v12, "arrayByAddingObject:", v7);
      v13 = objc_claimAutoreleasedReturnValue();

      v14 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v14;
    objc_msgSend(v15, "setValue:forPreferenceKey:", v14, v11);

    objc_storeStrong((id *)&v3->_keyboardTagForUserNotification, v7);
    -[UIKeyboardInputModeController enabledInputModeIdentifiers](v3, "enabledInputModeIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    -[UIKeyboardInputModeController supportedFullModesForHardwareKeyboard:countryCode:activeModes:matchedMode:](v3, "supportedFullModesForHardwareKeyboard:countryCode:activeModes:matchedMode:", v5, v6, v16, &v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v52;
    if (v18)
    {
      v41 = v17;
      v45 = v3;
      v46 = v7;
      v43 = v6;
      v44 = v5;
      v19 = (void *)objc_opt_new();
      TIInputModeGetNormalizedIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v42 = v16;
      v21 = v16;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v49 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            TIInputModeGetNormalizedIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", v20);

            if (v28)
              v29 = v18;
            else
              v29 = v26;
            objc_msgSend(v19, "addObject:", v29);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        }
        while (v23);
      }

      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "preferencesActions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "saveInputModes:", v19);

      v5 = v44;
      v3 = v45;
      v16 = v42;
      v6 = v43;
      v17 = v41;
    }
    else
    {
      if (!objc_msgSend(v17, "count"))
      {
LABEL_28:

        v12 = v47;
LABEL_29:

        goto LABEL_30;
      }
      v46 = v7;
      objc_msgSend(v17, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputModeController showAddKeyboardAlertForInputModeIdentifier:](v3, "showAddKeyboardAlertForInputModeIdentifier:", v19);
    }

    v7 = v46;
    goto LABEL_28;
  }
  v7 = v5;
  if (v7)
    goto LABEL_7;
LABEL_30:
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "_isHardwareKeyboardAvailable");

  if ((v33 & 1) == 0)
  {
    -[UIKeyboardInputModeController handleLastUsedInputMode:withNewInputMode:](v3, "handleLastUsedInputMode:withNewInputMode:", 0, 0);
    userNotification = v3->_userNotification;
    if (userNotification)
    {
      if (v3->_keyboardTagForUserNotification)
      {
        +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "preferencesActions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *MEMORY[0x1E0DBE2B0];
        objc_msgSend(v36, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2B0]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v38, "containsObject:", v3->_keyboardTagForUserNotification))
        {
          v39 = (void *)objc_msgSend(v38, "mutableCopy");
          objc_msgSend(v39, "removeObject:", v3->_keyboardTagForUserNotification);
          objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setValue:forPreferenceKey:", v39, v37);

        }
        userNotification = v3->_userNotification;
      }
      CFUserNotificationCancel(userNotification);
      -[UIKeyboardInputModeController releaseAddKeyboardNotification](v3, "releaseAddKeyboardNotification");
    }
  }

}

- (id)supportedFullModesForHardwareKeyboard:(id)a3 countryCode:(id)a4 activeModes:(id)a5 matchedMode:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  UIKeyboardInputModeController *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id obj;
  char v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v53 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        TIInputModeGetNormalizedIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);
        if ((objc_msgSend(v18, "isEqualToString:", v17) & 1) == 0)
          objc_msgSend(v47, "setObject:forKey:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v14);
  }
  v39 = v12;

  v19 = v41;
  v40 = v9;
  UIKeyboardGetInputModesSupportingHardwareKeyboard();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v20;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v22)
  {
    v23 = v22;
    v46 = 0;
    v24 = *(_QWORD *)v49;
    v42 = v11;
    do
    {
      v25 = 0;
      v43 = v23;
      do
      {
        if (*(_QWORD *)v49 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v25);
        -[UIKeyboardInputModeController fullInputModeFromIdentifier:hardwareKeyboardLanguage:](self, "fullInputModeFromIdentifier:hardwareKeyboardLanguage:", v26, v19, v39, v40);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "containsObject:", v26))
        {
          objc_msgSend(v47, "objectForKey:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = v24;
            v30 = v21;
            v31 = self;
            +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v28);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            UIKeyboardGetHardwareLayoutFromInputMode(v32, v19, &unk_1E1A98100);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              TIInputModeGetComponentsFromIdentifier();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKey:", v33, CFSTR("hw"));
              objc_msgSend(v34, "objectForKey:", CFSTR("sw"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKey:", v35, CFSTR("sw"));

              objc_msgSend(v34, "objectForKey:", CFSTR("ml"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (v36)
                objc_msgSend(v27, "setObject:forKey:", v36, CFSTR("ml"));

              v19 = v41;
            }

            self = v31;
            v21 = v30;
            v24 = v29;
            v11 = v42;
            v23 = v43;
          }
          UIKeyboardInputModeGetIdentifierFromComponents(v27);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v46 & 1) != 0)
          {
            objc_msgSend(v21, "addObject:", v37);
          }
          else
          {
            objc_msgSend(v21, "insertObject:atIndex:", v37, 0);
            if (a6)
              *a6 = objc_retainAutorelease(v37);
          }

          v46 = 1;
        }
        else
        {
          objc_msgSend(v27, "setObject:forKey:", CFSTR("Automatic"), CFSTR("hw"));
          UIKeyboardInputModeGetIdentifierFromComponents(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);
        }

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v23);
  }

  return v21;
}

- (NSString)textEffectsButtonLanguageCode
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  NSString *v7;

  if (qword_1ECD79028 != -1)
    dispatch_once(&qword_1ECD79028, &__block_literal_global_649_1);
  UIKeyboardGetCurrentInputMode();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguageWithRegion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "scriptCodeFromLanguage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD79020, "objectForKeyedSubscript:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("en");
  v7 = v5;

  return v7;
}

void __62__UIKeyboardInputModeController_textEffectsButtonLanguageCode__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD79020;
  qword_1ECD79020 = (uint64_t)&unk_1E1A9B310;

}

- (UITextInputMode)documentInputMode
{
  return self->_documentInputMode;
}

- (NSArray)allowedExtensions
{
  return self->_allowedExtensions;
}

- (NSArray)suggestedInputModesForSiriLanguage
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSuggestedInputModesForSiriLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)disableFloatingKeyboardFilter
{
  return self->disableFloatingKeyboardFilter;
}

- (void)setDisableFloatingKeyboardFilter:(BOOL)a3
{
  self->disableFloatingKeyboardFilter = a3;
}

- (UIKeyboardInputMode)inputModeThatInvokeEmoji
{
  return self->_inputModeThatInvokeEmoji;
}

- (void)setInputModeThatInvokeEmoji:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeThatInvokeEmoji, a3);
}

- (void)setLastUsedInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedInputMode, a3);
}

- (void)setInputModeContextIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (UIKeyboardInputModeControllerDelegate)delegate
{
  return (UIKeyboardInputModeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)delegateImplementsDictationHandlingMethods
{
  return self->_delegateImplementsDictationHandlingMethods;
}

- (void)setDelegateImplementsDictationHandlingMethods:(BOOL)a3
{
  self->_delegateImplementsDictationHandlingMethods = a3;
}

- (BOOL)delegateImplementsLegacyDictationHandlingMethods
{
  return self->_delegateImplementsLegacyDictationHandlingMethods;
}

- (void)setDelegateImplementsLegacyDictationHandlingMethods:(BOOL)a3
{
  self->_delegateImplementsLegacyDictationHandlingMethods = a3;
}

- (BOOL)disablesUpdateLastUsedInputModeTimer
{
  return self->_disablesUpdateLastUsedInputModeTimer;
}

- (void)setDisablesUpdateLastUsedInputModeTimer:(BOOL)a3
{
  self->_disablesUpdateLastUsedInputModeTimer = a3;
}

- (void)setLastInputModeSwitchTriggeredByASCIIToggle:(BOOL)a3
{
  self->_lastInputModeSwitchTriggeredByASCIIToggle = a3;
}

- (void)setNextInputModeToUse:(id)a3
{
  objc_storeStrong((id *)&self->_nextInputModeToUse, a3);
}

- (UIKeyboardInputMode)currentUsedInputMode
{
  return self->_currentUsedInputMode;
}

- (void)setCurrentUsedInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_currentUsedInputMode, a3);
}

- (id)extensionMatchingContext
{
  return self->_extensionMatchingContext;
}

- (void)setExtensionMatchingContext:(id)a3
{
  objc_storeStrong(&self->_extensionMatchingContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionMatchingContext, 0);
  objc_storeStrong((id *)&self->_currentUsedInputMode, 0);
  objc_storeStrong((id *)&self->_nextInputModeToUse, 0);
  objc_storeStrong((id *)&self->_userSelectableKeyboardInputModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_userSelectableKeyboardInputModes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalTextInputLocales, 0);
  objc_storeStrong((id *)&self->_inputModeContextIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUsedInputMode, 0);
  objc_storeStrong((id *)&self->_inputModeThatInvokeEmoji, 0);
  objc_storeStrong((id *)&self->suggestedInputModesForSiriLanguage, 0);
  objc_storeStrong((id *)&self->defaultNormalizedInputModes, 0);
  objc_storeStrong((id *)&self->defaultInputModes, 0);
  objc_storeStrong((id *)&self->defaultRawInputModes, 0);
  objc_storeStrong((id *)&self->defaultKeyboardInputModes, 0);
  objc_storeStrong((id *)&self->normalizedInputModes, 0);
  objc_storeStrong((id *)&self->enabledInputModes, 0);
  objc_storeStrong((id *)&self->keyboardInputModeIdentifiers, 0);
  objc_storeStrong((id *)&self->keyboardInputModes, 0);
  objc_storeStrong((id *)&self->_documentInputMode, 0);
  objc_storeStrong((id *)&self->_keyboardTagForUserNotification, 0);
  objc_storeStrong((id *)&self->_newModeForUserNotification, 0);
  objc_storeStrong((id *)&self->_allowedExtensions, 0);
  objc_storeStrong((id *)&self->_allExtensions, 0);
  objc_storeStrong((id *)&self->_inputModesWithoutHardwareSupport, 0);
  objc_storeStrong((id *)&self->_currentInputMode, 0);
}

- (NSArray)supportedInputModeIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedInputModeIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKeyboardInputModeController identifiersFromInputModes:](self, "identifiersFromInputModes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (void)saveDeviceUnlockPasscodeInputModes
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardInputModeController enabledInputModeIdentifiers:](self, "enabledInputModeIdentifiers:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forPreferenceKey:", v3, *MEMORY[0x1E0DBDE00]);

}

uint64_t __102__UIKeyboardInputModeController_Compatibility__inputModesByAppendingApplicationLanguagesToInputModes___block_invoke()
{
  return TIGetDefaultInputModesForLanguage();
}

uint64_t __76__UIKeyboardInputModeController_Compatibility__enabledInputModeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    TIInputModeGetNormalizedIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  return v4;
}

- (NSArray)enabledInputModeLanguages
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIKeyboardInputModeController activeInputModes](self, "activeInputModes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "primaryLanguage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "containsObject:", v9) & 1) == 0
          && (objc_msgSend(v9, "isEqualToString:", CFSTR("emoji")) & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)inputModesFromIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(v4, "addObject:", v8);
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);

  }
  return v4;
}

@end
