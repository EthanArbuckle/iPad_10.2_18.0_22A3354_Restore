@implementation UIButtonConfiguration(PKUIUtilities)

+ (void)pkui_createPlainButtonConfiguration
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "background");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCornerRadius:", 0.0);

  return v0;
}

+ (void)pkui_createPlainMinimalButtonConfiguration
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0DC3520], "pkui_createPlainButtonConfiguration");
  objc_msgSend(v0, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  return v0;
}

+ (id)pkui_plainConfigurationWithTitle:()PKUIUtilities font:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0DC3520];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v5, "pkui_createPlainButtonConfiguration");
  objc_msgSend(MEMORY[0x1E0CB3498], "pkui_attriutedStringWithString:font:paragraphStyle:", v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAttributedTitle:", v9);
  return v8;
}

+ (id)pkui_plainConfigurationWithTitle:()PKUIUtilities font:lineBreakMode:textAlignment:
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = (void *)MEMORY[0x1E0DC3520];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(v9, "pkui_createPlainButtonConfiguration");
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "setLineBreakMode:", a5);
  objc_msgSend(v14, "setAlignment:", a6);
  objc_msgSend(MEMORY[0x1E0CB3498], "pkui_attriutedStringWithString:font:paragraphStyle:", v11, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setAttributedTitle:", v15);
  return v12;
}

+ (id)pkui_plainConfigurationWithImage:()PKUIUtilities foregroundColor:
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0DC3520];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(v5, "pkui_createPlainMinimalButtonConfiguration");
  objc_msgSend(v8, "setImage:", v7);

  objc_msgSend(v8, "setBaseForegroundColor:", v6);
  return v8;
}

+ (id)pkui_plainConfigurationWithImage:()PKUIUtilities imageConfiguration:foregroundColor:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (void *)MEMORY[0x1E0DC3520];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(v7, "pkui_createPlainMinimalButtonConfiguration");
  objc_msgSend(v11, "setImage:", v10);

  objc_msgSend(v11, "setPreferredSymbolConfigurationForImage:", v9);
  objc_msgSend(v11, "setBaseForegroundColor:", v8);

  return v11;
}

@end
