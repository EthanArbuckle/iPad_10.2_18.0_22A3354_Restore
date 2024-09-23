@implementation UIButtonConfiguration

+ (id)_maps_primaryCardFooterActionButtonConfiguration
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:", v3));

  return v4;
}

+ (id)_maps_secondaryCardFooterActionButtonConfiguration
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration grayButtonConfiguration](UIButtonConfiguration, "grayButtonConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:isSecondary:", v3, 1));

  return v4;
}

+ (id)_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:(id)a3
{
  return objc_msgSend(a1, "_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:isSecondary:", a3, 0);
}

+ (id)_maps_cardFooterActionButtonConfigurationWithBaseConfiguration:(id)a3 isSecondary:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double leading;
  double bottom;
  double trailing;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleTitle3, UIFontWeightBold));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_cappedFont:withMaxPoint:](UIFont, "_maps_cappedFont:withMaxPoint:", v5, 34.0));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10059A3D4;
  v15[3] = &unk_1011AFCC0;
  v16 = v6;
  v7 = v6;
  objc_msgSend(v4, "setTitleTextAttributesTransformer:", v15);
  objc_msgSend(v4, "setImagePadding:", 4.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
  objc_msgSend(v8, "setCornerRadius:", 12.0);

  objc_msgSend(v4, "setCornerStyle:", -1);
  leading = NSDirectionalEdgeInsetsZero.leading;
  bottom = NSDirectionalEdgeInsetsZero.bottom;
  trailing = NSDirectionalEdgeInsetsZero.trailing;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
  objc_msgSend(v12, "setBackgroundInsets:", NSDirectionalEdgeInsetsZero.top, leading, bottom, trailing);

  objc_msgSend(v4, "setContentInsets:", 12.0, 10.0, 12.0, 10.0);
  objc_msgSend(v4, "setTitleAlignment:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v7));
  objc_msgSend(v4, "setPreferredSymbolConfigurationForImage:", v13);

  objc_msgSend(v4, "setTitleLineBreakMode:", 4);
  return v4;
}

+ (id)_maps_pillButtonConfigurationWithImage:(BOOL)a3
{
  return objc_msgSend(a1, "_maps_pillButtonConfigurationWithImage:scalingImageForDynamicText:scalingTitleForDynamicText:", a3, 1, 1);
}

+ (id)_maps_pillButtonConfigurationWithImage:(BOOL)a3 scalingImageForDynamicText:(BOOL)a4 scalingTitleForDynamicText:(BOOL)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  BOOL v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration grayButtonConfiguration](UIButtonConfiguration, "grayButtonConfiguration"));
  objc_msgSend(v8, "setCornerStyle:", 4);
  v9 = 8.0;
  if (!v7)
    v9 = 10.0;
  objc_msgSend(v8, "setContentInsets:", 4.0, v9, 4.0, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
  objc_msgSend(v8, "setBaseBackgroundColor:", v10);

  objc_msgSend(v8, "setImagePadding:", 4.0);
  if (v6)
    v11 = objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleSubheadline, 0, UIFontWeightSemibold));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightSemibold));
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v11, 2));
  objc_msgSend(v8, "setPreferredSymbolConfigurationForImage:", v13);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10059A598;
  v15[3] = &unk_1011BBFB8;
  v16 = a5;
  objc_msgSend(v8, "setTitleTextAttributesTransformer:", v15);
  return v8;
}

+ (id)_maps_roundPillSymbolButtonConfigurationScalingImageForDynamicText:(BOOL)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_maps_pillButtonConfigurationWithImage:scalingImageForDynamicText:scalingTitleForDynamicText:", 1, a3, 0));
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  objc_msgSend(v3, "contentInsets");
  v7 = v6;
  objc_msgSend(v3, "contentInsets");
  v9 = v8;
  objc_msgSend(v3, "contentInsets");
  objc_msgSend(v3, "setContentInsets:", v5, v7, v9, v10);
  objc_msgSend(v3, "contentInsets");
  v12 = 32.0 - v11;
  objc_msgSend(v3, "contentInsets");
  objc_msgSend(v3, "setImageReservation:", v12 - v13);
  return v3;
}

@end
