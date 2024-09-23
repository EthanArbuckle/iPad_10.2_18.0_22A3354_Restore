@implementation THDisplaySettingsViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THDisplaySettingsViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  dispatch_time_t v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THDisplaySettingsViewControllerAccessibility;
  -[THDisplaySettingsViewControllerAccessibility viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = objc_msgSend(objc_msgSend(-[THDisplaySettingsViewControllerAccessibility view](self, "view"), "_accessibilityLeafDescendantsWithOptions:", +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions")), "firstObject");
  v5 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_26D9A4;
  block[3] = &unk_426DD0;
  block[4] = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
