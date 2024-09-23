@implementation THFlowBodyRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THFlowBodyRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)_accessibilityScrollLeftPage
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_265754;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
  UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, &stru_43D7D8);
}

@end
