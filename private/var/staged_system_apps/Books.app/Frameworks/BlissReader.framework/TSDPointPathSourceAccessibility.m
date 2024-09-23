@implementation TSDPointPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDPointPathSource");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDPathSourceAccessibility, a2);
}

- (id)_tsaxInferredLabel
{
  int v2;

  v2 = -[TSDPointPathSourceAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("type"));
  if (v2 <= 99)
  {
    if (v2 < 2)
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("Arrow"));
    if (v2 == 10)
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("DoubleArrow"));
    return 0;
  }
  if (v2 != 100)
  {
    if (v2 == 200)
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("Plus"));
    return 0;
  }
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("Star"));
}

- (TSDPointPathSourceAccessibility)initWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  TSDPointPathSourceAccessibility *v6;
  const __CFString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDPointPathSourceAccessibility;
  v6 = -[TSDPointPathSourceAccessibility initWithType:point:naturalSize:](&v9, "initWithType:point:naturalSize:", a4.x, a4.y, a5.width, a5.height);
  if (a3 > 99)
  {
    if (a3 == 100)
    {
      v7 = CFSTR("Star");
      goto LABEL_10;
    }
    if (a3 == 200)
    {
      v7 = CFSTR("Plus");
      goto LABEL_10;
    }
  }
  else
  {
    if (a3 < 2)
    {
      v7 = CFSTR("Arrow");
LABEL_10:
      -[TSDPointPathSourceAccessibility setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", TSAccessibilityLocalizedString((uint64_t)v7));
      return v6;
    }
    if (a3 == 10)
    {
      v7 = CFSTR("DoubleArrow");
      goto LABEL_10;
    }
  }
  return v6;
}

@end
