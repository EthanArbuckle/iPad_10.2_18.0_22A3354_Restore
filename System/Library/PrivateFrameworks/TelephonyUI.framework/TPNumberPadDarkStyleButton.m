@implementation TPNumberPadDarkStyleButton

- (id)defaultColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
}

+ (id)imageForCharacter:(int64_t)a3
{
  return (id)objc_msgSend(a1, "imageForCharacter:highlighted:whiteVersion:", a3, 0, 1);
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return (id)objc_msgSend(a1, "imageForCharacter:highlighted:whiteVersion:", a3, 0, 1);
}

- (id)buttonColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (double)unhighlightedCircleViewAlpha
{
  return 0.200000003;
}

+ (double)highlightedCircleViewAlpha
{
  return 0.649999976;
}

@end
