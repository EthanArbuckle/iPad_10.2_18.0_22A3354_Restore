@implementation UIInputSwitcher

+ (id)activeInstance
{
  return (id)_MergedGlobals_7_6;
}

+ (id)sharedInstance
{
  uint64_t *v2;
  void *v3;
  __objc2_class **v4;
  id v5;
  id v6;

  if (+[UIKeyboard isLanguageIndicatorEnabled](UIKeyboard, "isLanguageIndicatorEnabled"))
  {
    v2 = &qword_1ECD7B1B0;
    v3 = (void *)qword_1ECD7B1B0;
    if (!qword_1ECD7B1B0)
    {
      v4 = off_1E167A960;
LABEL_6:
      v5 = objc_alloc_init(*v4);
      v6 = (id)*v2;
      *v2 = (uint64_t)v5;

      v3 = (void *)*v2;
    }
  }
  else
  {
    v2 = &qword_1ECD7B1B8;
    v3 = (void *)qword_1ECD7B1B8;
    if (!qword_1ECD7B1B8)
    {
      v4 = off_1E167A8A0;
      goto LABEL_6;
    }
  }
  objc_storeStrong((id *)&_MergedGlobals_7_6, v3);
  return (id)*v2;
}

- (UIInputSwitcher)init
{
  UIInputSwitcher *v2;
  UIInputSwitcher *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIInputSwitcher;
  v2 = -[UIInputSwitcher init](&v5, sel_init);
  if (v2)
  {
    v2->m_lastGlobeKeyUpTime = CFAbsoluteTimeGetCurrent() + -10.0;
    v2->m_state = 0;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIWindowWillRotateNotification"), 0);

  -[UIInputSwitcher setLoadedIdentifier:](self, "setLoadedIdentifier:", 0);
  -[UIInputSwitcher clearShowSwitcherTimer](self, "clearShowSwitcherTimer");
  -[UIInputSwitcher clearHideSwitcherTimer](self, "clearHideSwitcherTimer");
  v4.receiver = self;
  v4.super_class = (Class)UIInputSwitcher;
  -[UIInputSwitcher dealloc](&v4, sel_dealloc);
}

- (void)hideSwitcher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  -[UIInputSwitcher cancelHideSwitcherTimer](self, "cancelHideSwitcherTimer");
  -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
  -[UIInputSwitcher selectedInputMode](self, "selectedInputMode");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isCustomInputView") & 1) != 0)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputModeWithIdentifier:", v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hardwareLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_9:
      -[UIInputSwitcher dismissSwitcherWithDelay:](self, "dismissSwitcherWithDelay:", 0.0);
      goto LABEL_10;
    }
  }
  else
  {

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInputMode:userInitiated:", v11, 1);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInHardwareKeyboardMode");

  if (!v10 || (objc_msgSend(v11, "containsString:", CFSTR("emoji")) & 1) == 0)
    goto LABEL_9;
  -[UIInputSwitcher dismissSwitcher:](self, "dismissSwitcher:", 1);
LABEL_10:
  -[UIInputSwitcher cleanUpAfterHide](self, "cleanUpAfterHide");

}

- (void)cleanUpAfterHide
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  self->m_state = 0;
  -[UIInputSwitcher clearShowSwitcherTimer](self, "clearShowSwitcherTimer");
}

- (void)cancelHideSwitcherTimer
{
  UIDelayedAction *m_hideSwitcherDelay;

  m_hideSwitcherDelay = self->m_hideSwitcherDelay;
  if (m_hideSwitcherDelay)
    -[UIDelayedAction cancel](m_hideSwitcherDelay, "cancel");
}

