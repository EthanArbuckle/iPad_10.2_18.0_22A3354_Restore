@implementation TSADocumentManagerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManager");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)openDocumentForInfo:(id)a3 animated:(BOOL)a4
{
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSADocumentManagerAccessibility;
  v4 = -[TSADocumentManagerAccessibility openDocumentForInfo:animated:](&v6, "openDocumentForInfo:animated:", a3, a4);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  return v4;
}

@end
