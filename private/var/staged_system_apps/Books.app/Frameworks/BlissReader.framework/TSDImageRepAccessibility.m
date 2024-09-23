@implementation TSDImageRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDImageRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (NSString)tsaxLabel
{
  NSString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[TSDRepAccessibility tsaxLockedLabel](self, "tsaxLockedLabel");
  v4 = objc_msgSend(-[TSDImageRepAccessibility _tsaxImageInfo](self, "_tsaxImageInfo"), "tsaxDescription");
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("image"));
}

- (id)_tsaxImageInfo
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDImageInfoAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("imageInfo")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDImageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  TSDImageRepAccessibility *v4;
  TSDImageRepAccessibility *v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDImageRepAccessibility;
  v4 = -[TSDImageRepAccessibility initWithLayout:canvas:](&v8, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = -[TSDRepAccessibility accessibilityTraits](v4, "accessibilityTraits");
    -[TSDImageRepAccessibility setAccessibilityTraits:](v5, "setAccessibilityTraits:", UIAccessibilityTraitImage | v6);
  }
  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