- (void)touchHideSwitcherTimer
{
  double v3;
  UIDelayedAction *m_hideSwitcherDelay;
  UIDelayedAction *v5;
  UIDelayedAction *v6;

  -[UIInputSwitcher setShowingCapsLockSwitcher:](self, "setShowingCapsLockSwitcher:", -[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch"));
  if (-[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch"))
    v3 = 0.5;
  else
    v3 = 1.0;
  m_hideSwitcherDelay = self->m_hideSwitcherDelay;
  if (m_hideSwitcherDelay)
  {
    -[UIDelayedAction touchWithDelay:](m_hideSwitcherDelay, "touchWithDelay:", v3);
  }
  else
  {
    v5 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_hideSwitcher, 0, v3);
    v6 = self->m_hideSwitcherDelay;
    self->m_hideSwitcherDelay = v5;

  }
}

- (void)clearHideSwitcherTimer
{
  UIDelayedAction *m_hideSwitcherDelay;

  -[UIDelayedAction setTarget:](self->m_hideSwitcherDelay, "setTarget:", 0);
  m_hideSwitcherDelay = self->m_hideSwitcherDelay;
  self->m_hideSwitcherDelay = 0;

}

- (void)showSwitcherShouldAutoHide:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputSwitcher setSelectedInputMode:](self, "setSelectedInputMode:", v5);

  self->m_state = 2;
  if (v3)
    -[UIInputSwitcher touchHideSwitcherTimer](self, "touchHideSwitcherTimer");
  if ((UIKeyboardAutomaticIsOnScreen() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleRotate_, CFSTR("UIWindowWillRotateNotification"), 0);

  }
}

- (void)showSwitcherWithAutoHide
{
  -[UIInputSwitcher showSwitcherShouldAutoHide:](self, "showSwitcherShouldAutoHide:", 1);
}

- (void)showSwitcherWithoutAutoHide
{
  -[UIInputSwitcher showSwitcherShouldAutoHide:](self, "showSwitcherShouldAutoHide:", 0);
}

- (void)touchShowSwitcherTimer
{
  UIDelayedAction *m_showSwitcherDelay;
  _BOOL4 v4;
  double v5;
  UIDelayedAction *v6;
  UIDelayedAction *v7;

  m_showSwitcherDelay = self->m_showSwitcherDelay;
  if (m_showSwitcherDelay)
  {
    v4 = -[UIInputSwitcher isVisibleOrHiding](self, "isVisibleOrHiding");
    v5 = 0.1;
    if (v4)
      v5 = 0.0;
    -[UIDelayedAction touchWithDelay:](m_showSwitcherDelay, "touchWithDelay:", v5);
  }
  else
  {
    v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_showSwitcherWithAutoHide, 0, 0.1);
    v7 = self->m_showSwitcherDelay;
    self->m_showSwitcherDelay = v6;

  }
}

- (void)cancelShowSwitcherTimer
{
  UIDelayedAction *m_showSwitcherDelay;

  m_showSwitcherDelay = self->m_showSwitcherDelay;
  if (m_showSwitcherDelay)
    -[UIDelayedAction cancel](m_showSwitcherDelay, "cancel");
}

- (void)clearShowSwitcherTimer
{
  UIDelayedAction *m_showSwitcherDelay;

  -[UIDelayedAction setTarget:](self->m_showSwitcherDelay, "setTarget:", 0);
  m_showSwitcherDelay = self->m_showSwitcherDelay;
  self->m_showSwitcherDelay = 0;

}

- (BOOL)isVisible
{
  return self->m_state == 2;
}

- (id)inputModeIdentifierWithNextFlag:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;

  if (a3)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextInputModeToUseForTraits:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (-[UIInputSwitcher availableInputModes](self, "availableInputModes"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "containsObject:", v8),
          v9,
          v10))
    {
      v11 = v8;
    }
    else
    {
      -[UIInputSwitcher nextInputMode](self, "nextInputMode");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    if (!v12)
      goto LABEL_9;
  }
  else
  {
    -[UIInputSwitcher previousInputMode](self, "previousInputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_9:
      UIKeyboardGetCurrentInputMode();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v12;
}

- (void)hideSwitcherIfNeeded
{
  if (self->m_state)
    -[UIInputSwitcher hideSwitcher](self, "hideSwitcher");
}

- (BOOL)handleSwitchCommand:(BOOL)a3
{
  return -[UIInputSwitcher handleSwitchCommand:withHUD:withDelay:](self, "handleSwitchCommand:withHUD:withDelay:", a3, 1, 1);
}

- (BOOL)handleSwitchCommand:(BOOL)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  BOOL v9;

  v5 = a5;
  v6 = a4;
  -[UIInputSwitcher inputModeIdentifierWithNextFlag:](self, "inputModeIdentifierWithNextFlag:", !a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[UIInputSwitcher touchHideSwitcherTimer](self, "touchHideSwitcherTimer");
  v9 = -[UIInputSwitcher switchMode:withHUD:withDelay:](self, "switchMode:withHUD:withDelay:", v8, v6, v5);

  return v9;
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5 fromCapsLock:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  BOOL v11;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  -[UIInputSwitcher setUsingCapsLockLanguageSwitch:](self, "setUsingCapsLockLanguageSwitch:", v6);
  if (v6)
    -[UIInputSwitcher handleEmojiPicker](self, "handleEmojiPicker");
  v11 = -[UIInputSwitcher switchMode:withHUD:withDelay:](self, "switchMode:withHUD:withDelay:", v10, v8, v7);

  return v11;
}

- (void)updateHardwareLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputModeWithIdentifier:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "automaticHardwareLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)UIApp;
    objc_msgSend(v8, "automaticHardwareLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHardwareKeyboardLayoutName:", v7);

  }
}

