@implementation BKUISliderAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UISlider");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)_accessibilityServesAsFirstElement
{
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUISliderAccessibility imaxIdentification](self, "imaxIdentification"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BrightnessSlider"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)BKUISliderAccessibility;
  return -[BKUISliderAccessibility _accessibilityServesAsFirstElement](&v6, "_accessibilityServesAsFirstElement");
}

- (id)accessibilityLabel
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUISliderAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BrightnessSlider"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKUISliderAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel"));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BKUISliderAccessibility;
    v6 = -[BKUISliderAccessibility accessibilityLabel](&v8, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

@end
