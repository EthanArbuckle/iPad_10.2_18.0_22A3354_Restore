@implementation TSDMultiPaneControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDMultiPaneController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSKPopoverBasedViewControllerAccessibility, a2);
}

@end
