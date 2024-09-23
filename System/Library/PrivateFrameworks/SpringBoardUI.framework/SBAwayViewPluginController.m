@implementation SBAwayViewPluginController

- (SBAwayViewPluginController)init
{
  SBAwayViewPluginController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBAwayViewPluginController;
  result = -[SBAwayViewPluginController init](&v3, sel_init);
  if (result)
    result->_viewCanBeDisplayed = 1;
  return result;
}

- (void)_updateAppearanceAndNotify:(BOOL)a3
{
  SBLockScreenPluginMutableAppearanceContext *appearance;
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  SBLockScreenPluginMutableAppearanceContext *v15;
  void *v16;
  id WeakRetained;
  id v18;

  appearance = self->_appearance;
  if (!appearance)
    return;
  v4 = a3;
  -[SBLockScreenPluginAppearanceContext setHidden:](appearance, "setHidden:", -[SBAwayViewPluginController viewCanBeDisplayed](self, "viewCanBeDisplayed") ^ 1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[SBAwayViewPluginController showStatusBar](self, "showStatusBar"))
  {
    +[SBLockScreenElementOverride overrideForHiddenElement:](SBLockScreenElementOverride, "overrideForHiddenElement:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v6);

  }
  if (!-[SBAwayViewPluginController showDateView](self, "showDateView"))
  {
    +[SBLockScreenElementOverride overrideForHiddenElement:](SBLockScreenElementOverride, "overrideForHiddenElement:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v7);

  }
  if (-[SBAwayViewPluginController hasCustomSubtitle](self, "hasCustomSubtitle"))
  {
    +[SBLockScreenElementOverride overrideForElement:](SBLockScreenElementOverride, "overrideForElement:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAwayViewPluginController customSubtitleText](self, "customSubtitleText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

LABEL_11:
    objc_msgSend(v18, "addObject:", v8);

    v11 = v18;
    goto LABEL_12;
  }
  v10 = -[SBAwayViewPluginController showDate](self, "showDate");
  v11 = v18;
  if (!v10)
  {
    +[SBLockScreenElementOverride overrideForHiddenElement:](SBLockScreenElementOverride, "overrideForHiddenElement:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", &stru_24D4D22E0);
    goto LABEL_11;
  }
LABEL_12:
  -[SBLockScreenPluginAppearanceContext setElementOverrides:](self->_appearance, "setElementOverrides:", v11);
  if (-[SBAwayViewPluginController allowsSiri](self, "allowsSiri"))
    v12 = 0;
  else
    v12 = 2;
  if (!-[SBAwayViewPluginController allowsLockScreenCamera](self, "allowsLockScreenCamera"))
    v12 |= 4uLL;
  if (!-[SBAwayViewPluginController allowsUnlocking](self, "allowsUnlocking"))
    v12 |= 8uLL;
  if (!-[SBAwayViewPluginController allowsLogout](self, "allowsLogout"))
    v12 |= 0x10uLL;
  if (!-[SBAwayViewPluginController wantsMesaAutoUnlock](self, "wantsMesaAutoUnlock"))
    v12 |= 0x20uLL;
  if (!-[SBAwayViewPluginController allowsLockScreenMediaControls](self, "allowsLockScreenMediaControls"))
    v12 |= 0x40uLL;
  if (!-[SBAwayViewPluginController allowsControlCenter](self, "allowsControlCenter"))
    v12 |= 0x100uLL;
  if (-[SBAwayViewPluginController allowsScreenshots](self, "allowsScreenshots"))
    v13 = v12;
  else
    v13 = v12 | 0x200;
  -[SBLockScreenPluginAppearanceContext setRestrictedCapabilities:](self->_appearance, "setRestrictedCapabilities:", v13);
  v14 = -[SBAwayViewPluginController overlayStyle](self, "overlayStyle");
  if (v14 <= 3)
    -[SBLockScreenPluginAppearanceContext setBackgroundStyle:](self->_appearance, "setBackgroundStyle:", v14);
  -[SBLockScreenPluginAppearanceContext setPresentationStyle:](self->_appearance, "setPresentationStyle:", -[SBAwayViewPluginController presentationStyle](self, "presentationStyle"));
  -[SBLockScreenPluginAppearanceContext setNotificationBehavior:](self->_appearance, "setNotificationBehavior:", -[SBAwayViewPluginController notificationBehavior](self, "notificationBehavior"));
  v15 = self->_appearance;
  -[SBAwayViewPluginController _legibilitySettings](self, "_legibilitySettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenPluginAppearanceContext setLegibilitySettings:](v15, "setLegibilitySettings:", v16);

  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
    objc_msgSend(WeakRetained, "pluginController:updateAppearance:", self, self->_appearance);

  }
}

- (id)_legibilitySettings
{
  uint64_t v3;
  SBLockScreenLegibilitySettings *v4;
  SBLockScreenLegibilitySettings *v5;
  SBLockScreenLegibilitySettings *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SBAwayViewPluginController legibilitySettings](self, "legibilitySettings");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (SBLockScreenLegibilitySettings *)v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
    }
    else
    {
      v6 = [SBLockScreenLegibilitySettings alloc];
      v7 = -[SBLockScreenLegibilitySettings style](v4, "style");
      -[SBLockScreenLegibilitySettings primaryColor](v4, "primaryColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenLegibilitySettings secondaryColor](v4, "secondaryColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenLegibilitySettings shadowColor](v4, "shadowColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[SBLockScreenLegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:](v6, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v7, v8, v9, v10);

      -[SBLockScreenLegibilitySettings setVibrancyDisabled:](v5, "setVibrancyDisabled:", -[SBAwayViewPluginController legibilitySettingsOverridesVibrancy](self, "legibilitySettingsOverridesVibrancy"));
      if (-[SBAwayViewPluginController isContentViewWhiteUnderSlideToUnlockText](self, "isContentViewWhiteUnderSlideToUnlockText"))
      {
        objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBLockScreenLegibilitySettings setBackgroundColorHint:](v5, "setBackgroundColorHint:", v11);

      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (int64_t)pluginPriority
{
  return 0;
}

- (SBLockScreenPluginAppearance)pluginAppearance
{
  SBLockScreenPluginMutableAppearanceContext *appearance;
  SBLockScreenPluginMutableAppearanceContext *v4;
  SBLockScreenPluginMutableAppearanceContext *v5;

  appearance = self->_appearance;
  if (!appearance)
  {
    v4 = objc_alloc_init(SBLockScreenPluginMutableAppearanceContext);
    v5 = self->_appearance;
    self->_appearance = v4;

    -[SBAwayViewPluginController _updateAppearanceAndNotify:](self, "_updateAppearanceAndNotify:", 0);
    appearance = self->_appearance;
  }
  return (SBLockScreenPluginAppearance *)appearance;
}

- (void)pluginWillActivateWithContext:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAwayViewPluginController setActivationContext:](self, "setActivationContext:", v4);

}

- (void)pluginDidDeactivateWithContext:(id)a3
{
  void *v4;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAwayViewPluginController setDeactivationContext:](self, "setDeactivationContext:", v4);

  -[SBAwayViewPluginController purgeView](self, "purgeView");
  -[SBAwayViewPluginController setPluginAgent:](self, "setPluginAgent:", 0);
}

- (SBLockScreenPluginAction)pluginUnlockAction
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[SBAwayViewPluginController slideToUnlockText](self, "slideToUnlockText");
  v3 = objc_claimAutoreleasedReturnValue();
  -[SBAwayViewPluginController bundleIDForUnlock](self, "bundleIDForUnlock");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v3 | v4)
  {
    +[SBLockScreenPluginApplicationAction actionWithBundleID:](SBLockScreenPluginApplicationAction, "actionWithBundleID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLabel:", v3);
    objc_msgSend(v5, "setTransitionStyle:", -[SBAwayViewPluginController unlockAnimationStyleForDestinationApp:](self, "unlockAnimationStyleForDestinationApp:", v4));
  }
  else
  {
    v5 = 0;
  }

  return (SBLockScreenPluginAction *)v5;
}

