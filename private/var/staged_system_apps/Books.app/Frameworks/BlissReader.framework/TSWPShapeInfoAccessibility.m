@implementation TSWPShapeInfoAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPShapeInfo");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDDrawableInfoAccessibility, a2);
}

- (NSString)tsaxShapeString
{
  return -[TSWPStorageAccessibility tsaxString](-[TSWPShapeInfoAccessibility tsaxContainedStorage](self, "tsaxContainedStorage"), "tsaxString");
}

- (BOOL)tsaxIsTextBox
{
  return -[TSWPShapeInfoAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isTextBox"));
}

- (TSWPStorageAccessibility)tsaxContainedStorage
{
  void *v3;
  TSWPStorageAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPStorageAccessibility);
  result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPShapeInfoAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("containedStorage")), 1, &v5);
  if (v5)
    abort();
  return result;
}

+ (void)p_bootstrapShapePresetsInTheme:(id)a3 alternate:(int64_t)a4
{
  id v5;
  id v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  id v12;
  char *v13;
  char *v14;
  char *v15;
  char *i;
  id v17;
  objc_super v18;

  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___TSWPShapeInfoAccessibility;
  objc_msgSendSuper2(&v18, "p_bootstrapShapePresetsInTheme:alternate:", a3, a4);
  if ((objc_opt_respondsToSelector(a3, "presetsOfKind:") & 1) != 0)
  {
    v5 = objc_msgSend(a3, "presetsOfKind:", String);
    v6 = objc_alloc((Class)NSArray);
    v7 = TSAccessibilityLocalizedString((uint64_t)CFSTR("darkBlueGradient"));
    v8 = TSAccessibilityLocalizedString((uint64_t)CFSTR("lightBlue"));
    v9 = TSAccessibilityLocalizedString((uint64_t)CFSTR("darkGreenGradient"));
    v10 = TSAccessibilityLocalizedString((uint64_t)CFSTR("purple"));
    v11 = TSAccessibilityLocalizedString((uint64_t)CFSTR("grayGradient"));
    v12 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, TSAccessibilityLocalizedString((uint64_t)CFSTR("Red")), 0);
    v13 = (char *)objc_msgSend(v5, "count");
    v14 = (char *)objc_msgSend(v12, "count");
    if (v13)
    {
      v15 = v14;
      for (i = 0; i != v13; ++i)
      {
        v17 = objc_msgSend(v5, "objectAtIndex:", i);
        if (i < v15)
          objc_msgSend(v17, "setAccessibilityLabel:", objc_msgSend(v12, "objectAtIndex:", i));
      }
    }

  }
}

@end
