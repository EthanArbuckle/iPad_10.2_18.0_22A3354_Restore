@implementation TSDScalarPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDScalarPathSource");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDPathSourceAccessibility, a2);
}

- (id)_tsaxInferredLabel
{
  unsigned int v3;
  const __CFString *v4;
  unint64_t v5;

  v3 = -[TSDScalarPathSourceAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("type"));
  if (v3 == 1)
  {
    v5 = -[TSDScalarPathSourceAccessibility _tsaxNumberOfSides](self, "_tsaxNumberOfSides") - 3;
    if (v5 <= 2)
    {
      v4 = off_43BFE0[v5];
      return TSAccessibilityLocalizedString((uint64_t)v4);
    }
  }
  else if (!v3)
  {
    if (-[TSDScalarPathSourceAccessibility _tsaxNumberOfSides](self, "_tsaxNumberOfSides"))
      v4 = CFSTR("RoundRect");
    else
      v4 = CFSTR("Square");
    return TSAccessibilityLocalizedString((uint64_t)v4);
  }
  return 0;
}

- (unint64_t)_tsaxNumberOfSides
{
  double v2;

  -[TSDScalarPathSourceAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("scalar"));
  return llround(v2);
}

@end