- (BOOL)handleSwitchingKeyEvent:(id)a3
{
  id v4;
  _BOOL8 v5;
  int v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  char v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[UIInputSwitcher isVisibleOrHiding](self, "isVisibleOrHiding");
  if (objc_msgSend(v4, "_isGlobeKey"))
    v6 = objc_msgSend(v4, "_isKeyDown") ^ 1;
  else
    v6 = 0;
  v7 = -[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch") && v5;
  if (objc_msgSend(v4, "_modifierFlags") == 0x40000)
  {
    objc_msgSend(v4, "_unmodifiedInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR(" "));

    if (v9)
    {
      -[UIInputSwitcher setUsingCapsLockLanguageSwitch:](self, "setUsingCapsLockLanguageSwitch:", 0);
      -[UIInputSwitcher setShowingCapsLockSwitcher:](self, "setShowingCapsLockSwitcher:", 0);
      if (v7)
      {
        -[UIInputSwitcher hideSwitcher](self, "hideSwitcher");
        if (v6)
        {
          -[UIInputSwitcher setUsingCapsLockLanguageSwitch:](self, "setUsingCapsLockLanguageSwitch:", 0);
LABEL_11:
          -[UIInputSwitcher hideSwitcherIfNeeded](self, "hideSwitcherIfNeeded");
          goto LABEL_14;
        }
      }
      else if (v6)
      {
        -[UIInputSwitcher setUsingCapsLockLanguageSwitch:](self, "setUsingCapsLockLanguageSwitch:", 0);
        goto LABEL_14;
      }
LABEL_16:
      v12 = 0;
      goto LABEL_17;
    }
  }
  if ((v6 & 1) == 0)
    goto LABEL_16;
  -[UIInputSwitcher setUsingCapsLockLanguageSwitch:](self, "setUsingCapsLockLanguageSwitch:", 0);
  if (v7)
    goto LABEL_11;
LABEL_14:
  -[UIInputSwitcher reloadInputModes](self, "reloadInputModes");
  -[UIInputSwitcher availableInputModes](self, "availableInputModes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (-[UIInputSwitcher handleEmojiPicker](self, "handleEmojiPicker"))
  {
    v12 = 1;
    goto LABEL_25;
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferencesActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v14, "useHardwareGlobeKeyAsEmojiKey");

  if (v11 >= 2 && (v12 & 1) == 0)
    v12 = -[UIInputSwitcher handleGlobeKeyEvent:switcherIsVisible:](self, "handleGlobeKeyEvent:switcherIsVisible:", v4, v5);
LABEL_17:
  if ((v12 & 1) == 0 && v5)
  {
    if (objc_msgSend(v4, "_isKeyDown"))
      v12 = -[UIInputSwitcher handleNavigationEvent:](self, "handleNavigationEvent:", v4);
    else
      v12 = 0;
  }
LABEL_25:

  return v12;
}

- (BOOL)handleGlobeKeyEvent:(id)a3 switcherIsVisible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL8 v7;
  double Current;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v6 = a3;
  v7 = -[UIInputSwitcher needsFullHUD](self, "needsFullHUD");
  Current = CFAbsoluteTimeGetCurrent();
  -[UIInputSwitcher inputModeIdentifierWithNextFlag:](self, "inputModeIdentifierWithNextFlag:", objc_msgSend(v6, "_modifierFlags") != 0x20000);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIInputSwitcher dismissingEmojiPopover](self, "dismissingEmojiPopover"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentLinguisticInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();

    -[UIInputSwitcher setDismissingEmojiPopover:](self, "setDismissingEmojiPopover:", 0);
    v9 = (void *)v12;
  }
  -[UIInputSwitcher switchMode:withHUD:withDelay:](self, "switchMode:withHUD:withDelay:", v9, v7, 0);
  if (v4)
    -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
  -[UIInputSwitcher touchHideSwitcherTimer](self, "touchHideSwitcherTimer");
  self->m_lastGlobeKeyUpTime = Current;
  if (objc_msgSend(v6, "_modifierFlags") != 0x20000)
    -[UIInputSwitcher updateHardwareLayout](self, "updateHardwareLayout");

  return 1;
}

- (BOOL)handleNavigationEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;

  v4 = a3;
  objc_msgSend(v4, "_unmodifiedInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");

  if (+[UIKeyboard isLanguageIndicatorEnabled](UIKeyboard, "isLanguageIndicatorEnabled"))
  {
    -[UIInputSwitcher availableInputModes](self, "availableInputModes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 1;

  }
  else
  {
    v7 = 0;
  }
  if (-[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch"))
    goto LABEL_21;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEmojiPopoverPresented") | v7;

  if ((v9 & 1) != 0)
    goto LABEL_21;
  objc_msgSend(v4, "_unmodifiedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("UIKeyInputDownArrow"));
  if ((v11 & 1) != 0)
    goto LABEL_10;
  objc_msgSend(v4, "_unmodifiedInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("UIKeyInputPageDown"));

  if ((v13 & 1) != 0)
  {
    v11 = 1;
    goto LABEL_11;
  }
  objc_msgSend(v4, "_unmodifiedInput");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UIKeyInputUpArrow")) & 1) != 0)
  {
LABEL_10:

  }
  else
  {
    objc_msgSend(v4, "_unmodifiedInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("UIKeyInputPageUp"));

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v4, "_unmodifiedInput");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("\r")))
      {

      }
      else
      {
        objc_msgSend(v4, "_unmodifiedInput");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "isEqualToString:", CFSTR(" ")) & 1) == 0)
        {

          goto LABEL_21;
        }
        v21 = objc_msgSend(v4, "_modifierFlags");

        if ((v21 & 0x40000) != 0)
        {
LABEL_21:
          v16 = 0;
          goto LABEL_22;
        }
      }
      -[UIInputSwitcher hideSwitcher](self, "hideSwitcher");
      v16 = 1;
      goto LABEL_22;
    }
    v11 = 0;
  }
