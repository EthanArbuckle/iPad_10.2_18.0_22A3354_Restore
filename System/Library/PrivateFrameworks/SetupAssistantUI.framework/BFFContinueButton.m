@implementation BFFContinueButton

+ (id)buttonWithType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___BFFContinueButton;
  objc_msgSendSuper2(&v12, sel_buttonWithType_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setButtonBackgroundColor:", v4);

  objc_msgSend(v3, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_msgSend(v3, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v8, 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "colorWithAlphaComponent:", 0.25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitleColor:forState:", v10, 1);

  objc_msgSend(v3, "setClipsToBounds:", 1);
  objc_msgSend(v3, "_setCornerRadius:", 14.0);
  return v3;
}

- (void)_setButtonBackgroundColor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[BFFContinueButton tintColor](self, "tintColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BFFPointImageOfColor(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFContinueButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v5, 0);

  -[BFFContinueButton tintColor](self, "tintColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BFFPointImageOfColor(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFContinueButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v7, 1);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BFFContinueButton;
  -[BFFContinueButton tintColorDidChange](&v4, sel_tintColorDidChange);
  -[BFFContinueButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFContinueButton _setButtonBackgroundColor:](self, "_setButtonBackgroundColor:", v3);

}

@end
