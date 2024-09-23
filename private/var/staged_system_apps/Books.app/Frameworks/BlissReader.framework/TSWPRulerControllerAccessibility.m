@implementation TSWPRulerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPRulerController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (double)tsaxPointValueForNumberOfTicks:(int64_t)a3
{
  double v4;

  -[TSWPRulerControllerAccessibility _tsaxTickFrameSpacing](self, "_tsaxTickFrameSpacing");
  return v4 * (double)a3;
}

- (NSArray)tsaxMarkerLayers
{
  return (NSArray *)objc_msgSend(-[TSWPRulerControllerAccessibility _tsaxRulerMarkerController](self, "_tsaxRulerMarkerController"), "tsaxMarkerLayers");
}

- (double)tsaxEquivalentValueInCurrentRulerUnitsForModelValue:(double)a3
{
  double result;

  objc_msgSend(-[TSWPRulerControllerAccessibility _tsaxRulerUnitsInstance](self, "_tsaxRulerUnitsInstance"), "tsaxConvertPointsToRulerUnits:", a3);
  return result;
}

- (NSString)tsaxCurrentRulerUnitsDescription
{
  return (NSString *)objc_msgSend(-[TSWPRulerControllerAccessibility _tsaxRulerUnitsInstance](self, "_tsaxRulerUnitsInstance"), "tsaxLocalizedCompatibleRulerUnitsForCanvas");
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(-[TSWPRulerControllerAccessibility _tsaxRulerMarkerController](self, "_tsaxRulerMarkerController"), "tsaxSetParentRulerController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPRulerControllerAccessibility;
  -[TSWPRulerControllerAccessibility dealloc](&v3, "dealloc");
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPRulerControllerAccessibility;
  -[TSWPRulerControllerAccessibility setInteractiveCanvasController:](&v4, "setInteractiveCanvasController:", a3);
  -[TSWPRulerControllerAccessibility _tsaxSetupRulerController](self, "_tsaxSetupRulerController");
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPRulerControllerAccessibility;
  -[TSWPRulerControllerAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[TSWPRulerControllerAccessibility _tsaxSetupRulerController](self, "_tsaxSetupRulerController");
}

- (void)_tsaxSetupRulerController
{
  objc_msgSend(-[TSWPRulerControllerAccessibility _tsaxRulerMarkerController](self, "_tsaxRulerMarkerController"), "tsaxSetParentRulerController:", self);
}

- (double)_tsaxTickFrameSpacing
{
  double result;

  -[TSWPRulerControllerAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("tickFrameSpacing"));
  return result;
}

- (id)_tsaxRulerUnitsInstance
{
  Class v2;
  void *v3;
  id result;
  char v5;

  v2 = NSClassFromString(CFSTR("TSKRulerUnits"));
  v5 = 0;
  v3 = (void *)objc_opt_class(TSKRulerUnitsAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[objc_class tsaxValueForKey:](v2, "tsaxValueForKey:", CFSTR("instance")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_tsaxRulerMarkerController
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPRulerMarkerControllerAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPRulerControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rulerMarkerController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
