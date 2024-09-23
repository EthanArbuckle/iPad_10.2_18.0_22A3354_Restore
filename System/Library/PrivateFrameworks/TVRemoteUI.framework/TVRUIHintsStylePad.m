@implementation TVRUIHintsStylePad

- (id)backgroundColor
{
  return 0;
}

- (id)backgroundFilters
{
  return 0;
}

- (id)primaryTintColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)siriImage
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:fontSize:weight:scale:", CFSTR("mic.circle.fill"), 7, 3, 28.0);
}

- (id)volumeImage
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "tvrui_symbolImageWithName:fontSize:weight:scale:", CFSTR("speaker.wave.2.circle.fill"), 7, 3, 28.0);
}

- (double)maximumSymbolPointSize
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  -[TVRUIHintsStyle maximumSymbolPointSize](&v3, sel_maximumSymbolPointSize);
  return result;
}

- (BOOL)shouldShowSiriHint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  return -[TVRUIHintsStyle shouldShowSiriHint](&v3, sel_shouldShowSiriHint);
}

- (BOOL)shouldShowVolumeHint
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  return -[TVRUIHintsStyle shouldShowVolumeHint](&v3, sel_shouldShowVolumeHint);
}

- (double)imageMargin
{
  return 12.0;
}

- (double)animationPresentationDelay
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  -[TVRUIHintsStyle animationPresentationDelay](&v3, sel_animationPresentationDelay);
  return result;
}

- (double)animationDuration
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  -[TVRUIHintsStyle animationDuration](&v3, sel_animationDuration);
  return result;
}

- (double)activationAnimationDuration
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  -[TVRUIHintsStyle activationAnimationDuration](&v3, sel_activationAnimationDuration);
  return result;
}

- (double)activationAnimationDismissalDelay
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  -[TVRUIHintsStyle activationAnimationDismissalDelay](&v3, sel_activationAnimationDismissalDelay);
  return result;
}

- (double)buttonOutlineWidth
{
  return 6.0;
}

- (double)siriHintContainerWidth
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[TVRUIHintsStylePad siriImage](self, "siriImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[TVRUIHintsStylePad buttonOutlineWidth](self, "buttonOutlineWidth");
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

  -[TVRUIHintsStylePad volumeImage](self, "volumeImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  -[TVRUIHintsStylePad buttonOutlineWidth](self, "buttonOutlineWidth");
  v7 = v5 + v6;

  return v7;
}

- (id)siriHintTipContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  -[TVRUIHintsStyle siriHintTipContext](&v3, sel_siriHintTipContext);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)userInterfaceStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  return -[TVRUIHintsStyle userInterfaceStyle](&v3, sel_userInterfaceStyle);
}

- (double)preferredTipWidth
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsStylePad;
  -[TVRUIHintsStyle preferredTipWidth](&v3, sel_preferredTipWidth);
  return result;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", CFSTR("Pad"), CFSTR("idiom"));
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIHintsStyle hasHomeButton](self, "hasHomeButton"), CFSTR("hasHomeButton"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

@end
