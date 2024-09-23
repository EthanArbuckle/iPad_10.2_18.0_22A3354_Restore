@implementation TSWPShapeRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPShapeRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDShapeRepAccessibility, a2);
}

- (NSString)tsaxShapeString
{
  return -[TSWPShapeInfoAccessibility tsaxShapeString](-[TSWPShapeRepAccessibility tsaxInfo](self, "tsaxInfo"), "tsaxShapeString");
}

- (TSWPShapeInfoAccessibility)tsaxInfo
{
  void *v3;
  TSWPShapeInfoAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPShapeInfoAccessibility);
  result = (TSWPShapeInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("info")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)tsaxPlaceholderDescription
{
  return 0;
}

- (TSWPRepAccessibility)tsaxContainedRep
{
  void *v3;
  TSWPRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPRepAccessibility);
  result = (TSWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("containedRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)willBeginEditingContainedRep
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeRepAccessibility;
  -[TSWPShapeRepAccessibility willBeginEditingContainedRep](&v3, "willBeginEditingContainedRep");
  if (-[TSWPShapeRepAccessibility tsaxRespondsToSelector:fromOptionalExtrasProtocol:](self, "tsaxRespondsToSelector:fromOptionalExtrasProtocol:", "tsaxShapeRepWillBeginEditingContainedRep:", &OBJC_PROTOCOL___TSWPShapeRepAccessibilityExtas))-[TSWPShapeRepAccessibility tsaxShapeRepWillBeginEditingContainedRep:](self, "tsaxShapeRepWillBeginEditingContainedRep:", self);
}

- (id)tsaxSummaryDescription
{
  NSString *v3;
  NSString *v4;

  if (-[TSWPShapeInfoAccessibility tsaxIsTextBox](-[TSWPShapeRepAccessibility tsaxInfo](self, "tsaxInfo"), "tsaxIsTextBox"))
  {
    v3 = TSAccessibilityLocalizedString((uint64_t)CFSTR("rep.summary.textbox.formatter %@"));
    v4 = -[TSWPRepAccessibility tsaxSummaryDescription](-[TSWPShapeRepAccessibility tsaxContainedRep](self, "tsaxContainedRep"), "tsaxSummaryDescription");
  }
  else
  {
    v3 = TSAccessibilityLocalizedString((uint64_t)CFSTR("rep.summary.shape.formatter %@"));
    v4 = -[TSDShapeRepAccessibility tsaxShapeTypeDescription](self, "tsaxShapeTypeDescription");
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v4);
}

- (BOOL)tsaxIsIgnored
{
  return 1;
}

- (id)tsaxFocusedElement
{
  void *v3;
  id result;
  objc_super v5;
  char v6;

  v6 = 0;
  v3 = (void *)objc_opt_class(TSWPRepAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("containedRep")), 1, &v6);
  if (v6)
    abort();
  if (!result)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSWPShapeRepAccessibility;
    return -[TSDRepAccessibility tsaxFocusedElement](&v5, "tsaxFocusedElement");
  }
  return result;
}

@end
