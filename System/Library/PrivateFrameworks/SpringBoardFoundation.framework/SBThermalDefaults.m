@implementation SBThermalDefaults

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "wasConnectedToWiFiWhenBrickedForThermalConditions");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("ThermalLockoutWiFiWasEnabled"), MEMORY[0x1E0C9AAA0], 4);

}

@end
