@implementation _UIScreenEdgePanRecognizerSettings

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
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Edge Swipe"), CFSTR("edgeSettings"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Corner Swipe"), CFSTR("cornerSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Press-and-Hold"), CFSTR("dwellSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83078];
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moduleWithTitle:contents:", CFSTR("Edge Swipe"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)multitaskingGestureMode
{
  return self->_multitaskingGestureMode;
}

- (void)setMultitaskingGestureMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)navigationGestureMode
{
  return self->_navigationGestureMode;
}

- (void)setNavigationGestureMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_UIScreenEdgePanRecognizerEdgeSettings)edgeSettings
{
  return self->_edgeSettings;
}

- (void)setEdgeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_edgeSettings, a3);
}

- (_UIScreenEdgePanRecognizerDwellSettings)dwellSettings
{
  return self->_dwellSettings;
}

- (void)setDwellSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dwellSettings, a3);
}

- (_UIScreenEdgePanRecognizerCornerSettings)cornerSettings
{
  return self->_cornerSettings;
}

- (void)setCornerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cornerSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerSettings, 0);
  objc_storeStrong((id *)&self->_dwellSettings, 0);
  objc_storeStrong((id *)&self->_edgeSettings, 0);
  objc_storeStrong((id *)&self->_navigationGestureMode, 0);
  objc_storeStrong((id *)&self->_multitaskingGestureMode, 0);
}

@end
