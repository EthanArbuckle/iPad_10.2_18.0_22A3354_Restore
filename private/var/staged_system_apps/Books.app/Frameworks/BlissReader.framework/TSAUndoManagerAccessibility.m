@implementation TSAUndoManagerAccessibility

- (void)tsaxDidUndo
{
  UIAccessibilityNotifications v2;
  NSString *UIKitLocalizedString;

  v2 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString((uint64_t)CFSTR("AXTextOperationActionUndo"));
  UIAccessibilityPostNotification(v2, UIKitLocalizedString);
}

- (void)tsaxDidRedo
{
  UIAccessibilityNotifications v2;
  NSString *UIKitLocalizedString;

  v2 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString((uint64_t)CFSTR("AXTextOperationActionRedo"));
  UIAccessibilityPostNotification(v2, UIKitLocalizedString);
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSAUndoManager");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxIsPerformingUndoOrRedo
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543895);
}

- (void)_tsaxSetPerformingUndoOrRedo:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543895, a3);
}

- (BOOL)tsaxIsPerformingUndoOrRedo
{
  return -[TSAUndoManagerAccessibility _tsaxIsPerformingUndoOrRedo](self, "_tsaxIsPerformingUndoOrRedo");
}

- (void)undo
{
  _BOOL8 v3;
  objc_super v4;

  v3 = -[TSAUndoManagerAccessibility tsaxIsPerformingUndoOrRedo](self, "tsaxIsPerformingUndoOrRedo");
  -[TSAUndoManagerAccessibility _tsaxSetPerformingUndoOrRedo:](self, "_tsaxSetPerformingUndoOrRedo:", 1);
  v4.receiver = self;
  v4.super_class = (Class)TSAUndoManagerAccessibility;
  -[TSAUndoManagerAccessibility undo](&v4, "undo");
  -[TSAUndoManagerAccessibility _tsaxSetPerformingUndoOrRedo:](self, "_tsaxSetPerformingUndoOrRedo:", v3);
  if (-[TSAUndoManagerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidUndo", &OBJC_PROTOCOL___TSAUndoManagerAccessibilityExtras))-[TSAUndoManagerAccessibility tsaxDidUndo](self, "tsaxDidUndo");
}

- (void)redo
{
  _BOOL8 v3;
  objc_super v4;

  v3 = -[TSAUndoManagerAccessibility tsaxIsPerformingUndoOrRedo](self, "tsaxIsPerformingUndoOrRedo");
  -[TSAUndoManagerAccessibility _tsaxSetPerformingUndoOrRedo:](self, "_tsaxSetPerformingUndoOrRedo:", 1);
  v4.receiver = self;
  v4.super_class = (Class)TSAUndoManagerAccessibility;
  -[TSAUndoManagerAccessibility redo](&v4, "redo");
  -[TSAUndoManagerAccessibility _tsaxSetPerformingUndoOrRedo:](self, "_tsaxSetPerformingUndoOrRedo:", v3);
  if (-[TSAUndoManagerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidRedo", &OBJC_PROTOCOL___TSAUndoManagerAccessibilityExtras))-[TSAUndoManagerAccessibility tsaxDidRedo](self, "tsaxDidRedo");
}

@end
