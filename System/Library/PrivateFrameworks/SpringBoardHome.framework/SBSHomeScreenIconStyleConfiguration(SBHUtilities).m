@implementation SBSHomeScreenIconStyleConfiguration(SBHUtilities)

- (id)sbh_iconImageStyleConfiguration
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  switch(objc_msgSend(a1, "configurationType"))
  {
    case 0:
      +[SBHIconImageStyleConfiguration automaticStyleConfiguration](SBHIconImageStyleConfiguration, "automaticStyleConfiguration");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      +[SBHIconImageStyleConfiguration lightStyleConfiguration](SBHIconImageStyleConfiguration, "lightStyleConfiguration");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      +[SBHIconImageStyleConfiguration darkStyleConfiguration](SBHIconImageStyleConfiguration, "darkStyleConfiguration");
      v2 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v3 = (void *)v2;
      break;
    case 3:
      objc_msgSend(a1, "tintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UIColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBHIconImageStyleConfiguration tintedStyleConfigurationWithTintColor:](SBHIconImageStyleConfiguration, "tintedStyleConfigurationWithTintColor:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

@end
