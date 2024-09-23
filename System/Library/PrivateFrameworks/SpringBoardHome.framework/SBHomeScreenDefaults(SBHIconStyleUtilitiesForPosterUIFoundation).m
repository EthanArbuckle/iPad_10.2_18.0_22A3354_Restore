@implementation SBHomeScreenDefaults(SBHIconStyleUtilitiesForPosterUIFoundation)

- (id)sbh_homeScreenConfiguration
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;

  v2 = (void *)MEMORY[0x1D17DF4E4]();
  objc_msgSend(a1, "iconUserInterfaceStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iconUserInterfaceStyleVariation");
  v5 = v4;
  objc_msgSend(a1, "iconUserInterfaceStyleLuminance");
  v7 = v6;
  objc_msgSend(a1, "iconUserInterfaceStyleSaturation");
  v9 = v8;
  v10 = _PUIHomeScreenStyleTypeFromSBIconUserInterfaceStyleType(v3);
  v11 = (void *)objc_msgSend(objc_alloc((Class)getPUIStylePickerHomeScreenConfigurationClass()), "initWithStyleType:variation:luminance:saturation:", v10, v5, v7, v9);

  objc_autoreleasePoolPop(v2);
  return v11;
}

- (void)sbh_setHomeScreenConfiguration:()SBHIconStyleUtilitiesForPosterUIFoundation
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  _SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType(objc_msgSend(v4, "styleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setIconUserInterfaceStyle:", v5);

  objc_msgSend(v4, "luminance");
  objc_msgSend(a1, "setIconUserInterfaceStyleLuminance:");
  objc_msgSend(v4, "saturation");
  objc_msgSend(a1, "setIconUserInterfaceStyleSaturation:");
  objc_msgSend(v4, "variation");
  objc_msgSend(a1, "setIconUserInterfaceStyleVariation:");
  objc_msgSend(v4, "accentColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setIconTintColor:", v6);
}

@end
