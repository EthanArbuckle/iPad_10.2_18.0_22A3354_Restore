@implementation VTUIButton

+ (id)_vtuiButtonWithPrimaryStyle
{
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

  +[VTUIButton buttonWithType:](VTUIButton, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v3, 0);

  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 0);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  objc_msgSend(v2, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  objc_msgSend(v2, "setContentVerticalAlignment:", 0);
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vtuiBackgroundButtonImageWithColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundImage:forState:", v9, 0);

  objc_msgSend(v2, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryButtonFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  return v2;
}

+ (id)_vtuiButtonWithPrimaryStyleForNormalAndDisabledState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_vtuiButtonWithPrimaryStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vtuiBackgroundButtonImageWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundImage:forState:", v5, 2);

  return v2;
}

+ (id)_vtuiProximityButtonWithPrimaryStyle
{
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

  +[VTUIButton buttonWithType:](VTUIButton, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v3, 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v4, 2);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 0);

  objc_msgSend(v2, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberOfLines:", 0);

  objc_msgSend(v2, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextAlignment:", 1);

  objc_msgSend(v2, "setContentVerticalAlignment:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v8);

  objc_msgSend(v2, "_setContinuousCornerRadius:", 12.0);
  objc_msgSend(v2, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "proxPrimaryButtonFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v11);

  return v2;
}

+ (id)_vtuiProximityDismissButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  +[VTUIButton buttonWithType:](VTUIButton, "buttonWithType:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UICloseButtonBackgroundCompact"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithTintColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundImage:forState:", v5, 0);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 7, 1, 15.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);

  return v2;
}

+ (id)_vtuiButtonWithSecondaryStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[VTUIButton buttonWithType:](VTUIButton, "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitleColor:forState:", v3, 0);

  objc_msgSend(v2, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineBreakMode:", 0);

  objc_msgSend(v2, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumberOfLines:", 0);

  objc_msgSend(v2, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlignment:", 1);

  objc_msgSend(v2, "setContentVerticalAlignment:", 0);
  objc_msgSend(v2, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryButtonFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v9);

  return v2;
}

+ (id)vtuiBackgroundButtonImageWithColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CGSize v8;

  v3 = a3;
  v8.width = 26.0;
  v8.height = 26.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  objc_msgSend(v3, "set");

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 26.0, 26.0, 13.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v5, "resizableImageWithCapInsets:", 13.0, 13.0, 13.0, 13.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_vtuiProximityBackgroundButtonImageWithColor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CGSize v8;

  v3 = a3;
  v8.width = 16.0;
  v8.height = 16.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  objc_msgSend(v3, "set");

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 16.0, 16.0, 8.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fill");
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v5, "resizableImageWithCapInsets:", 8.0, 8.0, 8.0, 8.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (VTUIButton)initWithCoder:(id)a3
{
  VTUIButton *v3;
  VTUIButton *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VTUIButton;
  v3 = -[VTUIButton initWithCoder:](&v8, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[VTUIButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumberOfLines:", 0);

    -[VTUIButton titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLineBreakMode:", 0);

  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VTUIButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  -[VTUIButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUIButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  objc_msgSend(v3, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v6));

  v5.receiver = self;
  v5.super_class = (Class)VTUIButton;
  -[VTUIButton layoutSubviews](&v5, sel_layoutSubviews);
}

@end
