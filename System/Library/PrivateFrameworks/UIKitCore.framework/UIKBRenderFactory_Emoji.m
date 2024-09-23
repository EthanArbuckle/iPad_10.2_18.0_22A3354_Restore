@implementation UIKBRenderFactory_Emoji

- (id)defaultKeyBackgroundColorName
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorWhite_Alpha97;
  if (!v3)
    v4 = UIKBColorWhite_Alpha30;
  v5 = *v4;

  return v5;
}

- (id)controlKeyBackgroundColorName
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorKeyGrayKeyLightBackground;
  if (!v3)
    v4 = UIKBColorKeyGrayKeyDarkBackground;
  v5 = *v4;

  return v5;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBRenderFactory_Emoji;
  -[UIKBRenderFactory backgroundTraitsForKeyplane:](&v8, sel_backgroundTraitsForKeyplane_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "lightKeyboard"))
    goto LABEL_4;
  v6 = +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality");

  if (v6 == 100)
  {
    +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", CFSTR("UIKBColorLightEmojiBackdropTint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundGradient:", v5);
LABEL_4:

  }
  return v4;
}

- (id)_emojiDefaultControlKeyActiveBackgroundColorGradient
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;
  void *v6;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "whiteText");
  v4 = UIKBColorWhite_Alpha30;
  if (!v3)
    v4 = UIKBColorWhite_Alpha87;
  v5 = *v4;

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_emojiDefaultControlKeyBackgroundColorGradient
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;
  void *v6;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "whiteText");
  v4 = UIKBColorKeyGrayKeyDarkBackground;
  if (!v3)
    v4 = UIKBColorKeyGrayKeyLightBackground;
  v5 = *v4;

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_emojiSpaceKeyActiveBackgroundColorGradient
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;
  void *v6;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "whiteText");
  v4 = UIKBColorWhite_Alpha30;
  if (!v3)
    v4 = UIKBColorKeyGrayKeyLightBackground;
  v5 = *v4;

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_emojiSpaceKeyBackgroundColorGradient
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;
  void *v6;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "whiteText");
  v4 = UIKBColorKeyGrayKeyDarkBackground;
  if (!v3)
    v4 = UIKBColorWhite_Alpha87;
  v5 = *v4;

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_emojiCategoryControlKeyActiveTraits
{
  void *v3;
  void *v4;
  int v5;
  __CFString **v6;
  __CFString *v7;
  void *v8;

  +[UIKBRenderTraits emptyTraits](UIKBRenderTraits, "emptyTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "whiteText");
  v6 = UIKBColorWhite_Alpha10;
  if (!v5)
    v6 = UIKBColorKeyGrayKeyLightBackground;
  v7 = *v6;

  +[UIKBGradient gradientWithFlatColor:](UIKBGradient, "gradientWithFlatColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setBackgroundGradient:", v8);
  return v3;
}

- (id)_emojiBorderColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "whiteText");
  v4 = UIKBColorWhite_Alpha10;
  if (!v3)
    v4 = UIKBColorBlack_Alpha16;
  v5 = *v4;

  return v5;
}

- (id)_emojiSkinToneDividerColor
{
  void *v2;
  int v3;
  __CFString **v4;
  __CFString *v5;

  -[UIKBRenderFactory renderConfig](self, "renderConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lightKeyboard");
  v4 = UIKBColorBlack_Alpha20;
  if (!v3)
    v4 = UIKBColorWhite_Alpha20;
  v5 = *v4;

  return v5;
}

@end
