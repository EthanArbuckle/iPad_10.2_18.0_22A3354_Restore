@implementation UIButtonConfiguration(SBUISystemApertureStyling)

+ (id)sbui_systemApertureTextButtonConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEAB40], "sbui_bestTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:()SBUISystemApertureStyling
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v4 = a3;
  objc_msgSend(a1, "tintedButtonConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseForegroundColor:", v7);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_sbui_titleTextAttributesTransformerForTitleFont:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleTextAttributesTransformer:", v9);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:scale:", v8, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v10);

  objc_msgSend(v5, "setButtonSize:", 3);
  objc_msgSend(v5, "contentInsets");
  objc_msgSend(v5, "setContentInsets:", v11 + -5.0);
  objc_msgSend(v5, "setImagePadding:", 7.0);
  objc_msgSend(v5, "background");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColorTransformer:", &__block_literal_global_4);

  return v5;
}

+ (id)sbui_systemApertureSymbolButtonConfiguration
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "tintedButtonConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemExtraLightGrayColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBaseBackgroundColor:", v2);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBaseForegroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0CEA650], "sbui_systemApertureControlConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPreferredSymbolConfigurationForImage:", v4);

  objc_msgSend(v1, "setButtonSize:", 3);
  objc_msgSend(v1, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColorTransformer:", &__block_literal_global_15);

  return v1;
}

+ (id)_sbui_titleTextAttributesTransformerForTitleFont:()SBUISystemApertureStyling
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__UIButtonConfiguration_SBUISystemApertureStyling___sbui_titleTextAttributesTransformerForTitleFont___block_invoke;
  v7[3] = &unk_1E4C3EC80;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1A85A1798](v7);

  return v5;
}

@end
