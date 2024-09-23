@implementation FBSSceneClientSettings(PRScene)

- (id)pr_timeDescriptor
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 20612);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)pr_statusBarTintColor
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 20613);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (uint64_t)pr_isDepthEffectDisabled
{
  void *v1;
  uint64_t IsYes;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flagForSetting:", 20614);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (uint64_t)pr_isParallaxEnabled
{
  void *v1;
  uint64_t IsYes;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "flagForSetting:", 20615);
  IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (id)pr_vibrancyConfiguration
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "otherSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForSetting:", 20616);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
