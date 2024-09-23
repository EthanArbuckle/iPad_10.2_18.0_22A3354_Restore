@implementation THWReviewDraggablePlacardRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWReviewDraggablePlacardRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (unint64_t)thaxIndex
{
  return (unint64_t)-[THTSDLayoutAccessibility tsaxUnsignedIntegerValueForKey:](-[THTSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxUnsignedIntegerValueForKey:", CFSTR("index"));
}

- (THTSWPRepAccessibility)thaxContentTextRep
{
  void *v3;
  THTSWPRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSWPRepAccessibility);
  result = (THTSWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("contentTextRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxContentImageAccessibilityDescription
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THTSDLayoutAccessibility tsaxValueForKey:](-[THTSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxValueForKey:", CFSTR("contentImageAccessibilityDescription")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)thaxIsRepPressable
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  THTSWPRepAccessibility *v3;
  NSString *v5;
  NSString *v6;

  v3 = -[THWReviewDraggablePlacardRepAccessibility thaxContentTextRep](self, "thaxContentTextRep");
  if (v3)
    return -[TSWPStorageAccessibility tsaxString](-[TSWPRepAccessibility tsaxStorage](v3, "tsaxStorage"), "tsaxString");
  v5 = -[THWReviewDraggablePlacardRepAccessibility thaxContentImageAccessibilityDescription](self, "thaxContentImageAccessibilityDescription");
  if (-[NSString length](v5, "length"))
    return v5;
  v6 = THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.review.callout.option.image.label %@"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, TSAccessibilityLocalizedUnsignedInteger((uint64_t)-[THWReviewDraggablePlacardRepAccessibility thaxIndex](self, "thaxIndex") + 1));
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.review.callout.drag.hint.ios"));
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

@end
