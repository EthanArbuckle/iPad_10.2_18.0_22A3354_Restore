@implementation TSKPageControlAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKPageControl");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSKPageControlAccessibilityValueDescriptionDelegate)tsaxValueDescriptionDelegate
{
  return (TSKPageControlAccessibilityValueDescriptionDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_5439B0);
}

- (void)tsaxSetValueDescriptionDelegate:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_5439B0, a3);
}

- (void)_axMoveToPage:(int64_t)a3
{
  uint64_t v5;

  if ((objc_opt_respondsToSelector(self, "setCurrentPage:") & 1) != 0)
  {
    -[TSKPageControlAccessibility setCurrentPage:](self, "setCurrentPage:", a3);
    v5 = objc_opt_class(UIControl);
    if ((objc_opt_isKindOfClass(self, v5) & 1) != 0)
    {
      -[TSKPageControlAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
      -[TSKPageControlAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
      -[TSKPageControlAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
    }
  }
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKPageControlAccessibility;
  return UIAccessibilityTraitAdjustable | -[TSKPageControlAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

- (void)accessibilityIncrement
{
  char *v3;

  v3 = (char *)-[TSKPageControlAccessibility tsaxIntegerValueForKey:](self, "tsaxIntegerValueForKey:", CFSTR("currentPage"));
  if ((uint64_t)v3 < (uint64_t)((char *)-[TSKPageControlAccessibility tsaxIntegerValueForKey:](self, "tsaxIntegerValueForKey:", CFSTR("numberOfPages"))- 1))-[TSKPageControlAccessibility _axMoveToPage:](self, "_axMoveToPage:", v3 + 1);
}

- (void)accessibilityDecrement
{
  char *v3;

  v3 = (char *)-[TSKPageControlAccessibility tsaxIntegerValueForKey:](self, "tsaxIntegerValueForKey:", CFSTR("currentPage"));
  if ((uint64_t)v3 >= 1)
    -[TSKPageControlAccessibility _axMoveToPage:](self, "_axMoveToPage:", v3 - 1);
}

- (id)accessibilityValue
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TSKPageControlAccessibilityValueDescriptionDelegate *v7;
  id result;
  NSString *v9;
  id v10;

  v3 = (uint64_t)-[TSKPageControlAccessibility tsaxIntegerValueForKey:](self, "tsaxIntegerValueForKey:", CFSTR("currentPage"));
  v4 = v3 & ~(v3 >> 63);
  v5 = (uint64_t)-[TSKPageControlAccessibility tsaxIntegerValueForKey:](self, "tsaxIntegerValueForKey:", CFSTR("numberOfPages"));
  v6 = v5 & ~(v5 >> 63);
  v7 = -[TSKPageControlAccessibility tsaxValueDescriptionDelegate](self, "tsaxValueDescriptionDelegate");
  if ((objc_opt_respondsToSelector(v7, "tsaxValueForPageControl:pageIndex:numberOfPages:") & 1) == 0
    || (result = -[TSKPageControlAccessibilityValueDescriptionDelegate tsaxValueForPageControl:pageIndex:numberOfPages:](v7, "tsaxValueForPageControl:pageIndex:numberOfPages:", self, v4, v6)) == 0)
  {
    v9 = TSAccessibilityLocalizedString((uint64_t)CFSTR("page.number.of.number %@ %@"));
    v10 = TSAccessibilityLocalizedUnsignedInteger(v4 + 1);
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10, TSAccessibilityLocalizedUnsignedInteger(v6));
  }
  return result;
}

@end
