@implementation _UIKeyShortcutHUDWindow

- (_UIKeyShortcutHUDWindow)initWithWindowScene:(id)a3
{
  id v4;
  _UIKeyShortcutHUDWindow *v5;
  _UIKeyShortcutHUDWindow *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIKeyShortcutHUDWindow;
  v5 = -[UIWindow initWithWindowScene:](&v11, sel_initWithWindowScene_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIView setOpaque:](v5, "setOpaque:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIWindow setWindowLevel:](v6, "setWindowLevel:", 2200.0);
    -[UIView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHitTestsAsOpaque:", 1);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel__hudWindowSceneDidResignTargetOfKeyboardEventDeferringEnvironment_, CFSTR("_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification"), v4);

  }
  return v6;
}

- (void)resignKeyWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDWindow;
  -[UIWindow resignKeyWindow](&v4, sel_resignKeyWindow);
  -[_UIKeyShortcutHUDWindow delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyShortcutHUDWindowDidResignKey:", self);

}

- (void)_hudWindowSceneDidResignTargetOfKeyboardEventDeferringEnvironment:(id)a3
{
  id v4;

  -[_UIKeyShortcutHUDWindow delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyShortcutHUDWindowSceneDidResignKeyboardFocus:", self);

}

+ (BOOL)_isSystemWindow
{
  return 1;
}

- (BOOL)_wantsFocusEngine
{
  return 1;
}

- (id)_roleHint
{
  return CFSTR("_UIWindowRoleHintKeyCommandHUD");
}

- (id)keyCommands
{
  return self->_hudKeyCommands;
}

- (_UIKeyShortcutHUDWindowDelegate)delegate
{
  return (_UIKeyShortcutHUDWindowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)hudKeyCommands
{
  return self->_hudKeyCommands;
}

- (void)setHudKeyCommands:(id)a3
{
  objc_storeStrong((id *)&self->_hudKeyCommands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hudKeyCommands, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