- (BOOL)pluginHandleEvent:(int64_t)a3
{
  _BOOL4 v4;
  uint64_t v5;

  switch(a3)
  {
    case 1:
      v4 = -[SBAwayViewPluginController shouldDisableOnUnlock](self, "shouldDisableOnUnlock");
      if (v4)
        goto LABEL_6;
      break;
    case 2:
      v4 = -[SBAwayViewPluginController shouldDisableOnRelock](self, "shouldDisableOnRelock");
      if (v4)
      {
LABEL_6:
        -[SBAwayViewPluginController disable](self, "disable");
        LOBYTE(v4) = 1;
      }
      break;
    case 3:
      LOBYTE(v4) = -[SBAwayViewPluginController handleMenuButtonTap](self, "handleMenuButtonTap");
      break;
    case 4:
      LOBYTE(v4) = -[SBAwayViewPluginController handleLockButtonPressed](self, "handleLockButtonPressed");
      break;
    case 5:
      LOBYTE(v4) = -[SBAwayViewPluginController handleVolumeUpButtonPressed](self, "handleVolumeUpButtonPressed");
      break;
    case 6:
      LOBYTE(v4) = -[SBAwayViewPluginController handleVolumeDownButtonPressed](self, "handleVolumeDownButtonPressed");
      break;
    case 7:
      v5 = 0;
      goto LABEL_14;
    case 8:
      v5 = 1;
LABEL_14:
      LOBYTE(v4) = -[SBAwayViewPluginController handleHeadsetButtonPressed:](self, "handleHeadsetButtonPressed:", v5);
      break;
    default:
      LOBYTE(v4) = 0;
      break;
  }
  return v4;
}

- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[SBAwayViewPluginController enableTransitionBlock](self, "enableTransitionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)pluginAnimateAppearanceTransition:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void (**v7)(_QWORD);
  double (**v8)(_QWORD, _QWORD);
  _BOOL4 v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  void (**v21)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = v6;
  if (!v4)
  {
    v17 = 0;
    v9 = 1;
    if (!v6)
      goto LABEL_13;
    goto LABEL_11;
  }
  -[SBAwayViewPluginController enableTransitionBlock](self, "enableTransitionBlock");
  v8 = (double (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;
  if (v8)
  {
    v10 = (void *)MEMORY[0x24BE0BDC0];
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Plugin %@ did not call transition completion block"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sentinelWithExceptionReason:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __79__SBAwayViewPluginController_pluginAnimateAppearanceTransition_withCompletion___block_invoke;
    v19[3] = &unk_24D4D0800;
    v16 = v15;
    v20 = v16;
    v21 = v7;
    if (((double (**)(_QWORD, _QWORD *))v8)[2](v8, v19) <= 0.0)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE0BD98], "settingsWithDuration:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v17 = 0;
  }

  if (v7)
  {
LABEL_11:
    if (v9)
      v7[2](v7);
  }
LABEL_13:

  return v17;
}

uint64_t __79__SBAwayViewPluginController_pluginAnimateAppearanceTransition_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "signal");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)purgeView
{
  void *v3;
  void *v4;

  -[SBAwayViewPluginController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBAwayViewPluginController viewIfLoaded](self, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[SBAwayViewPluginController setView:](self, "setView:", 0);
  }
}

- (void)setViewCanBeDisplayed:(BOOL)a3
{
  if (self->_viewCanBeDisplayed != a3)
  {
    self->_viewCanBeDisplayed = a3;
    -[SBAwayViewPluginController _updateAppearanceAndNotify:](self, "_updateAppearanceAndNotify:", 1);
  }
}

- (int64_t)orientation
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarOrientation");

  return v3;
}

- (void)disable
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_agent);
  objc_msgSend(WeakRetained, "deactivatePluginController:", self);

}

- (id)enableTransitionBlock
{
  return 0;
}

- (int64_t)overlayStyle
{
  return 1;
}

- (int64_t)presentationStyle
{
  if (-[SBAwayViewPluginController viewWantsOverlayLayout](self, "viewWantsOverlayLayout"))
    return 1;
  else
    return 2;
}

- (int64_t)notificationBehavior
{
  if (-[SBAwayViewPluginController disablesAwayItemsCompletely](self, "disablesAwayItemsCompletely"))
    return 1;
  if (-[SBAwayViewPluginController shouldAutoHideNotifications](self, "shouldAutoHideNotifications"))
    return 2;
  return 0;
}

- (_UILegibilitySettings)legibilitySettings
{
  return (_UILegibilitySettings *)+[SBLockScreenLegibilitySettings defaultSettings](SBLockScreenLegibilitySettings, "defaultSettings");
}

