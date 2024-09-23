@implementation UIButton(SBUISystemApertureStyling)

- (void)sbui_updateConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "copy");

  v3 = (void *)MEMORY[0x1E0CEA5E8];
  objc_msgSend(a1, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA3A8], "_sbui_titleTextAttributesTransformerForTitleFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitleTextAttributesTransformer:", v6);
  objc_msgSend(a1, "setConfiguration:", v7);

}

@end
