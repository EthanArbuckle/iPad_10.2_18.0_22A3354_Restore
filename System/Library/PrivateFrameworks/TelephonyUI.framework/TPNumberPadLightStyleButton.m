@implementation TPNumberPadLightStyleButton

+ (double)unhighlightedCircleViewAlpha
{
  return 0.100000001;
}

- (id)defaultColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
}

+ (id)imageForCharacter:(int64_t)a3
{
  return (id)objc_msgSend(a1, "imageForCharacter:highlighted:whiteVersion:", a3, 0, 0);
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return (id)objc_msgSend(a1, "imageForCharacter:highlighted:whiteVersion:", a3, 0, 0);
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 1;
}

- (id)buttonColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

+ (double)highlightedCircleViewAlpha
{
  return 0.300000012;
}

@end
