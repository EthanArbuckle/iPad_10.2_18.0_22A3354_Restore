@implementation SBIdleTimerDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "minimumLockscreenIdleTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBMinimumLockscreenIdleTime"), &unk_1E203ACA8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableAutoDim");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBDisableAutoDim"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "dontDimOrLockWhileConnectedToPower");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBDontDimOrLockOnAC"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supportLiftToWake");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBSupportLiftToWake"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supportTapToWake");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBSupportTapToWake"), v8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableAttentionAwareness");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBDisableAttentionAwareness"), v5, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "backlightLoggingEnabled");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBEnableExtraBacklightLogging"), v5, 1);

}

- (BOOL)disableAutoDim
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SBIdleTimerDefaults disableAutoDimExists](self, "disableAutoDimExists");
  if (v3)
  {
    -[BSAbstractDefaultDomain _store](self, "_store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("SBDisableAutoDim"));

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)disableAutoDimExists
{
  void *v2;
  char v3;

  -[BSAbstractDefaultDomain _store](self, "_store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bs_defaultExists:", CFSTR("SBDisableAutoDim"));

  return v3;
}

@end
