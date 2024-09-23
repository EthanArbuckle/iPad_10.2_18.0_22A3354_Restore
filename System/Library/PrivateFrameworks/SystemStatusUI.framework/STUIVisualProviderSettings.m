@implementation STUIVisualProviderSettings

- (BOOL)redInSpringBoard
{
  return self->_redInSpringBoard;
}

- (BOOL)showVPNDisconnect
{
  return self->_showVPNDisconnect;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIVisualProviderSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[STUIVisualProviderSettings setRedInSpringBoard:](self, "setRedInSpringBoard:", 0);
  -[STUIVisualProviderSettings setPromoteThermalWarning:](self, "setPromoteThermalWarning:", 0);
  -[STUIVisualProviderSettings setEnableActivity:](self, "setEnableActivity:", 0);
  -[STUIVisualProviderSettings setBackgroundActivityCoalescingDelay:](self, "setBackgroundActivityCoalescingDelay:", 0.0);
  -[STUIVisualProviderSettings setShowVPNDisconnect:](self, "setShowVPNDisconnect:", 0);
  -[STUIVisualProviderSettings setLegacyPhoneUsesiPadLayout:](self, "setLegacyPhoneUsesiPadLayout:", 0);
  -[STUIVisualProviderSettings setFullWidthBackgroundActivity:](self, "setFullWidthBackgroundActivity:", 1);
  -[STUIVisualProviderSettings setShowsDateBeforeTime:](self, "setShowsDateBeforeTime:", 0);
  -[STUIVisualProviderSettings setHasBoldTime:](self, "setHasBoldTime:", 0);
  -[STUIVisualProviderSettings setVisualProviderClassName:](self, "setVisualProviderClassName:", &stru_1E8D64C18);
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[4];
  _QWORD v40[2];
  _QWORD v41[7];

  v41[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v25 = (id)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Red In SpringBoard"), CFSTR("redInSpringBoard"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v35;
  objc_msgSend(MEMORY[0x1E0D83068], "rowWithTitle:valueKeyPath:", CFSTR("Visual Provider Class"), CFSTR("visualProviderClassName"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v33, CFSTR("All"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v32;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Promote Thermal Warning"), CFSTR("promoteThermalWarning"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v31;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Activity"), CFSTR("enableActivity"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v30;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("BG Activity Coalescing Delay"), CFSTR("backgroundActivityCoalescingDelay"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "precision:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v27;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("VPN Disconnect"), CFSTR("showVPNDisconnect"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v23, CFSTR("Split Phone"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v22;
  v4 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use iPad Layout"), CFSTR("legacyPhoneUsesiPadLayout"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v21;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Full-Width Background Activity"), CFSTR("fullWidthBackgroundActivity"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v19, CFSTR("Legacy Phone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v5;
  v6 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Date Before Time"), CFSTR("showsDateBeforeTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v7;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Bold Time"), CFSTR("hasBoldTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v9, CFSTR("iPad"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v10;
  v11 = (void *)MEMORY[0x1E0D83078];
  v12 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:action:", CFSTR("Restore Defaults"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "moduleWithTitle:contents:", 0, v17);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (void)setRedInSpringBoard:(BOOL)a3
{
  self->_redInSpringBoard = a3;
}

- (NSString)visualProviderClassName
{
  return self->_visualProviderClassName;
}

- (void)setVisualProviderClassName:(id)a3
{
  objc_storeStrong((id *)&self->_visualProviderClassName, a3);
}

- (BOOL)promoteThermalWarning
{
  return self->_promoteThermalWarning;
}

- (void)setPromoteThermalWarning:(BOOL)a3
{
  self->_promoteThermalWarning = a3;
}

- (BOOL)enableActivity
{
  return self->_enableActivity;
}

- (void)setEnableActivity:(BOOL)a3
{
  self->_enableActivity = a3;
}

- (double)backgroundActivityCoalescingDelay
{
  return self->_backgroundActivityCoalescingDelay;
}

- (void)setBackgroundActivityCoalescingDelay:(double)a3
{
  self->_backgroundActivityCoalescingDelay = a3;
}

- (void)setShowVPNDisconnect:(BOOL)a3
{
  self->_showVPNDisconnect = a3;
}

- (BOOL)legacyPhoneUsesiPadLayout
{
  return self->_legacyPhoneUsesiPadLayout;
}

- (void)setLegacyPhoneUsesiPadLayout:(BOOL)a3
{
  self->_legacyPhoneUsesiPadLayout = a3;
}

- (BOOL)fullWidthBackgroundActivity
{
  return self->_fullWidthBackgroundActivity;
}

- (void)setFullWidthBackgroundActivity:(BOOL)a3
{
  self->_fullWidthBackgroundActivity = a3;
}

- (BOOL)showsDateBeforeTime
{
  return self->_showsDateBeforeTime;
}

- (void)setShowsDateBeforeTime:(BOOL)a3
{
  self->_showsDateBeforeTime = a3;
}

- (BOOL)hasBoldTime
{
  return self->_hasBoldTime;
}

- (void)setHasBoldTime:(BOOL)a3
{
  self->_hasBoldTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualProviderClassName, 0);
}

@end
