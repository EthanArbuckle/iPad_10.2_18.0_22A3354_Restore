@implementation SBLiveActivitySettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLiveActivitySettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_allowAlertsOnHostApp = 0;
  self->_hideActivitiesInLockScreen = 0;
  self->_hideActivitiesInAmbient = 0;
  self->_hideActivitiesInDynamicIsland = 0;
  self->_disableActivityAlertsAsBanners = 0;
  -[SBAmbientLiveActivitiesSettings setDefaultValues](self->_ambientSettings, "setDefaultValues");
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
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow alerts on host application"), CFSTR("allowAlertsOnHostApp"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Hide in Lock Screen"), CFSTR("hideActivitiesInLockScreen"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Hide in Dynamic Island"), CFSTR("hideActivitiesInDynamicIsland"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Hide in Ambient"), CFSTR("hideActivitiesInAmbient"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Disable alerts as banners"), CFSTR("disableActivityAlertsAsBanners"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Domino Animation Settings"), CFSTR("ambientSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83070];
  v23[0] = v20;
  v23[1] = v19;
  v23[2] = v18;
  v23[3] = v2;
  v23[4] = v3;
  v23[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v6, CFSTR("Activity Presentation Settings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83070];
  v22 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  v21[0] = v7;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Live Activities"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)allowAlertsOnHostApp
{
  return self->_allowAlertsOnHostApp;
}

- (void)setAllowAlertsOnHostApp:(BOOL)a3
{
  self->_allowAlertsOnHostApp = a3;
}

- (BOOL)hideActivitiesInLockScreen
{
  return self->_hideActivitiesInLockScreen;
}

- (void)setHideActivitiesInLockScreen:(BOOL)a3
{
  self->_hideActivitiesInLockScreen = a3;
}

- (BOOL)hideActivitiesInDynamicIsland
{
  return self->_hideActivitiesInDynamicIsland;
}

- (void)setHideActivitiesInDynamicIsland:(BOOL)a3
{
  self->_hideActivitiesInDynamicIsland = a3;
}

- (BOOL)hideActivitiesInAmbient
{
  return self->_hideActivitiesInAmbient;
}

- (void)setHideActivitiesInAmbient:(BOOL)a3
{
  self->_hideActivitiesInAmbient = a3;
}

- (BOOL)disableActivityAlertsAsBanners
{
  return self->_disableActivityAlertsAsBanners;
}

- (void)setDisableActivityAlertsAsBanners:(BOOL)a3
{
  self->_disableActivityAlertsAsBanners = a3;
}

- (SBAmbientLiveActivitiesSettings)ambientSettings
{
  return self->_ambientSettings;
}

- (void)setAmbientSettings:(id)a3
{
  objc_storeStrong((id *)&self->_ambientSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientSettings, 0);
}

@end
