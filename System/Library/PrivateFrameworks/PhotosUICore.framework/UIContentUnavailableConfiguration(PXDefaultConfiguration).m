@implementation UIContentUnavailableConfiguration(PXDefaultConfiguration)

+ (id)px_containerized_defaultConfiguration
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B50]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredSymbolConfiguration:", v1);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "textProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v5);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "secondaryTextProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "secondaryTextProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColor:", v11);

  objc_msgSend(v0, "setImageToTextPadding:", 8.0);
  objc_msgSend(v0, "setTextToSecondaryTextPadding:", 4.0);
  objc_msgSend(v0, "setTextToButtonPadding:", 12.0);
  objc_msgSend(v0, "setButtonToSecondaryButtonPadding:", 12.0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v0, "setDirectionalLayoutMargins:", 20.0, 20.0, 20.0, 20.0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v14);

    objc_msgSend(v0, "setBackground:", v13);
  }
  return v0;
}

@end