LABEL_11:
  -[UIInputSwitcher inputModeIdentifierWithNextFlag:](self, "inputModeIdentifierWithNextFlag:", v11);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_21;
  v15 = (void *)v14;
  v16 = 1;
  -[UIInputSwitcher switchMode:withHUD:withDelay:](self, "switchMode:withHUD:withDelay:", v14, 1, 0);
  -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
  -[UIInputSwitcher touchHideSwitcherTimer](self, "touchHideSwitcherTimer");

LABEL_22:
  return v16;
}

- (BOOL)handleEmojiPicker
{
  void *v3;
  int v4;
  BOOL v5;
  void *v6;
  void *v8;
  _QWORD v9[5];

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiPopoverVisibleOrDismissing");

  if (!v4)
  {
    if (!-[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch")
      && !-[UIInputSwitcher needsFullHUD](self, "needsFullHUD"))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentEmojiPopoverViaTrigger:completion:", CFSTR("globeKey"), 0);

      -[UIInputSwitcher cancelHideSwitcherTimer](self, "cancelHideSwitcherTimer");
      -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
      -[UIInputSwitcher dismissSwitcher:](self, "dismissSwitcher:", 0);
      -[UIInputSwitcher cleanUpAfterHide](self, "cleanUpAfterHide");
      return 1;
    }
    return 0;
  }
  if (-[UIInputSwitcher needsFullHUD](self, "needsFullHUD")
    || -[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch"))
  {
    return 0;
  }
  if (-[UIInputSwitcher dismissingEmojiPopover](self, "dismissingEmojiPopover"))
    return 1;
  v5 = 1;
  -[UIInputSwitcher setDismissingEmojiPopover:](self, "setDismissingEmojiPopover:", 1);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__UIInputSwitcher_handleEmojiPicker__block_invoke;
  v9[3] = &unk_1E16B3FD8;
  v9[4] = self;
  objc_msgSend(v6, "dismissEmojiPopoverIfNecessaryWithCompletion:", v9);

  return v5;
}

uint64_t __36__UIInputSwitcher_handleEmojiPicker__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearShowSwitcherTimer");
  return objc_msgSend(*(id *)(a1 + 32), "setDismissingEmojiPopover:", 0);
}

- (BOOL)needsFullHUD
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  -[UIInputSwitcher availableInputModes](self, "availableInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
    goto LABEL_8;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPresentEmojiPopover");
  if ((v5 & 1) == 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isEmojiPopoverVisibleOrDismissing") & 1) == 0)
    {

      goto LABEL_10;
    }
  }
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "useHardwareGlobeKeyAsEmojiKey");

  if ((v5 & 1) == 0)
  {

    if ((v8 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v9 = 1;
    goto LABEL_11;
  }

  if (!v8)
    goto LABEL_10;
LABEL_8:
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)handleModifiersChangedEvent:(id)a3
{
  id v4;
  int v5;
  unsigned int v6;
  int m_state;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "_gsModifierFlags");
  v6 = objc_msgSend(v4, "_inputFlags");

  if ((v6 & 0x20) != 0)
  {
    if ((v5 & 0x220000) != 0 || handleModifiersChangedEvent__lastMods & 0x220000 | v5 & 0x900000)
      goto LABEL_10;
    m_state = self->m_state;
    if (m_state == 1)
    {
      -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
      -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setInputMode:userInitiated:", v10, 1);

        -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIInputSwitcher setSelectedInputMode:](self, "setSelectedInputMode:", v11);

        -[UIInputSwitcher dismissSwitcherWithDelay:](self, "dismissSwitcherWithDelay:", 1.5);
      }
    }
    else
    {
      if (m_state != 2)
      {
LABEL_10:
        handleModifiersChangedEvent__lastMods = v5;
        return (v6 >> 5) & 1;
      }
      -[UIInputSwitcher hideSwitcher](self, "hideSwitcher");
    }
    self->m_state = 0;
    goto LABEL_10;
  }
  return (v6 >> 5) & 1;
}

