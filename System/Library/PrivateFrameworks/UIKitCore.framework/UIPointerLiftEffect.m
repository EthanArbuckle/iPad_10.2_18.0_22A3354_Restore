@implementation UIPointerLiftEffect

- (unint64_t)options
{
  return 882;
}

- (id)settings
{
  void *v2;
  void *v3;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liftEffectSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
