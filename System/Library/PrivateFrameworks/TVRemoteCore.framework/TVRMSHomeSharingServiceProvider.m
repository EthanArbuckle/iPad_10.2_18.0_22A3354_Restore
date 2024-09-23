@implementation TVRMSHomeSharingServiceProvider

- (id)searchType
{
  return CFSTR("_home-sharing._tcp.");
}

- (id)searchScope
{
  __CFString *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  CFPreferencesAppSynchronize(CFSTR("com.apple.TVRemoteMediaServices"));
  v2 = 0;
  if (!CFPreferencesGetAppBooleanValue(CFSTR("AllowAnyHomeSharingID"), CFSTR("com.apple.TVRemoteMediaServices"), 0))
  {
    objc_msgSend(MEMORY[0x24BE4F318], "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupID");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v5 = &stru_24DCDC4B0;
    if (v4)
      v5 = v4;
    v2 = v5;

  }
  return v2;
}

- (int64_t)serviceDiscoverySource
{
  return 1;
}

@end
