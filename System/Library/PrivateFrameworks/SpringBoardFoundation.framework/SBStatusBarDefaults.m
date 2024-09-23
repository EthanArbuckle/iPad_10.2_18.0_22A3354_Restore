@implementation SBStatusBarDefaults

- (void)_bindAndRegisterDefaults
{
  void *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "countryCodesShowingEmergencyOnlyStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBCountryCodesShowingEmergencyOnly"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressStatusBarOverrideForScreenSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBSuppressScreenSharingStatusBarOverridePreferenceKey"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showBatteryLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBShowBatteryLevel"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showBatteryPercentage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = __sb__runningInSpringBoard();
  v11 = v10;
  if (v10)
  {
    v12 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v2, "userInterfaceIdiom") == 1;
  }
  objc_msgSend(v9, "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBShowBatteryPercentage"), v13, 1);

  if ((v11 & 1) == 0)
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showOptimalCellDataForCarPlay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("SBCarPlayShowOptimalCellData"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showOverridesForRecording");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v16, CFSTR("SBShowStatusBarOverridesForRecording"), v15, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showRSSI");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v17, CFSTR("SBShowRSSI"), v15, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "statusBarLogLevel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v18, CFSTR("SBStatusBarishLogOptions"), &unk_1E203A930, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showThermalWarning");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v19, CFSTR("SBShowThermalWarning"), v15, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showRingerState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v20, CFSTR("SBShowRingerState"), MEMORY[0x1E0C9AAB0], 1);

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userInterfaceIdiom");

    if (v22 != 1)
      return;
  }
  -[BSAbstractDefaultDomain _store](self, "_store");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "bs_defaultExists:", CFSTR("SBShowBatteryPercentage")) & 1) == 0)
    objc_msgSend(v23, "setBool:forKey:", 1, CFSTR("SBShowBatteryPercentage"));

}

@end
