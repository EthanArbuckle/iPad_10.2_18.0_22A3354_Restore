@implementation SBOldBannerWindow

- (SBOldBannerWindow)initWithWindowScene:(id)a3
{
  id v4;
  SBOldBannerWindow *v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBOldBannerWindow;
  v5 = -[SBMainScreenActiveInterfaceOrientationWindow initWithWindowScene:role:debugName:](&v9, sel_initWithWindowScene_role_debugName_, v4, CFSTR("SBTraitsParticipantRoleBanner"), CFSTR("bannerPresentationWindow"));
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBOldBannerWindow setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[SBOldBannerWindow setOpaque:](v5, "setOpaque:", 0);
    -[SBMainScreenActiveInterfaceOrientationWindow setPassesTouchesThrough:](v5, "setPassesTouchesThrough:", 1);
    v7 = (id)objc_msgSend(MEMORY[0x1E0CEAAC8], "sharedTextEffectsWindowForWindowScene:", v4);
    -[SBOldBannerWindow setHidden:](v5, "setHidden:", 1);
  }

  return v5;
}

- (BOOL)_canBecomeKeyWindow
{
  void *v2;
  char v3;

  -[SBMainScreenActiveInterfaceOrientationWindow contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canBecomeFirstResponder");

  return v3;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[SBMainScreenActiveInterfaceOrientationWindow contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[SBMainScreenActiveInterfaceOrientationWindow contentViewController](self, "contentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[SBMainScreenActiveInterfaceOrientationWindow contentViewController](self, "contentViewController");
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
  -[SBMainScreenActiveInterfaceOrientationWindow rootViewController](self, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", v3 ^ 1, 0);
  v6.receiver = self;
  v6.super_class = (Class)SBOldBannerWindow;
  -[SBMainScreenActiveInterfaceOrientationWindow setHidden:](&v6, sel_setHidden_, v3);
  objc_msgSend(v5, "bs_endAppearanceTransition");

}

+ (BOOL)layoutContentViewControllerWithConstraints
{
  return 0;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return CFSTR("SBTraitsParticipantRoleBanner");
}

@end
