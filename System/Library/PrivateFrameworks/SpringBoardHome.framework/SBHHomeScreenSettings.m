@implementation SBHHomeScreenSettings

- (SBHIconSettings)iconSettings
{
  return self->_iconSettings;
}

- (SBHFolderSettings)folderSettings
{
  return self->_folderSettings;
}

- (SBHIconEditingSettings)iconEditingSettings
{
  return self->_iconEditingSettings;
}

+ (id)homeScreenDefaults
{
  if (homeScreenDefaults_onceToken_0 != -1)
    dispatch_once(&homeScreenDefaults_onceToken_0, &__block_literal_global_25);
  return (id)homeScreenDefaults_homeScreenDefaults_0;
}

void __43__SBHHomeScreenSettings_homeScreenDefaults__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DA9F98]);
  v1 = (void *)homeScreenDefaults_homeScreenDefaults_0;
  homeScreenDefaults_homeScreenDefaults_0 = (uint64_t)v0;

}

- (void)setDefaultValues
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBHHomeScreenSettings;
  -[PTSettings setDefaultValues](&v17, sel_setDefaultValues);
  -[SBHHomeScreenSettings setUsesMinimumViableHomeScreen:](self, "setUsesMinimumViableHomeScreen:", 0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  -[SBHHomeScreenSettings setShowPopOvers:](self, "setShowPopOvers:", (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  -[SBHHomeScreenSettings homeScreenPullToSearchSettings](self, "homeScreenPullToSearchSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultValues");

  -[SBHHomeScreenSettings todayViewPullToSearchSettings](self, "todayViewPullToSearchSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");
  objc_msgSend(v6, "setPullTransitionDistance:", 75.0);
  objc_msgSend(v6, "setPullTransitionActivationThreshold:", 37.5);
  objc_msgSend(v6, "setPullTransitionRubberbandThreshold:", 75.0);
  objc_msgSend(v6, "setPullGestureBeganFromTopLeeway:", 75.0);
  objc_msgSend(v6, "setAllowsKeyboardWhileInteractive:", 0);
  -[SBHHomeScreenSettings coversheetPullToSearchSettings](self, "coversheetPullToSearchSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValues");
  objc_msgSend(v7, "setPullTransitionDistance:", 75.0);
  objc_msgSend(v7, "setPullTransitionActivationThreshold:", 37.5);
  objc_msgSend(v7, "setPullTransitionRubberbandThreshold:", 75.0);
  objc_msgSend(v7, "setPullGestureBeganFromTopLeeway:", 75.0);
  if ((SBHSearchAffordancePresentationAnimationEnabled(objc_msgSend(v7, "setAllowsKeyboardWhileInteractive:", 0)) & 1) == 0)
  {
    -[SBHHomeScreenSettings todayViewPullToSearchSettings](self, "todayViewPullToSearchSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pullTransitionAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setDampingRatio:", 1.0);
    objc_msgSend(v9, "setResponse:", 0.54);
    -[SBHHomeScreenSettings homeScreenPullToSearchSettings](self, "homeScreenPullToSearchSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSearchContentFadeInStartThreshold:", 0.25);

    -[SBHHomeScreenSettings todayViewPullToSearchSettings](self, "todayViewPullToSearchSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSearchContentFadeInStartThreshold:", 0.3);

    -[SBHHomeScreenSettings coversheetPullToSearchSettings](self, "coversheetPullToSearchSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSearchContentFadeInStartThreshold:", 0.3);

  }
  -[SBHHomeScreenSettings libraryPullToSearchSettings](self, "libraryPullToSearchSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDefaultValues");
  objc_msgSend(v13, "setPullTransitionDistance:", 100.0);
  objc_msgSend(v13, "setPullTransitionActivationThreshold:", 0.5);
  objc_msgSend(v13, "setPullGestureBeganFromTopLeeway:", 100.0);
  objc_msgSend(v13, "pullTransitionAnimationSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDampingRatio:", 1.0);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  objc_msgSend(v14, "setResponse:", dbl_1D0190F20[(v16 & 0xFFFFFFFFFFFFFFFBLL) == 1]);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  void *v34;
  void *v35;
  _QWORD v36[12];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Minimum Viable Home Screen"), CFSTR("usesMinimumViableHomeScreen"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Popovers in Quick Actions"), CFSTR("showPopOvers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v28, CFSTR("Features"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Icons"), CFSTR("iconSettings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v31;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Folders"), CFSTR("folderSettings"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v30;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Root Folder"), CFSTR("rootFolderSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v29;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Icon Editing"), CFSTR("iconEditingSettings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v27;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Icon Resizing"), CFSTR("iconResizingSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v4;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Widgets"), CFSTR("widgetSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v5;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Widget Introduction"), CFSTR("widgetIntroductionSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v6;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("App Library"), CFSTR("appLibrarySettings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v7;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Home Screen Pull-to-Search"), CFSTR("homeScreenPullToSearchSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v8;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Today View Pull-to-Search"), CFSTR("todayViewPullToSearchSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v9;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Coversheet Pull-to-Search"), CFSTR("coversheetPullToSearchSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v10;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("App Library Pull-to-Search"), CFSTR("libraryPullToSearchSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 12);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Icon Animations"), CFSTR("iconAnimationSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:action:", CFSTR("Restore Defaults"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0D83078];
  v33[0] = v32;
  v33[1] = v13;
  v33[2] = v17;
  v33[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moduleWithTitle:contents:", 0, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (BOOL)usesMinimumViableHomeScreen
{
  return self->_usesMinimumViableHomeScreen;
}

- (void)setUsesMinimumViableHomeScreen:(BOOL)a3
{
  self->_usesMinimumViableHomeScreen = a3;
}

- (BOOL)showPopOvers
{
  return self->_showPopOvers;
}

- (void)setShowPopOvers:(BOOL)a3
{
  self->_showPopOvers = a3;
}

- (SBHIconAnimationRootSettings)iconAnimationSettings
{
  return self->_iconAnimationSettings;
}

- (void)setIconAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_iconAnimationSettings, a3);
}

- (void)setIconSettings:(id)a3
{
  objc_storeStrong((id *)&self->_iconSettings, a3);
}

- (void)setFolderSettings:(id)a3
{
  objc_storeStrong((id *)&self->_folderSettings, a3);
}

- (SBHRootFolderSettings)rootFolderSettings
{
  return self->_rootFolderSettings;
}

- (void)setRootFolderSettings:(id)a3
{
  objc_storeStrong((id *)&self->_rootFolderSettings, a3);
}

- (void)setIconEditingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_iconEditingSettings, a3);
}

