@implementation MailTrackingProtectionOnboardingViewControllerValues

- (UIImage)icon
{
  void *v2;

  if (+[UIDevice mf_isPad](UIDevice, "mf_isPad"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("envelope")));
  else
    v2 = 0;
  return (UIImage *)v2;
}

- (UIButton)learnMoreButton
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v2, "setBaseForegroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[OBHeaderAccessoryButton accessoryButton](OBHeaderAccessoryButton, "accessoryButton"));
  return (UIButton *)v4;
}

- (UIFont)primaryTextFont
{
  return (UIFont *)+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleSubheadline, UIFontWeightBold);
}

- (UIListContentConfiguration)cellConfiguration
{
  return +[UIListContentConfiguration subtitleCellConfiguration](UIListContentConfiguration, "subtitleCellConfiguration");
}

- (UIColor)secondaryTextPropertiesColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (UIFont)secondaryTextPropertiesFont
{
  return +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline);
}

- (double)widthConstant
{
  return 50.0;
}

- (double)topConstant
{
  return 0.0;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 35.0);
}

@end
