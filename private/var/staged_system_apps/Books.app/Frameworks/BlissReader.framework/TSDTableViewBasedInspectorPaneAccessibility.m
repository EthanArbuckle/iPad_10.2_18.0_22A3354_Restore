@implementation TSDTableViewBasedInspectorPaneAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDTableViewBasedInspectorPane");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)checkableImageCellOfClass:(Class)a3 withImage:(id)a4 showsCheckboxOnRight:(BOOL)a5
{
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDTableViewBasedInspectorPaneAccessibility;
  v6 = -[TSDTableViewBasedInspectorPaneAccessibility checkableImageCellOfClass:withImage:showsCheckboxOnRight:](&v8, "checkableImageCellOfClass:withImage:showsCheckboxOnRight:", a3, a4, a5);
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityLabel:", objc_msgSend(a4, "accessibilityLabel"));
  return v6;
}

@end
