@implementation SBFluidSwitcherModifierTimelineController

- (SBFluidSwitcherModifierTimelineController)initWithWindowScene:(id)a3
{
  id v4;
  SBFluidSwitcherModifierTimelineController *v5;
  SBFluidSwitcherModifierTimelineController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherModifierTimelineController;
  v5 = -[SBFluidSwitcherModifierTimelineController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_windowScene, v4);

  return v6;
}

- (void)setVisible:(BOOL)a3
{
  UIWindow *window;
  SBFluidSwitcherModifierTimelineViewController *v5;
  SBFluidSwitcherModifierTimelineViewController *rootViewController;
  id v7;
  id WeakRetained;
  objc_class *v9;
  void *v10;
  UIWindow *v11;
  UIWindow *v12;
  UIWindow *v13;
  SBFluidSwitcherModifierTimelineViewController *v14;

  self->_visible = a3;
  window = self->_window;
  if (a3)
  {
    if (!window)
    {
      v5 = -[SBFluidSwitcherModifierTimelineViewController initWithNibName:bundle:]([SBFluidSwitcherModifierTimelineViewController alloc], "initWithNibName:bundle:", 0, 0);
      rootViewController = self->_rootViewController;
      self->_rootViewController = v5;

      v7 = objc_alloc(MEMORY[0x1E0DA9F30]);
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (UIWindow *)objc_msgSend(v7, "initWithWindowScene:role:debugName:", WeakRetained, CFSTR("SBTraitsParticipantRoleModifierTimeline"), v10);
      v12 = self->_window;
      self->_window = v11;

      -[UIWindow setRootViewController:](self->_window, "setRootViewController:", self->_rootViewController);
      -[UIWindow setWindowLevel:](self->_window, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + 5.0 + 5.0);
      -[UIWindow setHidden:](self->_window, "setHidden:", 0);
      -[UIWindow makeKeyAndVisible](self->_window, "makeKeyAndVisible");
      -[SBFluidSwitcherModifierTimelineViewController bs_endAppearanceTransition:](self->_rootViewController, "bs_endAppearanceTransition:", 1);
    }
  }
  else if (window)
  {
    -[SBFluidSwitcherModifierTimelineViewController bs_endAppearanceTransition:](self->_rootViewController, "bs_endAppearanceTransition:", 0);
    -[UIWindow setHidden:](self->_window, "setHidden:", 1);
    v13 = self->_window;
    self->_window = 0;

    v14 = self->_rootViewController;
    self->_rootViewController = 0;

  }
}

- (BOOL)wantsEvent:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[SBFluidSwitcherModifierTimelineViewController ignoreNoisyEvents](self->_rootViewController, "ignoreNoisyEvents"))
  {
    v5 = objc_msgSend((id)objc_opt_class(), "_isNoisyEvent:", v4) ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

+ (BOOL)_isNoisyEvent:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = _isNoisyEvent__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isNoisyEvent__onceToken, &__block_literal_global_319);
  v5 = (void *)_isNoisyEvent__noisyEventTypeNums;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "type");

  objc_msgSend(v6, "numberWithInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v8);

  return (char)v5;
}

void __59__SBFluidSwitcherModifierTimelineController__isNoisyEvent___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E91CEF50);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_isNoisyEvent__noisyEventTypeNums;
  _isNoisyEvent__noisyEventTypeNums = v0;

}

- (void)addEntry:(id)a3
{
  -[SBFluidSwitcherModifierTimelineViewController addEntry:](self->_rootViewController, "addEntry:", a3);
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
