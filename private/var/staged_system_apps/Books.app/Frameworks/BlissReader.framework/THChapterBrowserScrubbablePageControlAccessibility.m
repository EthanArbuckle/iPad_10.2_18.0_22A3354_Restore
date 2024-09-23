@implementation THChapterBrowserScrubbablePageControlAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THChapterBrowserScrubbablePageControl");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (THChapterBrowserScrubbablePageControlAccessibilityDelegate)thaxDelegate
{
  return (THChapterBrowserScrubbablePageControlAccessibilityDelegate *)__TSAccessibilityGetAssociatedObject(self, &unk_543A2B);
}

- (void)thaxSetDelegate:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543A2B, a3);
}

- (unint64_t)thaxNumberOfPages
{
  return (unint64_t)-[THChapterBrowserScrubbablePageControlAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("numberOfPages"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (id)accessibilityLabel
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("tableofcontents.page.scrubber.label"));
}

- (id)accessibilityValue
{
  return -[THChapterBrowserScrubbablePageControlAccessibilityDelegate thaxTitleForPageIndex:numberOfPages:](-[THChapterBrowserScrubbablePageControlAccessibility thaxDelegate](self, "thaxDelegate"), "thaxTitleForPageIndex:numberOfPages:", -[THChapterBrowserScrubbablePageControlAccessibility _thaxCurrentPage](self, "_thaxCurrentPage"), -[THChapterBrowserScrubbablePageControlAccessibility thaxNumberOfPages](self, "thaxNumberOfPages"));
}

- (void)accessibilityIncrement
{
  char *v3;
  unint64_t v4;
  _QWORD v5[6];

  v3 = (char *)-[THChapterBrowserScrubbablePageControlAccessibility thaxNumberOfPages](self, "thaxNumberOfPages") - 1;
  v4 = -[THChapterBrowserScrubbablePageControlAccessibility _thaxCurrentPage](self, "_thaxCurrentPage");
  if ((unint64_t)v3 >= v4 + 1)
    v3 = (char *)(v4 + 1);
  if (v3 != (char *)-[THChapterBrowserScrubbablePageControlAccessibility _thaxCurrentPage](self, "_thaxCurrentPage"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_2648B0;
    v5[3] = &unk_427240;
    v5[4] = self;
    v5[5] = v3;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
      abort();
    TSAccessibilityPostLayoutChangedNotification(0);
  }
}

- (void)accessibilityDecrement
{
  char *v3;
  _QWORD v4[6];

  v3 = (char *)-[THChapterBrowserScrubbablePageControlAccessibility _thaxCurrentPage](self, "_thaxCurrentPage") - 1;
  if (v3 != (char *)-[THChapterBrowserScrubbablePageControlAccessibility _thaxCurrentPage](self, "_thaxCurrentPage"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_264944;
    v4[3] = &unk_427240;
    v4[4] = self;
    v4[5] = v3;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
      abort();
    TSAccessibilityPostLayoutChangedNotification(0);
  }
}

- (BOOL)_thaxFirstDotSpecialRendering
{
  return -[THChapterBrowserScrubbablePageControlAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("firstDotSpecialRendering"));
}

- (unint64_t)_thaxCurrentPage
{
  return (unint64_t)-[THChapterBrowserScrubbablePageControlAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("currentPage"));
}

@end
