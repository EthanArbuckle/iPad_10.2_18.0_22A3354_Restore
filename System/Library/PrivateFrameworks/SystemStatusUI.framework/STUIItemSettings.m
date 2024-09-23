@implementation STUIItemSettings

- (BOOL)showRingerOnAODLockScreen
{
  return self->_batteryPercentageAlwaysEnabled;
}

- (BOOL)showRingerOffLockScreen
{
  return self->_batteryCondensedPercentageForceEnabled;
}

- (BOOL)batteryPercentageAlwaysEnabled
{
  return *(&self->super.__isObservingChildren + 1);
}

- (BOOL)showRingerWhenSilenced
{
  return *(&self->super.__isObservingChildren + 5);
}

- (BOOL)batteryCondensedPercentageForceEnabled
{
  return *(&self->super.__isObservingChildren + 2);
}

- (BOOL)secondarySIMUnderBaseline
{
  return *(&self->super.__isObservingChildren + 4);
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIItemSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[STUIItemSettings setBatteryPercentageAlwaysEnabled:](self, "setBatteryPercentageAlwaysEnabled:", 0);
  -[STUIItemSettings setBatteryCondensedPercentageForceEnabled:](self, "setBatteryCondensedPercentageForceEnabled:", 0);
  -[STUIItemSettings setShowBothDualCarrierNames:](self, "setShowBothDualCarrierNames:", 0);
  -[STUIItemSettings setSecondarySIMUnderBaseline:](self, "setSecondarySIMUnderBaseline:", 0);
  -[STUIItemSettings setShowRingerWhenSilenced:](self, "setShowRingerWhenSilenced:", 1);
  -[STUIItemSettings setShowRingerOnAODLockScreen:](self, "setShowRingerOnAODLockScreen:", 0);
  -[STUIItemSettings setShowRingerOffLockScreen:](self, "setShowRingerOffLockScreen:", 1);
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v19 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Percentage"), CFSTR("batteryPercentageAlwaysEnabled"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v27;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Condensed Percentage"), CFSTR("batteryCondensedPercentageForceEnabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v25, CFSTR("Battery"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v24;
  v3 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Both Carrier Names"), CFSTR("showBothDualCarrierNames"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Second SIM Under Baseline"), CFSTR("secondarySIMUnderBaseline"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v21, CFSTR("Cellular"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v20;
  v4 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Ringer When Silenced"), CFSTR("showRingerWhenSilenced"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Ringer On AOD"), CFSTR("showRingerOnAODLockScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v5;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Ringer Everywhere"), CFSTR("showRingerOffLockScreen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v7, CFSTR("Ringer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v8;
  v9 = (void *)MEMORY[0x1E0D83078];
  v10 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Restore Defaults"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moduleWithTitle:contents:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setBatteryPercentageAlwaysEnabled:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (void)setBatteryCondensedPercentageForceEnabled:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)showBothDualCarrierNames
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setShowBothDualCarrierNames:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (void)setSecondarySIMUnderBaseline:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

- (void)setShowRingerWhenSilenced:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 5) = a3;
}

- (void)setShowRingerOnAODLockScreen:(BOOL)a3
{
  self->_batteryPercentageAlwaysEnabled = a3;
}

- (void)setShowRingerOffLockScreen:(BOOL)a3
{
  self->_batteryCondensedPercentageForceEnabled = a3;
}

@end
