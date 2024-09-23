@implementation SBUsageDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "standbyTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBStandByTime"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "batteryUsageTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBBatteryUsageTime"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hasChargedPartially");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBWHaveChargedPartially"), MEMORY[0x1E0C9AAA0], 1);

}

- (void)clearUsageDefaults
{
  id v3;

  -[BSAbstractDefaultDomain _store](self, "_store");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBStandByTime"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBBatteryUsageTime"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBWHaveChargedPartially"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SBInitialStandByTime"));
  -[BSAbstractDefaultDomain synchronizeDefaults](self, "synchronizeDefaults");

}

@end
