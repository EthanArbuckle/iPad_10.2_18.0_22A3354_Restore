@implementation THWPageControlRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("page.control"));
}

- (id)accessibilityValue
{
  id v3;
  id v4;

  v3 = TSAccessibilityLocalizedUnsignedInteger((uint64_t)-[THWPageControlRepAccessibility thaxCurrentPage](self, "thaxCurrentPage") + 1);
  v4 = TSAccessibilityLocalizedUnsignedInteger(-[THWPageControlRepAccessibility thaxNumberOfPages](self, "thaxNumberOfPages"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", THAccessibilityLocalizedString((uint64_t)CFSTR("page.control.value.format %@ %@")), v3, v4);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
  -[THWPageControlRepAccessibility thaxIncrementPage](self, "thaxIncrementPage");
}

- (void)accessibilityDecrement
{
  -[THWPageControlRepAccessibility thaxDecrementPage](self, "thaxDecrementPage");
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPageControlRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (unint64_t)thaxCurrentPage
{
  return (unint64_t)-[THTSDLayoutAccessibility tsaxUnsignedIntegerValueForKey:](-[THTSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("currentPage"));
}

- (unint64_t)thaxNumberOfPages
{
  return (unint64_t)-[THTSDLayoutAccessibility tsaxUnsignedIntegerValueForKey:](-[THTSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("numberOfPages"));
}

- (BOOL)thaxIncrementPage
{
  return -[THWPageControlRepAccessibility _thaxSelectPageAtIndex:](self, "_thaxSelectPageAtIndex:", (char *)-[THWPageControlRepAccessibility thaxCurrentPage](self, "thaxCurrentPage") + 1);
}

- (BOOL)thaxDecrementPage
{
  return -[THWPageControlRepAccessibility _thaxSelectPageAtIndex:](self, "_thaxSelectPageAtIndex:", (char *)-[THWPageControlRepAccessibility thaxCurrentPage](self, "thaxCurrentPage") - 1);
}

- (BOOL)_thaxSelectPageAtIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[6];

  v5 = -[THWPageControlRepAccessibility thaxNumberOfPages](self, "thaxNumberOfPages");
  if (v5 - 1 >= a3)
    v6 = a3;
  else
    v6 = v5 - 1;
  v7 = -[THWPageControlRepAccessibility thaxCurrentPage](self, "thaxCurrentPage");
  if (v7 != v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_26C000;
    v9[3] = &unk_427240;
    v9[4] = self;
    v9[5] = v6;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v9))
      abort();
  }
  return v7 != v6;
}

@end
