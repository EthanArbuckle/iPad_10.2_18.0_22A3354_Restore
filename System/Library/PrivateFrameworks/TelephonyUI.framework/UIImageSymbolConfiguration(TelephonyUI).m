@implementation UIImageSymbolConfiguration(TelephonyUI)

+ (id)tpConfigurationWithStaticTextStyle:()TelephonyUI scale:
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  double v16;
  uint64_t v17;
  void *v18;

  v6 = (void *)MEMORY[0x1E0DC1358];
  v7 = (void *)MEMORY[0x1E0DC3E88];
  v8 = *MEMORY[0x1E0DC4920];
  v9 = a3;
  objc_msgSend(v7, "traitCollectionWithPreferredContentSizeCategory:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "fontAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13C0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1458]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  v17 = MEMORY[0x1C3B6F0BC](v16);
  objc_msgSend(v11, "pointSize");
  objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v17, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)hierarchicalTpConfigurationWithStaticTextStyle:()TelephonyUI scale:color:
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = (void *)MEMORY[0x1E0DC1358];
  v9 = (void *)MEMORY[0x1E0DC3E88];
  v10 = *MEMORY[0x1E0DC4920];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v9, "traitCollectionWithPreferredContentSizeCategory:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "fontAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13C0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1458]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;

  v20 = MEMORY[0x1C3B6F0BC](v19);
  objc_msgSend(v14, "pointSize");
  objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v20, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithHierarchicalColor:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "configurationByApplyingConfiguration:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)paletteTpConfigurationWithStaticTextStyle:()TelephonyUI scale:colors:
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v7 = (void *)MEMORY[0x1E0DC1358];
  v8 = *MEMORY[0x1E0DC4B50];
  v9 = (void *)MEMORY[0x1E0DC3E88];
  v10 = *MEMORY[0x1E0DC4920];
  v11 = a5;
  objc_msgSend(v9, "traitCollectionWithPreferredContentSizeCategory:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "fontAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0DC13C0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1458]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17;

  v19 = MEMORY[0x1C3B6F0BC](v18);
  objc_msgSend(v13, "pointSize");
  objc_msgSend(a1, "configurationWithPointSize:weight:scale:", v19, a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPaletteColors:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "configurationByApplyingConfiguration:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)tpConfigurationWithStaticTextStyle:()TelephonyUI scale:symbolWeight:
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (void *)MEMORY[0x1E0DC1358];
  v9 = (void *)MEMORY[0x1E0DC3E88];
  v10 = *MEMORY[0x1E0DC4920];
  v11 = a3;
  objc_msgSend(v9, "traitCollectionWithPreferredContentSizeCategory:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pointSize");
  objc_msgSend(a1, "configurationWithPointSize:weight:scale:", a5, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
