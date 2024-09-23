@implementation TSADocumentManagerCellImageLayerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerCellImageLayer");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return objc_msgSend(-[TSADocumentManagerCellImageLayerAccessibility accessibilityContainer](self, "accessibilityContainer"), "accessibilityLabel");
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("grid.cell.document.hint.iOS"));
}

- (unint64_t)accessibilityTraits
{
  return (unint64_t)objc_msgSend(-[TSADocumentManagerCellImageLayerAccessibility accessibilityContainer](self, "accessibilityContainer"), "accessibilityTraits");
}

@end