- (BOOL)viewWantsOverlayLayout
{
  return 0;
}

- (BOOL)shouldDisableOnRelock
{
  return 0;
}

- (BOOL)shouldDisableOnUnlock
{
  return 0;
}

- (BOOL)shouldShowLockStatusBarTime
{
  return 0;
}

- (BOOL)shouldAutoHideNotifications
{
  return 0;
}

- (BOOL)allowsControlCenter
{
  return 1;
}

- (BOOL)allowsTimer
{
  return 1;
}

- (BOOL)allowsLockScreenHint
{
  return -[SBAwayViewPluginController presentationStyle](self, "presentationStyle") != 1;
}

- (BOOL)animateResumingToApplicationWithIdentifier:(id)a3
{
  return -[SBAwayViewPluginController unlockAnimationStyleForDestinationApp:](self, "unlockAnimationStyleForDestinationApp:", a3) != 2;
}

- (id)bundleIDForUnlock
{
  return 0;
}

- (unint64_t)unlockAnimationStyleForDestinationApp:(id)a3
{
  return 0;
}

- (BOOL)disablesAwayItemsCompletely
{
  return 0;
}

- (BOOL)showDateView
{
  return 0;
}

- (BOOL)showBatteryChargingText
{
  return 1;
}

- (BOOL)showDate
{
  return 1;
}

- (BOOL)hasCustomSubtitle
{
  return 0;
}

- (id)customSubtitleText
{
  return 0;
}

- (id)customSubtitleColor
{
  return 0;
}

- (BOOL)showStatusBar
{
  return 1;
}

- (id)customHeaderView
{
  return 0;
}

- (BOOL)allowsLockScreenCamera
{
  return 1;
}

- (BOOL)allowsLockScreenMediaControls
{
  return 1;
}

- (BOOL)allowsPhotoSlideshow
{
  return 1;
}

- (BOOL)allowsSiri
{
  return 1;
}

- (BOOL)allowsUnlocking
{
  return 1;
}

- (id)slideToUnlockText
{
  return 0;
}

- (BOOL)handleMenuButtonTap
{
  return 0;
}

- (BOOL)handleMenuButtonDoubleTap
{
  return 0;
}

- (BOOL)wantsMenuButtonHeldEvent
{
  return 0;
}

- (BOOL)handleMenuButtonHeld
{
  return 0;
}

- (BOOL)handleLockButtonPressed
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPressed
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPressed
{
  return 0;
}

- (BOOL)handleHeadsetButtonPressed:(BOOL)a3
{
  return 0;
}

- (BOOL)wantsMesaAutoUnlock
{
  return 1;
}

- (BOOL)allowsScreenshots
{
  return 1;
}

- (BOOL)allowsLogout
{
  return 1;
}

- (BOOL)legibilitySettingsOverridesVibrancy
{
  return 0;
}

- (BOOL)isContentViewWhiteUnderSlideToUnlockText
{
  return 0;
}

- (void)setNeedsLegibilityAppearanceUpdate
{
  -[SBAwayViewPluginController _updateAppearanceAndNotify:](self, "_updateAppearanceAndNotify:", 1);
}

+ (void)enableBundleNamed:(id)a3 activationContext:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BEB0A88];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "enableLockScreenBundle:withContext:", v7, v6);

}

+ (void)enableBundleNamed:(id)a3
{
  objc_msgSend(a1, "enableBundleNamed:activationContext:", a3, 0);
}

+ (void)disableBundleNamed:(id)a3 deactivationContext:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x24BEB0A88];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "disableLockScreenBundle:withContext:", v7, v6);

}

+ (void)disableBundleNamed:(id)a3
{
  objc_msgSend(a1, "disableBundleNamed:deactivationContext:", a3, 0);
}

- (SBLockScreenPluginAgent)pluginAgent
{
  return (SBLockScreenPluginAgent *)objc_loadWeakRetained((id *)&self->_agent);
}

- (void)setPluginAgent:(id)a3
{
  objc_storeWeak((id *)&self->_agent, a3);
}

- (BOOL)viewCanBeDisplayed
{
  return self->_viewCanBeDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_destroyWeak((id *)&self->_agent);
}

@end
