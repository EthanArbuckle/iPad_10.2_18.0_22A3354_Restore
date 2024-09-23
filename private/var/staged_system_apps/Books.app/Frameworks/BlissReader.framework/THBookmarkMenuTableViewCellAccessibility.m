@implementation THBookmarkMenuTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THBookmarkMenuTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  NSString *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (NSString *)objc_msgSend(-[THBookmarkMenuTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pageNumberLabel")), "tsaxValueForKey:", CFSTR("text"));
  if (-[NSString length](v3, "length"))
    v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("page.number %@")), v3);
  v4 = objc_msgSend(-[THBookmarkMenuTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bookmarkTitleLabel")), "tsaxValueForKey:", CFSTR("text"));
  return __TSAccessibilityStringForVariables(1, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THBookmarkMenuTableViewCellAccessibility;
  return UIAccessibilityTraitStartsMediaSession | -[THBookmarkMenuTableViewCellAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

@end
