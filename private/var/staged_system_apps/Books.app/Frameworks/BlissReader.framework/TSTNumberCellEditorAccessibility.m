@implementation TSTNumberCellEditorAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTNumberCellEditor");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)deleteBackward
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSTNumberCellEditorAccessibility;
  -[TSTNumberCellEditorAccessibility deleteBackward](&v2, "deleteBackward");
  UIAccessibilityPostNotification(TSAccessibilityValueChangedNotification, CFSTR("AXValueChangeTypeDelete"));
}

@end
