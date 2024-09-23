@implementation SBBannerWindow

- (SBBannerWindow)initWithWindowScene:(id)a3
{
  id v4;
  SBBannerWindow *v5;
  SBBannerWindow *v6;
  void *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBBannerWindow;
  v5 = -[SBBannerWindow initWithWindowScene:](&v10, sel_initWithWindowScene_, v4);
  v6 = v5;
  if (v5)
  {
    -[SBBannerWindow _setRoleHint:](v5, "_setRoleHint:", CFSTR("SBTraitsParticipantRoleBanner"));
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBBannerWindow setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SBBannerWindow setOpaque:](v6, "setOpaque:", 0);
    v8 = (id)objc_msgSend(MEMORY[0x1E0CEAAC8], "sharedTextEffectsWindowForWindowScene:", v4);
    -[SBBannerWindow setHidden:](v6, "setHidden:", 1);
  }

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBBannerWindow *v5;
  void *v6;
  SBBannerWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBBannerWindow;
  -[SBBannerWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBBannerWindow *)objc_claimAutoreleasedReturnValue();
  if (v5 == self
    || (-[SBBannerWindow rootViewController](self, "rootViewController"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "view"),
        v7 = (SBBannerWindow *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v5 == v7))
  {

    v5 = 0;
  }
  return v5;
}

- (BOOL)_canBecomeKeyWindow
{
  void *v2;
  char v3;

  -[SBBannerWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[SBBannerWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[SBBannerWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[SBBannerWindow rootViewController](self, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[SBBannerWindow rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", v3 ^ 1, 0);
  v6.receiver = self;
  v6.super_class = (Class)SBBannerWindow;
  -[SBFWindow setHidden:](&v6, sel_setHidden_, v3);
  objc_msgSend(v5, "bs_endAppearanceTransition");

}

@end
