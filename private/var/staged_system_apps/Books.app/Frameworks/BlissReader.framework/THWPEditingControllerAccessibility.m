@implementation THWPEditingControllerAccessibility

- (BOOL)shouldShowEditMenu
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingControllerAccessibility;
  return -[THWPEditingControllerAccessibility shouldShowEditMenu](&v4, "shouldShowEditMenu");
}

- (BOOL)editorCanHideEditMenu
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)THWPEditingControllerAccessibility;
  return -[THWPEditingControllerAccessibility editorCanHideEditMenu](&v4, "editorCanHideEditMenu");
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPEditingController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPEditingControllerAccessibility, a2);
}

- (BOOL)thaxCanEditTextString
{
  return -[THWPEditingControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("canEditTextString"));
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  objc_super v8;

  if (-[THWPEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxCanPerformEditorAction:withSender:", &OBJC_PROTOCOL___THWPEditingControllerAccessibilityExtras))return -[THWPEditingControllerAccessibility thaxCanPerformEditorAction:withSender:](self, "thaxCanPerformEditorAction:withSender:", a3, a4);
  v8.receiver = self;
  v8.super_class = (Class)THWPEditingControllerAccessibility;
  return -[THWPEditingControllerAccessibility canPerformEditorAction:withSender:](&v8, "canPerformEditorAction:withSender:", a3, a4);
}

- (id)tsaxEditingRepWithCaret
{
  objc_class *v3;
  void *v4;
  char v6;

  v6 = 0;
  v3 = (objc_class *)objc_opt_class(NSSet);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THWPEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editingReps")), 1, &v6);
  if (v6)
    abort();
  return objc_msgSend(v4, "anyObject");
}

@end
