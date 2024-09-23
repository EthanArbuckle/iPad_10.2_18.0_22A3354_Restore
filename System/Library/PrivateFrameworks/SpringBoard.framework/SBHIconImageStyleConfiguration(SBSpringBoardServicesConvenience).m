@implementation SBHIconImageStyleConfiguration(SBSpringBoardServicesConvenience)

- (id)sb_homeScreenIconStyleConfiguration
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(a1, "configurationType");
  if (v2 == 4)
  {
    v4 = (void *)MEMORY[0x1E0DAAE80];
    objc_msgSend(a1, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "BSColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tintedStyleConfigurationWithTintColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v2 == 3)
    {
      objc_msgSend(MEMORY[0x1E0DAAE80], "darkStyleConfiguration");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2)
        objc_msgSend(MEMORY[0x1E0DAAE80], "lightStyleConfiguration");
      else
        objc_msgSend(MEMORY[0x1E0DAAE80], "automaticStyleConfiguration");
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v3;
  }
  return v7;
}

@end
