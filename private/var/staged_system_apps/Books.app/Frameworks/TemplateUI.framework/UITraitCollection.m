@implementation UITraitCollection

+ (id)tui_allAPITraits
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[14];

  v16[0] = objc_opt_class(UITraitAccessibilityContrast, a2);
  v16[1] = objc_opt_class(UITraitActiveAppearance, v2);
  v16[2] = objc_opt_class(UITraitDisplayGamut, v3);
  v16[3] = objc_opt_class(UITraitDisplayScale, v4);
  v16[4] = objc_opt_class(UITraitForceTouchCapability, v5);
  v16[5] = objc_opt_class(UITraitHorizontalSizeClass, v6);
  v16[6] = objc_opt_class(UITraitLayoutDirection, v7);
  v16[7] = objc_opt_class(UITraitLegibilityWeight, v8);
  v16[8] = objc_opt_class(UITraitPreferredContentSizeCategory, v9);
  v16[9] = objc_opt_class(UITraitToolbarItemPresentationSize, v10);
  v16[10] = objc_opt_class(UITraitUserInterfaceIdiom, v11);
  v16[11] = objc_opt_class(UITraitUserInterfaceLevel, v12);
  v16[12] = objc_opt_class(UITraitUserInterfaceStyle, v13);
  v16[13] = objc_opt_class(UITraitVerticalSizeClass, v14);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 14));
}

@end
