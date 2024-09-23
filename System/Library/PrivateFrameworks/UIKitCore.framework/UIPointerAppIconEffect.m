@implementation UIPointerAppIconEffect

- (id)settings
{
  void *v2;
  void *v3;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SBAppIconEffectSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)overrideSlipPoints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  -[UIPointerAppIconEffect settings](self, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideSlipPoints");
  v6 = v5;
  -[UIPointerAppIconEffect settings](self, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overrideSlipPoints");
  objc_msgSend(v3, "valueWithCGPoint:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)useSoftShadow
{
  return 0;
}

@end
