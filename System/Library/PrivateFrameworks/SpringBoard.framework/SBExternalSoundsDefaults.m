@implementation SBExternalSoundsDefaults

- (SBExternalSoundsDefaults)init
{
  return (SBExternalSoundsDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.preferences.sounds"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "keyboardPlaysSounds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("keyboard"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemHapticsEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("effects-haptic"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "buttonsCanChangeRingerVolume");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("buttons-can-change-ringer-volume"), MEMORY[0x1E0C9AAA0], 1);

}

@end
