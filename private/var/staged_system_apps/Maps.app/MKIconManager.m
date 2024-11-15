@implementation MKIconManager

+ (CGColor)newSignificantColorForStyleAttributes:(id)a3 forScale:(double)a4
{
  id v5;
  CGColor *v6;
  CGColor *v7;
  const CGFloat *v8;
  CGColor *v9;
  CGColor *v10;
  const CGFloat *Components;
  CGColor *v12;

  v5 = a3;
  v6 = (CGColor *)+[MKIconManager newFillColorForStyleAttributes:forScale:](MKIconManager, "newFillColorForStyleAttributes:forScale:", v5, a4);
  v7 = v6;
  if (v6)
  {
    if ((v8 = CGColorGetComponents(v6), *v8 < 0.00999999978)
      && v8[1] < 0.00999999978
      && v8[2] < 0.00999999978
      && v8[3] < 1.0
      || v8[3] < 0.00999999978)
    {
      v9 = (CGColor *)+[MKIconManager newGlyphColorForStyleAttributes:forScale:](MKIconManager, "newGlyphColorForStyleAttributes:forScale:", v5, a4);
      if (v9)
      {
        v10 = v9;
        Components = CGColorGetComponents(v9);
        if (*Components >= 1.0 && Components[1] >= 1.0 && Components[2] >= 1.0)
        {
          v12 = v10;
        }
        else
        {
          v12 = v7;
          v7 = v10;
        }
        CGColorRelease(v12);
      }
    }
  }

  return v7;
}

@end
