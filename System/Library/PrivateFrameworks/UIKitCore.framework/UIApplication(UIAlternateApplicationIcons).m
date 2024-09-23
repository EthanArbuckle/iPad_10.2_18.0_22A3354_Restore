@implementation UIApplication(UIAlternateApplicationIcons)

- (NSString)_alternateIconName
{
  void *v2;
  void *v3;
  void *v4;

  LSApplicationProxyForSettingCurrentApplicationIcon();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "alternateIconName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

@end
