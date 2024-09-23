@implementation SBMiscellaneousDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dataPlanActivationPromptCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBDataPlanActivationPromptCount"), &unk_1E203A978, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressNoSimAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBSuppressNoSimAlert"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "walletPreArmForceLockButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBWalletPreArmForceLockButton"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "backlightLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBBacklightLevel2"), &unk_1E203B5A8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressAlertsForKeynote");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBSupressAlertsForKeynote"), v5, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "sensitiveUIEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBSensitiveUIEnabled"), MEMORY[0x1E0C9AAB0], 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableAsyncRenderingSurfaceRetention");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBDisableAsyncRenderingSurfaceRetention"), v5, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "launchWithMallocStackLogging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("SBShouldLaunchWithMallocStackLogging"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableAutomaticMallocStackLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("SBDisableAutomaticMallocStackLogging"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableDynamicJetsamLimits");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("SBEnableDynamicJetsamLimits"), v10, 1);

}

@end
