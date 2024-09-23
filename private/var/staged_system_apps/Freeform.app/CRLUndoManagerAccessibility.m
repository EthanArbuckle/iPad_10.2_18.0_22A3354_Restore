@implementation CRLUndoManagerAccessibility

- (void)crlaxDidUndo
{
  UIAccessibilityNotifications v2;
  NSString *UIKitLocalizedString;
  id v4;

  v2 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = CRLAccessibilityGetUIKitLocalizedString((uint64_t)CFSTR("AXTextOperationActionUndo"));
  v4 = (id)objc_claimAutoreleasedReturnValue(UIKitLocalizedString);
  UIAccessibilityPostNotification(v2, v4);

}

- (void)crlaxDidRedo
{
  UIAccessibilityNotifications v2;
  NSString *UIKitLocalizedString;
  id v4;

  v2 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = CRLAccessibilityGetUIKitLocalizedString((uint64_t)CFSTR("AXTextOperationActionRedo"));
  v4 = (id)objc_claimAutoreleasedReturnValue(UIKitLocalizedString);
  UIAccessibilityPostNotification(v2, v4);

}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLUndoManager");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLUndoManagerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)_crlaxIsPerformingUndoOrRedo
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415058);
}

- (void)_crlaxSetPerformingUndoOrRedo:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415058, a3);
}

- (BOOL)crlaxIsPerformingUndoOrRedo
{
  return -[CRLUndoManagerAccessibility _crlaxIsPerformingUndoOrRedo](self, "_crlaxIsPerformingUndoOrRedo");
}

- (void)undo
{
  _BOOL8 v3;
  objc_super v4;

  v3 = -[CRLUndoManagerAccessibility crlaxIsPerformingUndoOrRedo](self, "crlaxIsPerformingUndoOrRedo");
  -[CRLUndoManagerAccessibility _crlaxSetPerformingUndoOrRedo:](self, "_crlaxSetPerformingUndoOrRedo:", 1);
  v4.receiver = self;
  v4.super_class = (Class)CRLUndoManagerAccessibility;
  -[CRLUndoManagerAccessibility undo](&v4, "undo");
  -[CRLUndoManagerAccessibility _crlaxSetPerformingUndoOrRedo:](self, "_crlaxSetPerformingUndoOrRedo:", v3);
  if (-[CRLUndoManagerAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxDidUndo", &OBJC_PROTOCOL___CRLUndoManagerAccessibilityExtras))-[CRLUndoManagerAccessibility crlaxDidUndo](self, "crlaxDidUndo");
}

- (void)redo
{
  _BOOL8 v3;
  objc_super v4;

  v3 = -[CRLUndoManagerAccessibility crlaxIsPerformingUndoOrRedo](self, "crlaxIsPerformingUndoOrRedo");
  -[CRLUndoManagerAccessibility _crlaxSetPerformingUndoOrRedo:](self, "_crlaxSetPerformingUndoOrRedo:", 1);
  v4.receiver = self;
  v4.super_class = (Class)CRLUndoManagerAccessibility;
  -[CRLUndoManagerAccessibility redo](&v4, "redo");
  -[CRLUndoManagerAccessibility _crlaxSetPerformingUndoOrRedo:](self, "_crlaxSetPerformingUndoOrRedo:", v3);
  if (-[CRLUndoManagerAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxDidRedo", &OBJC_PROTOCOL___CRLUndoManagerAccessibilityExtras))-[CRLUndoManagerAccessibility crlaxDidRedo](self, "crlaxDidRedo");
}

@end