- (void)reloadInputModes
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 542, CFSTR("Subclass must implement"));

}

- (id)availableInputModes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 546, CFSTR("Subclass must implement"));

  return (id)MEMORY[0x1E0C9AA60];
}

- (id)selectedInputMode
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 551, CFSTR("Subclass must implement"));

  return &stru_1E16EDF20;
}

- (void)setSelectedInputMode:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 556, CFSTR("Subclass must implement"));

}

- (id)nextInputMode
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 560, CFSTR("Subclass must implement"));

  return 0;
}

- (id)previousInputMode
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 565, CFSTR("Subclass must implement"));

  return 0;
}

- (void)setShowingCapsLockSwitcher:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 571, CFSTR("Subclass must implement"));

}

- (BOOL)isVisibleOrHiding
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 576, CFSTR("Subclass must implement"));

  return 0;
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 582, CFSTR("Subclass must implement"));

  return 0;
}

- (void)dismissSwitcherWithDelay:(double)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 587, CFSTR("Subclass must implement"));

}

- (void)dismissSwitcher:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIInputSwitcher.m"), 591, CFSTR("Subclass must implement"));

}

- (NSString)loadedIdentifier
{
  return self->_loadedIdentifier;
}

- (void)setLoadedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)usingCapsLockLanguageSwitch
{
  return self->_usingCapsLockLanguageSwitch;
}

- (void)setUsingCapsLockLanguageSwitch:(BOOL)a3
{
  self->_usingCapsLockLanguageSwitch = a3;
}

- (BOOL)dismissingEmojiPopover
{
  return self->_dismissingEmojiPopover;
}

- (void)setDismissingEmojiPopover:(BOOL)a3
{
  self->_dismissingEmojiPopover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedIdentifier, 0);
  objc_storeStrong((id *)&self->_newMode, 0);
  objc_storeStrong((id *)&self->m_hideSwitcherDelay, 0);
  objc_storeStrong((id *)&self->m_showSwitcherDelay, 0);
}

@end
