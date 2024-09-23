@implementation FBSSceneSettings(SBTransientLocal)

- (id)sb_displayIdentityForSceneManagers
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sb_displayConfigurationForSceneManagers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sb_displayConfigurationForSceneManagers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "transientLocalSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 5796);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "displayConfiguration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
