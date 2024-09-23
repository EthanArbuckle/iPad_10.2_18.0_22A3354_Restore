@implementation TVRUIHintsStylePhone

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
}

- (id)backgroundFilters
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5A78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", &unk_24DE4DDB8, CFSTR("inputRadius"));
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryTintColor
{
  double v2;
  double v3;

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    v2 = 0.388235294;
    v3 = 0.4;
  }
  else
  {
    v2 = 0.235294118;
    v3 = 0.262745098;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v2, v2, v3, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)siriImage
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", CFSTR("mic.circle.fill"), *MEMORY[0x24BEBE210], 7, 2, 1.79769313e308);
}

- (id)volumeImage
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:textStyle:weight:scale:maxPointSize:", CFSTR("speaker.wave.2.circle.fill"), *MEMORY[0x24BEBE210], 7, 2, 1.79769313e308);
}

- (double)maximumSymbolPointSize
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  -[TVRUIHintsStyle maximumSymbolPointSize](&v3, sel_maximumSymbolPointSize);
  return result;
}

- (BOOL)shouldShowSiriHint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  return -[TVRUIHintsStyle shouldShowSiriHint](&v3, sel_shouldShowSiriHint);
}

- (BOOL)shouldShowVolumeHint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  return -[TVRUIHintsStyle shouldShowVolumeHint](&v3, sel_shouldShowVolumeHint);
}

- (double)imageMargin
{
  return 13.0;
}

- (double)animationPresentationDelay
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  -[TVRUIHintsStyle animationPresentationDelay](&v3, sel_animationPresentationDelay);
  return result;
}

- (double)animationDuration
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  -[TVRUIHintsStyle animationDuration](&v3, sel_animationDuration);
  return result;
}

- (double)activationAnimationDuration
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  -[TVRUIHintsStyle activationAnimationDuration](&v3, sel_activationAnimationDuration);
  return result;
}

- (double)activationAnimationDismissalDelay
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  -[TVRUIHintsStyle activationAnimationDismissalDelay](&v3, sel_activationAnimationDismissalDelay);
  return result;
}

- (double)buttonOutlineWidth
{
  return 5.0;
}

- (double)hintButtonWidth
{
  return 2.0;
}

- (double)siriHintContainerWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[TVRUIHintsStylePhone siriImage](self, "siriImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[TVRUIHintsStylePhone buttonOutlineWidth](self, "buttonOutlineWidth");
  v7 = v5 + v6;

  return v7;
}

- (double)volumeHintContainerWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[TVRUIHintsStylePhone volumeImage](self, "volumeImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[TVRUIHintsStylePhone buttonOutlineWidth](self, "buttonOutlineWidth");
  v7 = v5 + v6;

  return v7;
}

- (id)siriHintTipContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  -[TVRUIHintsStyle siriHintTipContext](&v3, sel_siriHintTipContext);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)userInterfaceStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePhone;
  return -[TVRUIHintsStyle userInterfaceStyle](&v3, sel_userInterfaceStyle);
}

- (double)preferredTipWidth
{
  void *v3;
  double v4;
  double v5;
  double result;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;

  if (v5 <= 667.0)
    return 304.0;
  v7.receiver = self;
  v7.super_class = (Class)TVRUIHintsStylePhone;
  -[TVRUIHintsStyle preferredTipWidth](&v7, sel_preferredTipWidth);
  return result;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", CFSTR("Phone"), CFSTR("idiom"));
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIHintsStyle hasHomeButton](self, "hasHomeButton"), CFSTR("hasHomeButton"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
