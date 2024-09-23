@implementation AENoteFullscreenEditorControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AENoteFullscreenEditorController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AENoteFullscreenEditorControllerAccessibility;
  -[AENoteFullscreenEditorControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[AENoteFullscreenEditorControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AENoteFullscreenEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("textView")));
  v2 = AEAXLocString(CFSTR("note.text.view.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

@end
