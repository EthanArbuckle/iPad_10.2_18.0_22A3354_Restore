@implementation SBUIMainScreenAnimationController

- (SBUIMainScreenAnimationController)initWithTransitionContextProvider:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIMainScreenAnimationController;
  return -[SBUIWorkspaceAnimationController initWithWorkspaceTransitionRequest:](&v4, sel_initWithWorkspaceTransitionRequest_, a3);
}

- (SBDeviceApplicationSceneEntity)toApplicationSceneEntity
{
  void *v3;
  void *v4;

  -[SBUIAnimationController toApplicationSceneEntities](self, "toApplicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIMainScreenAnimationController _primaryAppOrAnyAppFromSet:](self, "_primaryAppOrAnyAppFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBDeviceApplicationSceneEntity *)v4;
}

- (SBDeviceApplicationSceneEntity)fromApplicationSceneEntity
{
  void *v3;
  void *v4;

  -[SBUIAnimationController fromApplicationSceneEntities](self, "fromApplicationSceneEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIMainScreenAnimationController _primaryAppOrAnyAppFromSet:](self, "_primaryAppOrAnyAppFromSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBDeviceApplicationSceneEntity *)v4;
}

- (id)_getTransitionWindow
{
  void *v2;
  void *v3;

  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_primaryAppOrAnyAppFromSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectsPassingTest:", &__block_literal_global_359);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v3, "anyObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

BOOL __64__SBUIMainScreenAnimationController__primaryAppOrAnyAppFromSet___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutRole") == 1;
}

- (BOOL)__wantsInitialProgressStateChange
{
  return 1;
}

- (void)__startAnimation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIMainScreenAnimationController;
  -[SBUIAnimationController __startAnimation](&v3, sel___startAnimation);
  if (-[SBUIMainScreenAnimationController _shouldDismissBanner](self, "_shouldDismissBanner"))
    -[SBUIMainScreenAnimationController _dismissBannerAnimated:](self, "_dismissBannerAnimated:", 1);
  objc_msgSend(MEMORY[0x1E0CEABB0], "_beginSuspendingMotionEffectsForReason:", CFSTR("Main screen transaction animation"));
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", &__block_literal_global_14_4, 0.25);
}

uint64_t __53__SBUIMainScreenAnimationController___startAnimation__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_recenterMotionEffects");
}

- (BOOL)_shouldDismissBanner
{
  return 1;
}

- (void)_dismissBannerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend((id)SBApp, "bannerManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "embeddedDisplayWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAllBannersInWindowScene:animated:reason:", v5, v3, CFSTR("mainScreenAnimationController"));

}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[SBUIAnimationController _animationIdentifier](self, "_animationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "bannerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acquireBannerSuppressionAssertionForReason:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIMainScreenAnimationController setBannerSuppressionAssertion:](self, "setBannerSuppressionAssertion:", v5);

  if (-[SBUIAnimationController _willAnimate](self, "_willAnimate"))
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requireWallpaperWithReason:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIMainScreenAnimationController setWallpaperRequiredAssertion:](self, "setWallpaperRequiredAssertion:", v7);

  }
  v8.receiver = self;
  v8.super_class = (Class)SBUIMainScreenAnimationController;
  -[SBUIAnimationController _begin](&v8, sel__begin);

}

- (void)_cleanupAnimation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CEABB0], "_endSuspendingMotionEffectsForReason:", CFSTR("Main screen transaction animation"));
  -[SBUIMainScreenAnimationController bannerSuppressionAssertion](self, "bannerSuppressionAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SBUIMainScreenAnimationController setBannerSuppressionAssertion:](self, "setBannerSuppressionAssertion:", 0);
  -[SBUIMainScreenAnimationController wallpaperRequiredAssertion](self, "wallpaperRequiredAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SBUIMainScreenAnimationController setWallpaperRequiredAssertion:](self, "setWallpaperRequiredAssertion:", 0);
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearHighlightedIcon");

}

- (BSInvalidatable)wallpaperRequiredAssertion
{
  return self->_wallpaperRequiredAssertion;
}

- (void)setWallpaperRequiredAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperRequiredAssertion, a3);
}

- (BSInvalidatable)bannerSuppressionAssertion
{
  return self->_bannerSuppressionAssertion;
}

- (void)setBannerSuppressionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_wallpaperRequiredAssertion, 0);
}

@end
