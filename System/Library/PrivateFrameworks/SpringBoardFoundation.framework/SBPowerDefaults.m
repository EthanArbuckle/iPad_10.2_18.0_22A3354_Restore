@implementation SBPowerDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableIdleSleep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBDisableIdleSleep"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hideACPower");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBHideACPower"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hideLowPowerAlerts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBHideLowPowerAlerts"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lowBatteryLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBLowBatteryLevel"), &unk_1E203A8B8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "trackPowerEvents");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBTrackPowerEvents"), v4, 1);

}

@end
