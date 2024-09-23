@implementation TSUIApplicationAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIApplication");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  id v3;
  objc_super v5;

  v3 = -[TSUIApplicationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
  if ((objc_opt_respondsToSelector(v3, "applicationName") & 1) != 0)
    return objc_msgSend(v3, "tsaxValueForKey:", CFSTR("applicationName"));
  v5.receiver = self;
  v5.super_class = (Class)TSUIApplicationAccessibility;
  return -[TSUIApplicationAccessibility accessibilityLabel](&v5, "accessibilityLabel");
}

- (id)_accessibilityElementFirst:(BOOL)a3 last:(BOOL)a4 forFocus:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  TSAccessibility *v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (!a3)
    goto LABEL_8;
  v9 = +[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance");
  if (!v5)
  {
    v10 = -[TSAccessibility _firstElementForUpcomingPageTurn](v9, "_firstElementForUpcomingPageTurn");
    if (v10)
      goto LABEL_6;
    v9 = +[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance");
  }
  v10 = -[TSAccessibility _firstElementForUpcomingScreenChange](v9, "_firstElementForUpcomingScreenChange");
  if (!v10)
  {
LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)TSUIApplicationAccessibility;
    return -[TSUIApplicationAccessibility _accessibilityElementFirst:last:forFocus:](&v14, "_accessibilityElementFirst:last:forFocus:", v7, v6, v5);
  }
LABEL_6:
  v11 = objc_msgSend(v10, "tsaxAncestorView");
  if (!v11)
    goto LABEL_8;
  v12 = objc_msgSend(v11, "tsaxViewAncestorOfType:", objc_opt_class(UIWindow));
  if (v12 != -[TSUIApplicationAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_accessibilityMainWindow")))goto LABEL_8;
  return v10;
}

@end
