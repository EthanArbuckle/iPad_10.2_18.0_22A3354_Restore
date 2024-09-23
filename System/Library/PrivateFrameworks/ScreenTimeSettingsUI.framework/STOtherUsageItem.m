@implementation STOtherUsageItem

- (id)displayName
{
  void *v2;
  void *v3;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OtherUsageCategoryTitle"), &stru_24DB8A1D0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
