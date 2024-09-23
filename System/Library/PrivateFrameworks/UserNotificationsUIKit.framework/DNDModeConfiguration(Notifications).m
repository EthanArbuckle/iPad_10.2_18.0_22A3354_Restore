@implementation DNDModeConfiguration(Notifications)

- (BOOL)nc_modeConfigurationHasExclusiveAppConfigurationType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "applicationConfigurationType");

  return v2 == 0;
}

@end
