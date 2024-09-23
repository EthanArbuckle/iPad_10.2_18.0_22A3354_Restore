@implementation TSWPEditMenuControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPEditMenuController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)tsaxAllowsMenuVisible
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5439B5);
}

- (void)tsaxSetAllowsMenuVisible:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5439B5, a3);
}

- (void)p_setMenuVisible:(id)a3
{
  objc_super v5;

  if (!UIAccessibilityIsVoiceOverRunning()
    || !objc_msgSend(a3, "BOOLValue")
    || -[TSWPEditMenuControllerAccessibility tsaxAllowsMenuVisible](self, "tsaxAllowsMenuVisible"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TSWPEditMenuControllerAccessibility;
    -[TSWPEditMenuControllerAccessibility p_setMenuVisible:](&v5, "p_setMenuVisible:", a3);
  }
}

@end
