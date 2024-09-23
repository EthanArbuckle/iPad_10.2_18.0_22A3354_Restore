@implementation TSADocumentManagerCellAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSADocumentManagerCell");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  -[TSADocumentManagerCellAccessibility tsaxInvalidateChildrenImmediately](self, "tsaxInvalidateChildrenImmediately");
  v3.receiver = self;
  v3.super_class = (Class)TSADocumentManagerCellAccessibility;
  -[TSADocumentManagerCellAccessibility dealloc](&v3, "dealloc");
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  objc_msgSend(a3, "setAccessibilityContainer:", 0);
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = -[TSADocumentManagerCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_imageLayer"));
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "setAccessibilityContainer:", self);
    objc_msgSend(a3, "addObject:", v6);
  }
  v7 = -[TSADocumentManagerCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_labelLayer"));
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setAccessibilityContainer:", self);
    objc_msgSend(a3, "addObject:", v8);
  }
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = -[TSADocumentManagerCellAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_labelLayer"));
  v3 = objc_msgSend(v2, "tsaxValueForKey:", CFSTR("_text"));
  v4 = objc_msgSend(v2, "tsaxValueForKey:", CFSTR("_dateString"));
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSADocumentManagerCellAccessibility;
  v3 = -[TSADocumentManagerCellAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[TSADocumentManagerCellAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isSelected"));
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

@end
