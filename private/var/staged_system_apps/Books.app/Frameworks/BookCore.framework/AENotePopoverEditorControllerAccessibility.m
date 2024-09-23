@implementation AENotePopoverEditorControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("AENotePopoverEditorController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (void)_axClearReferencesToSelfInButtons
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AENotePopoverEditorControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("noteEditorViewController")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imaxValueForKey:", CFSTR("textView")));
  objc_msgSend(v2, "imaxSetParentAnnotationPopoverViewController:", 0);

}

- (void)dealloc
{
  objc_super v3;

  -[AENotePopoverEditorControllerAccessibility _axClearReferencesToSelfInButtons](self, "_axClearReferencesToSelfInButtons");
  v3.receiver = self;
  v3.super_class = (Class)AENotePopoverEditorControllerAccessibility;
  -[AENotePopoverEditorControllerAccessibility dealloc](&v3, "dealloc");
}

@end
