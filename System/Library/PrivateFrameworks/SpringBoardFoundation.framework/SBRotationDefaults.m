@implementation SBRotationDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "lastLockedOrientation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      v4 = CFSTR("SBLastRotationLockedOrientationiPad");
    else
      v4 = CFSTR("SBLastRotationLockedOrientation");
    -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, v4, &unk_1E203A8E8, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
      v6 = CFSTR("SBLastRotationLockedOrientationiPad");
    else
      v6 = CFSTR("SBLastRotationLockedOrientation");
    -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, v6, &unk_1E203A8E8, 1);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "videoRotationEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBEnableVideoRotation"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "postModernRotationForciblyEnabled");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBPostModernRotationForciblyEnabled"), v8, 1);

}

@end
