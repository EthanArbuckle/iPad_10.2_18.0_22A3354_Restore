@implementation SBLowEndHardwareSwitcherModifier

- (id)keyboardSuppressionMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  -[SBLowEndHardwareSwitcherModifier keyboardSuppressionMode](&v9, sel_keyboardSuppressionMode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "suppressesAllScenes") & 1) != 0
    || !-[SBLowEndHardwareSwitcherModifier _shouldResignActiveAppsUnderFloatingApp](self, "_shouldResignActiveAppsUnderFloatingApp"))
  {
    v7 = v3;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[SBLowEndHardwareSwitcherModifier appLayouts](self, "appLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:](SBSwitcherKeyboardSuppressionMode, "newSuppressionModeForSwitcherScenesFromAppLayouts:", v6);

  }
  return v7;
}

- (id)appLayoutsToResignActive
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  -[SBLowEndHardwareSwitcherModifier appLayoutsToResignActive](&v10, sel_appLayoutsToResignActive);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBLowEndHardwareSwitcherModifier _shouldResignActiveAppsUnderFloatingApp](self, "_shouldResignActiveAppsUnderFloatingApp"))
  {
    v11 = &unk_1E91D2240;
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[SBLowEndHardwareSwitcherModifier appLayouts](self, "appLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bs_dictionaryByAddingEntriesFromDictionary:", v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  return v3;
}

- (BOOL)_shouldResignActiveAppsUnderFloatingApp
{
  if (self->_floatingAppVisibleOverExclusiveForegroundApp)
    return 1;
  if (self->_floatingAppVisibleOverSplitView)
    return (self->_options & 4) != 0;
  return 0;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  objc_msgSend(v4, "toFloatingAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "toFloatingSwitcherVisible");
  v7 = objc_msgSend(v4, "toEnvironmentMode");
  objc_msgSend(v4, "toAppLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    v10 = 1;
  else
    v10 = v6;
  if (v7 == 3 && (v10 & 1) != 0)
  {
    objc_msgSend(v8, "allItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_floatingAppVisibleOverSplitView = (unint64_t)objc_msgSend(v11, "count") > 1;

    v12 = objc_msgSend(v4, "toAppLayoutWantsExclusiveForeground");
  }
  else
  {
    v12 = 0;
    self->_floatingAppVisibleOverSplitView = 0;
  }
  self->_floatingAppVisibleOverExclusiveForegroundApp = v12;
  v15.receiver = self;
  v15.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v15, sel_handleTransitionEvent_, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)wallpaperScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBLowEndHardwareSwitcherModifier _shouldSimplifyForOpenFolder](self, "_shouldSimplifyForOpenFolder")
    || -[SBLowEndHardwareSwitcherModifier _shouldSimplifyForWidgetCenterAndLibrary](self, "_shouldSimplifyForWidgetCenterAndLibrary"))
  {
    -[SBLowEndHardwareSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wallpaperScaleForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLowEndHardwareSwitcherModifier;
    -[SBLowEndHardwareSwitcherModifier wallpaperScale](&v8, sel_wallpaperScale);
  }
  return result;
}

- (double)homeScreenAlpha
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBLowEndHardwareSwitcherModifier _shouldSimplifyForOpenFolder](self, "_shouldSimplifyForOpenFolder")
    || -[SBLowEndHardwareSwitcherModifier _shouldSimplifyForWidgetCenterAndLibrary](self, "_shouldSimplifyForWidgetCenterAndLibrary"))
  {
    -[SBLowEndHardwareSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenAlphaForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLowEndHardwareSwitcherModifier;
    -[SBLowEndHardwareSwitcherModifier homeScreenAlpha](&v8, sel_homeScreenAlpha);
  }
  return result;
}

- (double)homeScreenScale
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double result;
  objc_super v8;

  if (-[SBLowEndHardwareSwitcherModifier _shouldSimplifyForOpenFolder](self, "_shouldSimplifyForOpenFolder")
    || -[SBLowEndHardwareSwitcherModifier _shouldSimplifyForWidgetCenterAndLibrary](self, "_shouldSimplifyForWidgetCenterAndLibrary"))
  {
    -[SBLowEndHardwareSwitcherModifier switcherSettings](self, "switcherSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animationSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeScreenScaleForMode:", 1);
    v6 = v5;

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBLowEndHardwareSwitcherModifier;
    -[SBLowEndHardwareSwitcherModifier homeScreenScale](&v8, sel_homeScreenScale);
  }
  return result;
}

- (BOOL)_shouldSimplifyForWidgetCenterAndLibrary
{
  if ((self->_options & 1) != 0)
    return -[SBLowEndHardwareSwitcherModifier homeScreenHasWidgetCenterOrLibraryOpen](self, "homeScreenHasWidgetCenterOrLibraryOpen");
  else
    return 0;
}

- (BOOL)_shouldSimplifyForOpenFolder
{
  if ((self->_options & 2) != 0)
    return -[SBLowEndHardwareSwitcherModifier homeScreenHasOpenFolder](self, "homeScreenHasOpenFolder");
  else
    return 0;
}

- (SBLowEndHardwareSwitcherModifier)initWithSimplificationOptions:(unint64_t)a3
{
  SBLowEndHardwareSwitcherModifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLowEndHardwareSwitcherModifier;
  result = -[SBSwitcherModifier init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

@end
