@implementation UIInlineInputSwitcher

- (void)reloadInputModes
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char IsNonLinguistic;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  UIInlineInputSwitcher *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_clearAllExtensionsIfNeeded");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMinimized");

  if (v6)
  {
    v29 = self;
    v30 = v3;
    UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isCustomInputView");

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController", v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "inputModeWithIdentifier:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10
            || (objc_msgSend(v18, "hardwareLayout"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v19,
                v19))
          {
            if ((objc_msgSend(v18, "isEmojiInputMode") & 1) == 0)
            {
              objc_msgSend(v18, "primaryLanguage");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              IsNonLinguistic = UIKeyboardInputModeIsNonLinguistic(v20);

              if ((IsNonLinguistic & 1) == 0 && (objc_msgSend(v18, "isExtensionInputMode") & 1) == 0)
                objc_msgSend(v30, "addObject:", v16);
            }
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v13);
    }

    self = v29;
    v3 = v30;
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = (id)UIKeyboardActiveInputModes;
    v22 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v32;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v11);
          v26 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v25);
          +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "inputModeWithIdentifier:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v28, "isEmojiInputMode") & 1) == 0)
            objc_msgSend(v3, "addObject:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v23);
    }
  }

  -[UIInlineInputSwitcher setAvailableInputModes:](self, "setAvailableInputModes:", v3);
}

- (id)defaultInputMode
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  UIKeyboardGetCurrentInputMode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) == 0)
  {
    -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return v3;
}

- (id)nextInputMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIInputSwitcher isVisible](self, "isVisible"))
    -[UIInlineInputSwitcher selectedInputMode](self, "selectedInputMode");
  else
    -[UIInlineInputSwitcher defaultInputMode](self, "defaultInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 + 1) % (unint64_t)objc_msgSend(v6, "count");

  -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)previousInputMode
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIInputSwitcher isVisible](self, "isVisible"))
    -[UIInlineInputSwitcher selectedInputMode](self, "selectedInputMode");
  else
    -[UIInlineInputSwitcher defaultInputMode](self, "defaultInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "indexOfObject:", v4);

  if (v5 <= 0)
  {
    -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count");

  }
  -[UIInlineInputSwitcher availableInputModes](self, "availableInputModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v5 - 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateInputModes:(id)a3 withHUD:(BOOL)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch");
  if (a4)
  {
    if (!v7)
    {
      -[UIInlineInputSwitcher reloadInputModes](self, "reloadInputModes");
      goto LABEL_9;
    }
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentLinguisticInputMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

    if (v11)
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inputModeForASCIIToggleWithTraits:", 0);
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    objc_msgSend(v9, "identifier", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInlineInputSwitcher setAvailableInputModes:](self, "setAvailableInputModes:", v15);

  }
  else
  {
    v17[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInlineInputSwitcher setAvailableInputModes:](self, "setAvailableInputModes:", v9);
  }

LABEL_9:
}

- (NSArray)availableInputModes
{
  return self->_availableInputModes;
}

- (void)setAvailableInputModes:(id)a3
{
  objc_storeStrong((id *)&self->_availableInputModes, a3);
}

- (BOOL)showingCapsLockSwitcher
{
  return self->_showingCapsLockSwitcher;
}

- (void)setShowingCapsLockSwitcher:(BOOL)a3
{
  self->_showingCapsLockSwitcher = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableInputModes, 0);
}

@end
