@implementation SBSoftwareUpdateDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "developerInstallBrickAlertShown7DayWarning");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBDeveloperBrickAlert1"), MEMORY[0x1E0C9AAA0], 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "developerInstallBrickAlertShown3DayWarning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBDeveloperBrickAlert2"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "developerInstallBrickAlertShownTomorrowWarning");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBDeveloperBrickAlert3"), v4, 4);

}

- (void)clearDeveloperInstallBrickAlerts
{
  -[SBSoftwareUpdateDefaults setDeveloperInstallBrickAlertShown7DayWarning:](self, "setDeveloperInstallBrickAlertShown7DayWarning:", 0);
  -[SBSoftwareUpdateDefaults setDeveloperInstallBrickAlertShown3DayWarning:](self, "setDeveloperInstallBrickAlertShown3DayWarning:", 0);
  -[SBSoftwareUpdateDefaults setDeveloperInstallBrickAlertShownTomorrowWarning:](self, "setDeveloperInstallBrickAlertShownTomorrowWarning:", 0);
}

@end
