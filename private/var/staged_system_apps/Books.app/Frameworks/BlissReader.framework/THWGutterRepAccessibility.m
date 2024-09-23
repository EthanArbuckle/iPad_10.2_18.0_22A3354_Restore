@implementation THWGutterRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWGutterRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDContainerRepAccessibility, a2);
}

- (NSString)tsaxLabel
{
  return -[THWGutterInfoAccessibility thaxAuthorProvidedDescription](-[THWGutterRepAccessibility tsaxInfo](self, "tsaxInfo"), "thaxAuthorProvidedDescription");
}

- (THWGutterInfoAccessibility)tsaxInfo
{
  void *v3;
  id v4;
  THWGutterInfoAccessibility *result;
  objc_super v6;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(THWGutterInfoAccessibility);
  v6.receiver = self;
  v6.super_class = (Class)THWGutterRepAccessibility;
  v4 = -[TSDRepAccessibility tsaxInfo](&v6, "tsaxInfo");
  result = (THWGutterInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7)
    abort();
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  Class v4;
  char v6;

  v6 = 0;
  v3 = (void *)objc_opt_class(THWGutterInfoAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWGutterRepAccessibility tsaxInfo](self, "tsaxInfo"), 1, &v6);
  if (v6)
    abort();
  return objc_msgSend(objc_msgSend(-[objc_class thaxTitleShape](v4, "thaxTitleShape"), "tsaxContainedStorage"), "tsaxString");
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString((uint64_t)CFSTR("widgets.gutter.rep.hint.iOS"));
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  objc_msgSend(-[THWGutterRepAccessibility _thaxPressableHandler](self, "_thaxPressableHandler"), "thaxInvokeAction");
  return 1;
}

- (id)_thaxPressableHandler
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPressableRepGestureTargetHandlerAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("pressableHandler")), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
