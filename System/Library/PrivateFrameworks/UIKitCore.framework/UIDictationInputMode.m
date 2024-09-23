@implementation UIDictationInputMode

- (BOOL)isCurrentDictationLanguageOnDevice
{
  return self->_isCurrentDictationLanguageOnDevice;
}

- (BOOL)usingTypeAndTalk
{
  _BOOL4 v3;

  v3 = +[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled");
  if (v3)
    LOBYTE(v3) = self->_usingTypeAndTalk;
  return v3;
}

+ (BOOL)currentInputModeSupportsDictation
{
  return +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation");
}

- (Class)viewControllerClass
{
  return 0;
}

- (BOOL)includeBarHeight
{
  return 0;
}

- (void)setUsingTypeAndTalk:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled"))
  {
    self->_usingTypeAndTalk = a3;
    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputDelegateManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputSystemSourceSession");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "textOperations");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_setUsingTypeAndTalk_);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("selector"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_usingTypeAndTalk);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("usingTypeAndTalk"));

        objc_msgSend(v7, "setCustomInfoType:", 0x1E1750220);
        objc_msgSend(v7, "setCustomInfo:", v8);
        objc_msgSend(v11, "flushOperations");

      }
    }
  }
}

- (void)setIsCurrentDictationLanguageOnDevice:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_isCurrentDictationLanguageOnDevice = a3;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSystemSourceSession");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "textOperations");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_setIsCurrentDictationLanguageOnDevice_);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("selector"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("isCurrentDictationLanguageOnDevice"));

      objc_msgSend(v6, "setCustomInfoType:", 0x1E1750220);
      objc_msgSend(v6, "setCustomInfo:", v7);
      objc_msgSend(v10, "flushOperations");

    }
  }
}

- (id)indicatorIconForDictationLanguage:(id)a3 scaleFactor:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *cachedIcons;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[4];
  id v32;

  v6 = a3;
  if (self->_cachedIcons)
  {
    -[UIKeyboardInputMode cachedSizeCategory](self, "cachedSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
      -[NSMutableDictionary removeAllObjects](self->_cachedIcons, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    cachedIcons = self->_cachedIcons;
    self->_cachedIcons = v10;

  }
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%.2f"), *(_QWORD *)&a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_cachedIcons, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyboardLanguageForDictationLanguage:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "isEqualToString:", v6))
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "activeInputModes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __70__UIDictationInputMode_indicatorIconForDictationLanguage_scaleFactor___block_invoke;
      v31[3] = &unk_1E16BB0B0;
      v19 = v16;
      v32 = v19;
      v20 = objc_msgSend(v18, "indexOfObjectPassingTest:", v31);

      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v21, "inputModeWithIdentifier:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v21, "activeInputModes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndex:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[_UIKeyboardInputModeIconConfiguration defaultConfiguration](_UIKeyboardInputModeIconConfiguration, "defaultConfiguration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setScaleFactor:", a4);
      objc_msgSend(v23, "_indicatorIconWithConfiguration:", v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v32;
    }
    else
    {
      UIKeyboardLocalizedDictationDisplayName(v6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "length"))
      {
        v27 = 0;
        goto LABEL_17;
      }
      +[_UIKeyboardInputModeIconConfiguration defaultConfiguration](_UIKeyboardInputModeIconConfiguration, "defaultConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "substringToIndex:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardInputMode imageForInputModeLabel:secondaryIconLabel:artwork:withConfiguration:](self, "imageForInputModeLabel:secondaryIconLabel:artwork:withConfiguration:", v26, 0, 0, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v27)
    {
LABEL_18:
      v14 = v27;

      goto LABEL_19;
    }
    -[NSMutableDictionary setObject:forKey:](self->_cachedIcons, "setObject:forKey:", v27, v12);
    objc_msgSend((id)UIApp, "preferredContentSizeCategory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKeyboardInputMode setCachedSizeCategory:](self, "setCachedSizeCategory:", v24);
LABEL_17:

    goto LABEL_18;
  }
  v14 = v13;
LABEL_19:

  return v14;
}

uint64_t __70__UIDictationInputMode_indicatorIconForDictationLanguage_scaleFactor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "normalizedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)showSWLayoutWithHWKeyboard
{
  return !+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled");
}

- (UITouch)triggeringTouch
{
  return self->_triggeringTouch;
}

- (void)setTriggeringTouch:(id)a3
{
  objc_storeStrong((id *)&self->_triggeringTouch, a3);
}

- (UIKeyboardInputMode)currentInputModeForDictation
{
  return self->_currentInputModeForDictation;
}

- (void)setCurrentInputModeForDictation:(id)a3
{
  objc_storeStrong((id *)&self->_currentInputModeForDictation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInputModeForDictation, 0);
  objc_storeStrong((id *)&self->_triggeringTouch, 0);
  objc_storeStrong((id *)&self->_cachedIcons, 0);
}

@end
