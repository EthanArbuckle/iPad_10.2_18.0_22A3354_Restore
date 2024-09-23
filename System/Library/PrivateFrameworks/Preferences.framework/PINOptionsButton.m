@implementation PINOptionsButton

- (PINOptionsButton)init
{
  PINOptionsButton *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PINOptionsButton;
  objc_msgSend(-[PINOptionsButton class](&v7, sel_class), "buttonWithType:", 1);
  v3 = (PINOptionsButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PINOptionsButton titleLabel](v3, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFont:", v5);

    objc_msgSend(v4, "setNumberOfLines:", 0);
    objc_msgSend(v4, "setTextAlignment:", 1);
    objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);

  }
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PINOptionsButton;
  -[PINOptionsButton layoutSubviews](&v4, sel_layoutSubviews);
  -[PINOptionsButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  -[PINOptionsButton bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

@end
