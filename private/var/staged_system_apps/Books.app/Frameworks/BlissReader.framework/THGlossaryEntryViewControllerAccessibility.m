@implementation THGlossaryEntryViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THGlossaryEntryViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)loadView
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryEntryViewControllerAccessibility;
  -[THGlossaryEntryViewControllerAccessibility loadView](&v4, "loadView");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_265BC0;
  v3[3] = &unk_426DD0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

@end
