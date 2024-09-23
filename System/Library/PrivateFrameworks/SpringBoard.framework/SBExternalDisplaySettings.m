@implementation SBExternalDisplaySettings

- (int64_t)activeDisplayTrackingMethodology
{
  return self->_activeDisplayTrackingMethodology;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBExternalDisplaySettings;
  -[PTSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[SBExternalDisplayRuntimeAvailabilitySettings setDefaultValues](self->_availabilitySettings, "setDefaultValues");
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalDisplayDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBExternalDisplaySettings setFakeStorageForWirelessDisplaySupport:](self, "setFakeStorageForWirelessDisplaySupport:", objc_msgSend(v4, "allowWirelessDisplaysForExtendedDisplayMode"));
  objc_msgSend(v4, "contentsScale");
  -[SBExternalDisplaySettings setFakeStorageForContentsScale:](self, "setFakeStorageForContentsScale:");
  -[SBExternalDisplaySettings setActiveDisplayTrackingMethodology:](self, "setActiveDisplayTrackingMethodology:", 1);
  -[SBExternalDisplaySettings setFakeStorageForUnderpoweredDeviceSupport:](self, "setFakeStorageForUnderpoweredDeviceSupport:", objc_msgSend(v4, "chamois"));

}

+ (id)settingsControllerModule
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[4];
  void *v53;
  _QWORD v54[6];

  v54[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83020], "rowWithTitle:valueKeyPath:", CFSTR("Active Display Tracking"), CFSTR("activeDisplayTrackingMethodology"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E91CE380, &unk_1E91CE398);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0D83070], "sectionWithRows:title:", v39, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBExternalDisplayRuntimeAvailabilitySettings _moduleWithSectionTitle:](SBExternalDisplayRuntimeAvailabilitySettings, "_moduleWithSectionTitle:", CFSTR("Runtime Requirements (Deprecated)"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83070], "submoduleWithModule:childSettingsKeyPath:condition:", v38, CFSTR("availabilitySettings"), v2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalDisplayDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Enable Testing for rdar://97748869"), CFSTR("fakeStorageForChamois97748869Enabling"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "condition:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke;
  v50[3] = &unk_1E8EA3E10;
  v10 = v6;
  v51 = v10;
  objc_msgSend(v8, "setValueValidatator:", v50);
  v48[0] = v9;
  v48[1] = 3221225472;
  v48[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_2;
  v48[3] = &unk_1E8EA3E10;
  v11 = v10;
  v49 = v11;
  objc_msgSend(v8, "setValueFormatter:", v48);
  objc_msgSend(MEMORY[0x1E0D83100], "rowWithTitle:valueKeyPath:", CFSTR("Allow Wireless Displays"), CFSTR("fakeStorageForWirelessDisplaySupport"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "condition:", v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v46[0] = v9;
  v46[1] = 3221225472;
  v46[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_3;
  v46[3] = &unk_1E8EA3E10;
  v14 = v11;
  v47 = v14;
  objc_msgSend(v13, "setValueValidatator:", v46);
  v44[0] = v9;
  v44[1] = 3221225472;
  v44[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_4;
  v44[3] = &unk_1E8EA3E10;
  v15 = v14;
  v45 = v15;
  v34 = v13;
  objc_msgSend(v13, "setValueFormatter:", v44);
  objc_msgSend(MEMORY[0x1E0D83050], "rowWithTitle:valueKeyPath:", CFSTR("Override Display Scale"), CFSTR("fakeStorageForContentsScale"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "condition:", v2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = v9;
  v42[1] = 3221225472;
  v42[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_5;
  v42[3] = &unk_1E8EA3E10;
  v18 = v15;
  v43 = v18;
  objc_msgSend(v17, "setValueValidatator:", v42);
  v40[0] = v9;
  v40[1] = 3221225472;
  v40[2] = __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_6;
  v40[3] = &unk_1E8EA3E10;
  v41 = v18;
  v35 = v18;
  objc_msgSend(v17, "setValueFormatter:", v40);
  objc_msgSend(MEMORY[0x1E0D83008], "rowWithTitle:outletKeyPath:", CFSTR("Kill SpringBoard to Traverse the Mist"), CFSTR("killSpringBoardOutlet"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D83070];
  v54[0] = v8;
  v54[1] = v13;
  v54[2] = v17;
  v54[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v2;
  objc_msgSend(v20, "sectionWithRows:title:condition:", v21, CFSTR("Devs Helping Devs (DO NOT FILE RADARS IF YOU CHANGE THESE)"), v2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83098], "actionWithHandler:", &__block_literal_global_43);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:action:", CFSTR("Restore All Defaults"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0D83070];
  v53 = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sectionWithRows:title:condition:", v28, CFSTR("Restore Defaults"), v2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D83070];
  v52[0] = v37;
  v52[1] = v36;
  v52[2] = v23;
  v52[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "moduleWithTitle:contents:", CFSTR("Runtime Requirements"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

id __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setChamois_97748869:", objc_msgSend(v3, "BOOLValue"));
  return v3;
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  v5 = objc_msgSend(v3, "chamois");
  objc_msgSend(v4, "setFakeStorageForChamois97748869Enabling:", v5);

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
}

id __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAllowWirelessDisplaysForExtendedDisplayMode:", objc_msgSend(v3, "BOOLValue"));
  return v3;
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  v5 = objc_msgSend(v3, "allowWirelessDisplaysForExtendedDisplayMode");
  objc_msgSend(v4, "setFakeStorageForWirelessDisplaySupport:", v5);

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
}

id __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  float v4;

  v3 = a2;
  objc_msgSend(v3, "floatValue");
  objc_msgSend(*(id *)(a1 + 32), "setContentsScale:", v4);
  return v3;
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  double v5;
  double v6;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v3, "contentsScale");
  v6 = v5;
  objc_msgSend(v4, "setFakeStorageForContentsScale:");

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
}

uint64_t __53__SBExternalDisplaySettings_settingsControllerModule__block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalDisplayDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetPrototypeSettingAdjustableDefaults");

  objc_msgSend(v3, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDefaultValues");
  return 1;
}

- (SBExternalDisplayRuntimeAvailabilitySettings)availabilitySettings
{
  return self->_availabilitySettings;
}

- (void)setAvailabilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySettings, a3);
}

- (void)setActiveDisplayTrackingMethodology:(int64_t)a3
{
  self->_activeDisplayTrackingMethodology = a3;
}

- (PTOutlet)killSpringBoardOutlet
{
  return self->_killSpringBoardOutlet;
}

- (void)setKillSpringBoardOutlet:(id)a3
{
  objc_storeStrong((id *)&self->_killSpringBoardOutlet, a3);
}

- (double)fakeStorageForContentsScale
{
  return self->_fakeStorageForContentsScale;
}

- (void)setFakeStorageForContentsScale:(double)a3
{
  self->_fakeStorageForContentsScale = a3;
}

- (BOOL)fakeStorageForWirelessDisplaySupport
{
  return self->_fakeStorageForWirelessDisplaySupport;
}

- (void)setFakeStorageForWirelessDisplaySupport:(BOOL)a3
{
  self->_fakeStorageForWirelessDisplaySupport = a3;
}

- (BOOL)fakeStorageForUnderpoweredDeviceSupport
{
  return self->_fakeStorageForUnderpoweredDeviceSupport;
}

- (void)setFakeStorageForUnderpoweredDeviceSupport:(BOOL)a3
{
  self->_fakeStorageForUnderpoweredDeviceSupport = a3;
}

- (BOOL)fakeStorageForChamois97748869Enabling
{
  return self->_fakeStorageForChamois97748869Enabling;
}

- (void)setFakeStorageForChamois97748869Enabling:(BOOL)a3
{
  self->_fakeStorageForChamois97748869Enabling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_killSpringBoardOutlet, 0);
  objc_storeStrong((id *)&self->_availabilitySettings, 0);
}

@end
