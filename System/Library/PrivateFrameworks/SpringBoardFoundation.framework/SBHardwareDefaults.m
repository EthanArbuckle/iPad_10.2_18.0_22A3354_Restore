@implementation SBHardwareDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[BSAbstractDefaultDomain _store](self, "_store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bs_defaultExists:", CFSTR("SBButtonForceFeel"));

  if ((v4 & 1) == 0)
  {
    -[BSAbstractDefaultDomain _store](self, "_store");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", &unk_1E203ACC0, CFSTR("SBButtonForceFeel"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hasSeenACaseLatchCoverOnce");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBHasSeenACaseLatchCoverOnce"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableHomeButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBDisableHomeButton"), v7, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableProximitySensor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBDisableProximity"), v7, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableHomeButtonDoublePress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBDisableHomeButtonDoublePress"), v7, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "homeButtonHapticType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBButtonForceFeel"), &unk_1E203ACC0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableNaturalVolumeButtonOrientation");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("SBDisableNaturalVolumeButtonArrangement"), v7, 1);

}

- (BOOL)_deviceRequiresNaturalVolumeButtonArrangement
{
  if (_deviceRequiresNaturalVolumeButtonArrangement_onceToken != -1)
    dispatch_once(&_deviceRequiresNaturalVolumeButtonArrangement_onceToken, &__block_literal_global_30);
  return _deviceRequiresNaturalVolumeButtonArrangement_sRequiredByThisHardware;
}

uint64_t __67__SBHardwareDefaults__deviceRequiresNaturalVolumeButtonArrangement__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _deviceRequiresNaturalVolumeButtonArrangement_sRequiredByThisHardware = result;
  return result;
}

- (BOOL)isNaturalVolumeButtonOrientationEnabled
{
  if (-[SBHardwareDefaults _deviceRequiresNaturalVolumeButtonArrangement](self, "_deviceRequiresNaturalVolumeButtonArrangement"))
  {
    return 1;
  }
  else
  {
    return -[SBHardwareDefaults disableNaturalVolumeButtonOrientation](self, "disableNaturalVolumeButtonOrientation") ^ 1;
  }
}

@end
