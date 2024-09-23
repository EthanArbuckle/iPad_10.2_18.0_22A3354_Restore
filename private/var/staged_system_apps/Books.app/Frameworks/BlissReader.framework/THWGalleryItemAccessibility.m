@implementation THWGalleryItemAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWGalleryItem");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)thaxDescription
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[THWGalleryItemAccessibility _thaxAuthorProvidedAccessibilityDescription](self, "_thaxAuthorProvidedAccessibilityDescription");
  v4 = -[TSWPStorageAccessibility tsaxString](-[THWGalleryItemAccessibility _thaxCaptionStorage](self, "_thaxCaptionStorage"), "tsaxString");
  if (-[NSString isEqualToString:](v3, "isEqualToString:", v4))
    return v3;
  else
    return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (NSString)_thaxAuthorProvidedAccessibilityDescription
{
  objc_class *v3;
  void *v4;
  char v6;

  v6 = 0;
  v3 = (objc_class *)objc_opt_class(NSDictionary);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THWGalleryItemAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityDescriptions")), 1, &v6);
  if (v6)
    abort();
  return (NSString *)objc_msgSend(v4, "objectForKey:", CFSTR("alternateText"));
}

- (TSWPStorageAccessibility)_thaxCaptionStorage
{
  void *v3;
  TSWPStorageAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPStorageAccessibility);
  result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWGalleryItemAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("captionStorage")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
