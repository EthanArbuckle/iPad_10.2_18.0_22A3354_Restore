@implementation THPageNumberViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THPageNumberView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)setPageNumberText:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THPageNumberViewAccessibility;
  -[THPageNumberViewAccessibility setPageNumberText:](&v5, "setPageNumberText:");
  objc_msgSend(-[THPageNumberViewAccessibility _thaxLabel](self, "_thaxLabel"), "setAccessibilityLabel:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("page.number %@")), a3));
}

- (void)p_updatePageString
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THPageNumberViewAccessibility;
  -[THPageNumberViewAccessibility p_updatePageString](&v4, "p_updatePageString");
  if (-[THPageNumberViewAccessibility _thaxMode](self, "_thaxMode") == 1)
  {
    v3 = -[THPageNumberViewAccessibility _thaxLabel](self, "_thaxLabel");
    objc_msgSend(v3, "setAccessibilityLabel:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("page.number %@")), objc_msgSend(v3, "text")));
  }
}

- (id)_thaxLabel
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UILabel);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THPageNumberViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("label")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (int)_thaxMode
{
  return -[THPageNumberViewAccessibility tsaxIntValueForKey:](self, "tsaxIntValueForKey:", CFSTR("mode"));
}

@end
