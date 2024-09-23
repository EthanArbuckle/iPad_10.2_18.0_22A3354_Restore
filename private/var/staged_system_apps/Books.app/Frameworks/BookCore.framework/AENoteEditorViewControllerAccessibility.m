@implementation AENoteEditorViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AENoteEditorViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AENoteEditorViewControllerAccessibility;
  -[AENoteEditorViewControllerAccessibility viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("textView")));
  v4 = IMAXLocString(CFSTR("annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AENoteEditorViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("delegate")));
  objc_msgSend(v3, "imaxSetParentAnnotationPopoverViewController:", v6);

}

@end