- (SBHIconResizingSettings)iconResizingSettings
{
  return self->_iconResizingSettings;
}

- (void)setIconResizingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_iconResizingSettings, a3);
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (void)setWidgetSettings:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSettings, a3);
}

- (SBHAppLibrarySettings)appLibrarySettings
{
  return self->_appLibrarySettings;
}

- (void)setAppLibrarySettings:(id)a3
{
  objc_storeStrong((id *)&self->_appLibrarySettings, a3);
}

- (SBHHomePullToSearchSettings)homeScreenPullToSearchSettings
{
  return self->_homeScreenPullToSearchSettings;
}

- (void)setHomeScreenPullToSearchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenPullToSearchSettings, a3);
}

- (SBHHomePullToSearchSettings)todayViewPullToSearchSettings
{
  return self->_todayViewPullToSearchSettings;
}

- (void)setTodayViewPullToSearchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_todayViewPullToSearchSettings, a3);
}

- (SBHHomePullToSearchSettings)coversheetPullToSearchSettings
{
  return self->_coversheetPullToSearchSettings;
}

- (void)setCoversheetPullToSearchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_coversheetPullToSearchSettings, a3);
}

- (SBHHomePullToSearchSettings)libraryPullToSearchSettings
{
  return self->_libraryPullToSearchSettings;
}

- (void)setLibraryPullToSearchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_libraryPullToSearchSettings, a3);
}

- (SBHWidgetIntroductionSettings)widgetIntroductionSettings
{
  return self->_widgetIntroductionSettings;
}

- (void)setWidgetIntroductionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIntroductionSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIntroductionSettings, 0);
  objc_storeStrong((id *)&self->_libraryPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_coversheetPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_todayViewPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_homeScreenPullToSearchSettings, 0);
  objc_storeStrong((id *)&self->_appLibrarySettings, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_storeStrong((id *)&self->_iconResizingSettings, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_rootFolderSettings, 0);
  objc_storeStrong((id *)&self->_folderSettings, 0);
  objc_storeStrong((id *)&self->_iconSettings, 0);
  objc_storeStrong((id *)&self->_iconAnimationSettings, 0);
}

@end
