@implementation TSWPRulerMarkerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPRulerMarker");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSWPRulerMarkerControllerAccessibility)tsaxParentRulerMarkerController
{
  return (TSWPRulerMarkerControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_543897);
}

- (void)tsaxSetParentRulerMarkerController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543897, a3);
}

- (NSString)tsaxLabel
{
  unsigned int v2;

  v2 = -[TSWPRulerMarkerAccessibility _tsaxType](self, "_tsaxType");
  if (v2 > 7)
    return 0;
  else
    return TSAccessibilityLocalizedString((uint64_t)off_43BEB0[v2]);
}

- (NSString)tsaxValueWithUnits
{
  id v3;

  -[TSWPRulerMarkerAccessibility tsaxValue](self, "tsaxValue");
  v3 = TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("ruler.formatter.general %@ %@")), v3, -[TSWPRulerMarkerControllerAccessibility tsaxCurrentRulerUnitsDescription](-[TSWPRulerMarkerAccessibility tsaxParentRulerMarkerController](self, "tsaxParentRulerMarkerController"), "tsaxCurrentRulerUnitsDescription"));
}

- (double)tsaxValue
{
  TSWPRulerMarkerControllerAccessibility *v3;
  double v4;
  double result;

  v3 = -[TSWPRulerMarkerAccessibility tsaxParentRulerMarkerController](self, "tsaxParentRulerMarkerController");
  -[TSWPRulerMarkerAccessibility _tsaxModelValue](self, "_tsaxModelValue");
  -[TSWPRulerMarkerControllerAccessibility tsaxEquivalentValueInCurrentRulerUnitsForModelValue:andMarkerType:](v3, "tsaxEquivalentValueInCurrentRulerUnitsForModelValue:andMarkerType:", -[TSWPRulerMarkerAccessibility _tsaxType](self, "_tsaxType"), v4);
  return result;
}

- (double)_tsaxModelValue
{
  double result;

  -[TSWPRulerMarkerAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("modelValue"));
  return result;
}

- (int)_tsaxType
{
  return -[TSWPRulerMarkerAccessibility tsaxUnsignedIntValueForKey:](self, "tsaxUnsignedIntValueForKey:", CFSTR("type"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("ruler.adjustment.hint"));
}

@end
