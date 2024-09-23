@implementation UIHUDInputSwitcher

- (UIHUDInputSwitcher)init
{
  UIHUDInputSwitcher *v2;
  uint64_t v3;
  UIInputSwitcherView *m_switcherView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIHUDInputSwitcher;
  v2 = -[UIInputSwitcher init](&v6, sel_init);
  if (v2)
  {
    +[UIInputSwitcherView sharedInstance](UIInputSwitcherView, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    m_switcherView = v2->m_switcherView;
    v2->m_switcherView = (UIInputSwitcherView *)v3;

  }
  return v2;
}

- (void)reloadInputModes
{
  -[UIInputSwitcherView reloadInputModes](self->m_switcherView, "reloadInputModes");
}

- (id)availableInputModes
{
  return -[UIInputSwitcherView inputModes](self->m_switcherView, "inputModes");
}

- (id)selectedInputMode
{
  void *v3;

  if (-[UIKeyboardMenuView isVisible](self->m_switcherView, "isVisible"))
  {
    -[UIInputSwitcherView selectedInputMode](self->m_switcherView, "selectedInputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->super.m_state == 1)
  {
    -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setSelectedInputMode:(id)a3
{
  id v4;

  v4 = a3;
  -[UIHUDInputSwitcher _showSwitcherViewAsHUD](self, "_showSwitcherViewAsHUD");
  -[UIInputSwitcherView selectInputMode:](self->m_switcherView, "selectInputMode:", v4);

}

- (id)nextInputMode
{
  return -[UIInputSwitcherView nextInputMode](self->m_switcherView, "nextInputMode");
}

- (id)previousInputMode
{
  return -[UIInputSwitcherView previousInputMode](self->m_switcherView, "previousInputMode");
}

- (void)setShowingCapsLockSwitcher:(BOOL)a3
{
  -[UIKeyboardMenuView setShowingCapsLockSwitcher:](self->m_switcherView, "setShowingCapsLockSwitcher:", a3);
}

- (BOOL)isVisibleOrHiding
{
  void *v2;
  BOOL v3;

  -[UIView superview](self->m_switcherView, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)dismissSwitcherWithDelay:(double)a3
{
  -[UIKeyboardMenuView setMode:](self->m_switcherView, "setMode:", 2);
  -[UIInputSwitcherView fadeWithDelay:](self->m_switcherView, "fadeWithDelay:", a3);
}

- (void)dismissSwitcher:(BOOL)a3
{
  if (a3)
    -[UIKeyboardMenuView setMode:](self->m_switcherView, "setMode:", 2);
  -[UIKeyboardMenuView hide](self->m_switcherView, "hide");
}

- (void)_showSwitcherViewAsHUD
{
  -[UIKeyboardMenuView setShowingCapsLockSwitcher:](self->m_switcherView, "setShowingCapsLockSwitcher:", -[UIInputSwitcher usingCapsLockLanguageSwitch](self, "usingCapsLockLanguageSwitch"));
  -[UIInputSwitcherView setShowsSwitches:](self->m_switcherView, "setShowsSwitches:", 0);
  -[UIKeyboardMenuView showAsHUD](self->m_switcherView, "showAsHUD");
}

- (BOOL)handleSwitchCommand:(BOOL)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  unint64_t v10;
  objc_super v12;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  -[UIInputSwitcherView reloadInputModes](self->m_switcherView, "reloadInputModes");
  -[UIInputSwitcherView inputModes](self->m_switcherView, "inputModes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < 2)
    return 0;
  v12.receiver = self;
  v12.super_class = (Class)UIHUDInputSwitcher;
  return -[UIInputSwitcher handleSwitchCommand:withHUD:withDelay:](&v12, sel_handleSwitchCommand_withHUD_withDelay_, v7, v6, v5);
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  int m_state;
  BOOL v12;
  void *v13;
  void *v14;
  UIInputSwitcherView *m_switcherView;
  void *v16;
  UIInputSwitcherView *v17;
  void *v18;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (id)UIKeyboardActiveUserSelectableInputModes;
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
LABEL_16:
    v12 = 0;
    goto LABEL_20;
  }
  -[UIInputSwitcher setLoadedIdentifier:](self, "setLoadedIdentifier:", v8);
  if (!v6
    || (-[UIKeyboardMenuView containerView](self->m_switcherView, "containerView"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInputMode:userInitiated:", v14, 1);

    if (v5)
    {
      -[UIHUDInputSwitcher _showSwitcherViewAsHUD](self, "_showSwitcherViewAsHUD");
      m_switcherView = self->m_switcherView;
      -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputSwitcherView selectInputMode:](m_switcherView, "selectInputMode:", v16);

      -[UIKeyboardMenuView setMode:](self->m_switcherView, "setMode:", 2);
      -[UIInputSwitcherView fadeWithDelay:](self->m_switcherView, "fadeWithDelay:", 0.5);
      self->super.m_state = 0;
    }
    else
    {
      -[UIInputSwitcher hideSwitcher](self, "hideSwitcher");
    }
    goto LABEL_19;
  }
  m_state = self->super.m_state;
  if (m_state == 2)
  {
LABEL_13:
    -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
LABEL_18:
    v17 = self->m_switcherView;
    -[UIInputSwitcher loadedIdentifier](self, "loadedIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputSwitcherView selectInputMode:](v17, "selectInputMode:", v18);

LABEL_19:
    v12 = 1;
    goto LABEL_20;
  }
  if (m_state == 1)
  {
    self->super.m_state = 2;
    -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
    -[UIHUDInputSwitcher _showSwitcherViewAsHUD](self, "_showSwitcherViewAsHUD");
    goto LABEL_13;
  }
  if (m_state)
  {
    if (-[UIInputSwitcher isVisible](self, "isVisible"))
      -[UIInputSwitcher hideSwitcher](self, "hideSwitcher");
    goto LABEL_16;
  }
  if (!v5)
  {
    self->super.m_state = 2;
    -[UIInputSwitcher cancelShowSwitcherTimer](self, "cancelShowSwitcherTimer");
    -[UIHUDInputSwitcher _showSwitcherViewAsHUD](self, "_showSwitcherViewAsHUD");
    goto LABEL_18;
  }
  -[UIInputSwitcher touchShowSwitcherTimer](self, "touchShowSwitcherTimer");
  v12 = 1;
  self->super.m_state = 1;
LABEL_20:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_switcherView, 0);
}

@end
