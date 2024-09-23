@implementation SBSHomeScreenIconStyleConfiguration(SBSpringBoardServicesConvenience)

- (id)sb_iconImageStyleConfiguration
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  switch(objc_msgSend(a1, "configurationType"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DAA4A0], "automaticStyleConfiguration");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x1E0DAA4A0], "lightStyleConfiguration");
      v2 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x1E0DAA4A0], "darkStyleConfiguration");
      v2 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v3 = (void *)v2;
      break;
    case 3:
      v4 = (void *)MEMORY[0x1E0DAA4A0];
      objc_msgSend(a1, "tintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UIColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "tintedStyleConfigurationWithTintColor:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

@end
