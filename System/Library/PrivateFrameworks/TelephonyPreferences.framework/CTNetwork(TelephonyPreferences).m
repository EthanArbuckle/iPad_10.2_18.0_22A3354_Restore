@implementation CTNetwork(TelephonyPreferences)

- (id)tps_localizedName
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPSLocalizedString localizedStringForKey:](TPSLocalizedString, "localizedStringForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "name");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

@end
