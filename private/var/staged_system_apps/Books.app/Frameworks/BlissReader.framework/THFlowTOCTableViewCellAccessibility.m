@implementation THFlowTOCTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THFlowTOCTableViewCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)p_setupContentView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCTableViewCellAccessibility;
  -[THFlowTOCTableViewCellAccessibility p_setupContentView](&v3, "p_setupContentView");
  objc_msgSend(-[THFlowTOCTableViewCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("openCloseButton")), "setAccessibilityLabel:", THAccessibilityLocalizedString((uint64_t)CFSTR("open.close.chapter.button")));
}

@end
