@implementation AEAnnotationPopoverViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AEAnnotationPopoverViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AEAnnotationPopoverViewControllerAccessibility;
  -[AEAnnotationPopoverViewControllerAccessibility viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("view")));
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("view")));
  objc_msgSend(v4, "imaxSetIdentification:", CFSTR("AENoteWindow"));

}

- (void)didHide
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AEAnnotationPopoverViewControllerAccessibility;
  -[AEAnnotationPopoverViewControllerAccessibility didHide](&v2, "didHide");
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

@end
