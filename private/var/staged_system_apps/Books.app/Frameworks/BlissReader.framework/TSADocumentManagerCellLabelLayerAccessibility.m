@implementation TSADocumentManagerCellLabelLayerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerCellLabelLayer");
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
  id result;

  result = -[TSADocumentManagerCellLabelLayerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_text"));
  if (result)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("rename.label %@")), result);
  return result;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("grid.cell.document.edit.name.hint.iOS"));
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = -[TSADocumentManagerCellLabelLayerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_cell"));
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, "tsaxValueForKey:", CFSTR("_gridView"));
    v5 = objc_msgSend(v4, "tsaxValueForKey:", CFSTR("gridDelegate"));
    if ((objc_opt_respondsToSelector(v5, "gridView:didTapNameForCell:") & 1) != 0)
    {
      objc_msgSend(v5, "gridView:didTapNameForCell:", v4, v3);
    }
    else
    {
      if ((objc_opt_respondsToSelector(v5, "gridView:didTapCell:") & 1) == 0)
      {
        LOBYTE(v2) = 0;
        return (char)v2;
      }
      objc_msgSend(v5, "gridView:didTapCell:", v4, v3);
    }
    LOBYTE(v2) = 1;
  }
  return (char)v2;
}

@end
