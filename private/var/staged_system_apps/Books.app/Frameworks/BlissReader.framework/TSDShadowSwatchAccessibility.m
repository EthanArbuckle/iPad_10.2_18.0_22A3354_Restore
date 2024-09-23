@implementation TSDShadowSwatchAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDShadowSwatch");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_tsaxLocalizedNumberForKey:(id)a3 withShadow:(id)a4
{
  return -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:isPercentage:](self, "_tsaxLocalizedNumberForKey:withShadow:isPercentage:", a3, a4, 0);
}

- (id)_tsaxLocalizedNumberForKey:(id)a3 withShadow:(id)a4 isPercentage:(BOOL)a5
{
  double v6;

  objc_msgSend(a4, "tsaxCGFloatValueForKey:", a3);
  if (a5)
    return TSAccessibilityLocalizedPercent();
  else
    return TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(v6)));
}

- (id)accessibilityLabel
{
  id v3;

  v3 = -[TSDShadowSwatchAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("shadow"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("shadow.formatter %@ %@ %@ %@")), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:](self, "_tsaxLocalizedNumberForKey:withShadow:", CFSTR("angle"), v3), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:](self, "_tsaxLocalizedNumberForKey:withShadow:", CFSTR("offset"), v3), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:](self, "_tsaxLocalizedNumberForKey:withShadow:", CFSTR("radius"), v3), -[TSDShadowSwatchAccessibility _tsaxLocalizedNumberForKey:withShadow:isPercentage:](
             self,
             "_tsaxLocalizedNumberForKey:withShadow:isPercentage:",
             CFSTR("opacity"),
             v3,
             1));
}

@end
