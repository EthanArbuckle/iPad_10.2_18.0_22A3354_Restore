@implementation UIColor

void __36__UIColor_MTAdditions__appTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.447058824, 0.141176471, 0.847058824, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)appTintColor_tintColor;
  appTintColor_tintColor = v0;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.611764706, 0.352941176, 0.949019608, 1.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)appTintColor_lightTintColor;
  appTintColor_lightTintColor = v2;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = v5;
  v9[0] = appTintColor_tintColor;
  v9[1] = appTintColor_lightTintColor;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)appTintColor_colorsByTraitCollection;
  appTintColor_colorsByTraitCollection = v6;

}

void __51__UIColor_MTAdditions__cellEmpahsisBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "appTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cellEmpahsisBackgroundColor_color;
  cellEmpahsisBackgroundColor_color = v1;

}

void __53__UIColor_MTAdditions__cellEmpahsisSwitchBorderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.800000012, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)cellEmpahsisSwitchBorderColor_color;
  cellEmpahsisSwitchBorderColor_color = v0;

}

@end
