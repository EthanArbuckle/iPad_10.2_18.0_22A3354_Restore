@implementation TPAccessoryButton

- (void)configureForImage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0DC3520];
  v5 = a3;
  objc_msgSend(v4, "filledButtonConfiguration");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v5);

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPreferredSymbolConfigurationForImage:", v6);

  objc_msgSend(v13, "setCornerStyle:", 4);
  objc_msgSend(v13, "contentInsets");
  objc_msgSend(v13, "setContentInsets:", v7 + 2.0, v8 + 2.0, v9 + 2.0, v10 + 2.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBaseBackgroundColor:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBaseForegroundColor:", v12);

  -[TPAccessoryButton setConfiguration:](self, "setConfiguration:", v13);
}

@end
