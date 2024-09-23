@implementation THWebAccessibilityObjectWrapper

+ (id)tsaxTargetClassName
{
  return CFSTR("WebAccessibilityObjectWrapper");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_thaxBookViewController
{
  return objc_msgSend(objc_msgSend(-[UIApplication tsaxValueForKey:](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "tsaxValueForKey:", CFSTR("delegate")), "tsaxValueForKey:", CFSTR("bookController")), "tsaxValueForKey:", CFSTR("existingViewController"));
}

- (id)accessibilityLanguage
{
  id v3;
  Class v4;
  objc_super v6;

  v3 = -[THWebAccessibilityObjectWrapper _thaxBookViewController](self, "_thaxBookViewController");
  v4 = NSClassFromString(CFSTR("THBookViewController"));
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    return +[NSLocale canonicalLanguageIdentifierFromString:](NSLocale, "canonicalLanguageIdentifierFromString:", objc_msgSend(objc_msgSend(v3, "tsaxValueForKey:", CFSTR("bookDescription")), "tsaxValueForKey:", CFSTR("language")));
  v6.receiver = self;
  v6.super_class = (Class)THWebAccessibilityObjectWrapper;
  return -[THWebAccessibilityObjectWrapper accessibilityLanguage](&v6, "accessibilityLanguage");
}

@end
