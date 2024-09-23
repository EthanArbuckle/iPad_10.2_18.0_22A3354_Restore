@implementation SBGlyphStateValueTransformerForBrightnessRouteType

const __CFString *__SBGlyphStateValueTransformerForBrightnessRouteType_block_invoke(float a1)
{
  const __CFString *v2;

  if (a1 < 0.33)
    return CFSTR("min");
  if (a1 >= 1.0)
    v2 = CFSTR("max");
  else
    v2 = CFSTR("full");
  if (a1 >= 0.66)
    return v2;
  else
    return CFSTR("mid");
}

@end
