@implementation SBHomeScreenController(AppearanceControlling)

- (void)_setupHomeScreenDimmingWindow
{
  void *v3;
  void *v4;
  void *v5;
  SBWindow *v6;
  void *v7;
  SBWindow *v8;
  SBWindow *homeScreenDimmingWindow;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0CEABB8]);
  objc_msgSend(v10, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v10, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", 0.0);

  v6 = [SBWindow alloc];
  -[SBHomeScreenController windowScene](self, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBWindow initWithWindowScene:rootViewController:role:debugName:](v6, "initWithWindowScene:rootViewController:role:debugName:", v7, v10, CFSTR("SBTraitsParticipantRoleHomeScreenDimming"), CFSTR("HomeScreenDimming"));
  homeScreenDimmingWindow = self->_homeScreenDimmingWindow;
  self->_homeScreenDimmingWindow = v8;

  -[SBWindow setWindowLevel:](self->_homeScreenDimmingWindow, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -2.0 + 1.0);
  -[SBWindow bs_setHitTestingDisabled:](self->_homeScreenDimmingWindow, "bs_setHitTestingDisabled:", 1);

}

- (void)_setupHomeScreenContentBackdropView
{
  __objc2_class *v3;
  id v4;
  SBHomeScreenBackdropViewBase *v5;
  SBHomeScreenBackdropViewBase *homeScreenBackdropView;
  id v7;

  -[SBHomeScreenController homeScreenContentView](self, "homeScreenContentView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceTransparencyEnabled())
    v3 = SBHomeScreenBackdropDarkTintView;
  else
    v3 = SBHomeScreenBackdropView;
  v4 = [v3 alloc];
  objc_msgSend(v7, "bounds");
  v5 = (SBHomeScreenBackdropViewBase *)objc_msgSend(v4, "initWithFrame:");
  homeScreenBackdropView = self->_homeScreenBackdropView;
  self->_homeScreenBackdropView = v5;

  -[SBHomeScreenBackdropViewBase setAutoresizingMask:](self->_homeScreenBackdropView, "setAutoresizingMask:", 18);
  -[SBHomeScreenBackdropViewBase bs_setHitTestingDisabled:](self->_homeScreenBackdropView, "bs_setHitTestingDisabled:", 1);
  -[SBHomeScreenBackdropViewBase setDelegate:](self->_homeScreenBackdropView, "setDelegate:", self);
  objc_msgSend(v7, "addSubview:", self->_homeScreenBackdropView);

}

@end
