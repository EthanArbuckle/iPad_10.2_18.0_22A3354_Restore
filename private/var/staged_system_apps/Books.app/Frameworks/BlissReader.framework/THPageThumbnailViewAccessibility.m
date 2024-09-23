@implementation THPageThumbnailViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THPageThumbnailView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxLocalizedPageNumber
{
  return -[UILabel text](-[THPageThumbnailViewAccessibility _thaxPageNumberLabel](self, "_thaxPageNumberLabel"), "text");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  NSString *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[THPageThumbnailViewAccessibility thaxLocalizedPageNumber](self, "thaxLocalizedPageNumber");
  if (-[NSString length](v3, "length"))
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("page.number %@")), v3);
  else
    v4 = 0;
  if (!-[THPageThumbnailViewAccessibility _thaxIsFirstThumbnail](self, "_thaxIsFirstThumbnail"))
    return v4;
  v5 = THAccessibilityLocalizedString((uint64_t)CFSTR("chapter.first.page"));
  return __TSAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THPageThumbnailViewAccessibility;
  v3 = -[THPageThumbnailViewAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[THPageThumbnailViewAccessibility _thaxIsCurrentPage](self, "_thaxIsCurrentPage");
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)_thaxIsCurrentPage
{
  return objc_msgSend(-[THPageThumbnailViewAccessibility _thaxPageNumberView](self, "_thaxPageNumberView"), "tsaxBoolValueForKey:", CFSTR("isCurrentPage"));
}

- (BOOL)_thaxIsFirstThumbnail
{
  return -[THPageThumbnailViewAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("pageIndex")) == 0;
}

- (UILabel)_thaxPageNumberLabel
{
  objc_class *v3;
  UILabel *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  result = (UILabel *)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(-[THPageThumbnailViewAccessibility _thaxPageNumberView](self, "_thaxPageNumberView"), "tsaxValueForKey:", CFSTR("label")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxPageNumberView
{
  return -[THPageThumbnailViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mPageNumberView"));
}

@end
