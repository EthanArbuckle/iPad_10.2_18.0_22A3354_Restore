@implementation TPNumberPadDynamicButton

- (void)updateCurrentStyleIfNecessaryFromStyle:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  -[TPNumberPadDynamicButton traitCollection](self, "traitCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "userInterfaceStyle") == a3)
  {

  }
  else
  {
    -[TPNumberPadDynamicButton traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v6)
    {
      -[TPNumberPadDynamicButton traitCollection](self, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      currentStyle = objc_msgSend(v7, "userInterfaceStyle");

      -[TPNumberPadDynamicButton buttonColor](self, "buttonColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPNumberPadButton setColor:](self, "setColor:", v8);

      -[TPNumberPadButton reloadImagesForCurrentCharacter](self, "reloadImagesForCurrentCharacter");
    }
  }
}

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  id v4;
  void *v5;
  objc_super v7;

  currentStyle = a4;
  v7.receiver = self;
  v7.super_class = (Class)TPNumberPadDynamicButton;
  v4 = -[TPNumberPadButton initForCharacter:style:](&v7, sel_initForCharacter_style_, a3);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "updateCurrentStyleIfNecessaryFromStyle:", currentStyle);
  return v5;
}

- (id)buttonColor
{
  if (currentStyle == 2)
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (double)unhighlightedCircleViewAlpha
{
  __objc2_class **v2;
  double result;

  if (currentStyle == 2)
    v2 = off_1E75FBEA0;
  else
    v2 = off_1E75FBEA8;
  -[__objc2_class unhighlightedCircleViewAlpha](*v2, "unhighlightedCircleViewAlpha");
  return result;
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return (id)objc_msgSend(a1, "imageForCharacter:highlighted:whiteVersion:", a3, 0, currentStyle == 2);
}

+ (id)imageForCharacter:(int64_t)a3
{
  return (id)objc_msgSend(a1, "imageForCharacter:highlighted:whiteVersion:", a3, 0, currentStyle == 2);
}

+ (int64_t)currentStyle
{
  return currentStyle;
}

+ (double)highlightedCircleViewAlpha
{
  __objc2_class **v2;
  double result;

  if (currentStyle == 2)
    v2 = off_1E75FBEA0;
  else
    v2 = off_1E75FBEA8;
  -[__objc2_class highlightedCircleViewAlpha](*v2, "highlightedCircleViewAlpha");
  return result;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPNumberPadDynamicButton;
  v4 = a3;
  -[TPNumberPadDynamicButton traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "userInterfaceStyle", v6.receiver, v6.super_class);

  -[TPNumberPadDynamicButton updateCurrentStyleIfNecessaryFromStyle:](self, "updateCurrentStyleIfNecessaryFromStyle:", v5);
}

@end
