@implementation THGlossaryDimensions

+ (id)definitionBackgroundColor
{
  return +[TSUColor whiteColor](TSUColor, "whiteColor");
}

+ (id)definitionScrollViewBackgroundColor
{
  return +[TSUColor clearColor](TSUColor, "clearColor");
}

+ (id)definitionsViewBackgroundColor
{
  return +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.976470588, 1.0);
}

@end
