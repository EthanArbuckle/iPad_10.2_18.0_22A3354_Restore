@implementation NSObject(AXScanner)

- (void)_accessibilityProcessScannerGroupElementPieces:()AXScanner
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  +[UIAccessibilityElementTraversalOptions defaultSwitchControlOptions](UIAccessibilityElementTraversalOptions, "defaultSwitchControlOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v5);

}

- (uint64_t)_accessibilityScannerGroupElements
{
  return 0;
}

- (uint64_t)_accessibilityTreatCollectionViewRowsAsScannerGroups
{
  return 0;
}

- (uint64_t)_accessibilityCollectionViewItemsPerRow
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_accessibilityShouldBeScannedIfAncestorCanScroll
{
  return 0;
}

- (uint64_t)_accessibilityScanningBehaviorTraits
{
  return 31;
}

- (uint64_t)_accessibilityGroupIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityIsScannerGroup
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("UIAccessibilityStorageKeyIsScannerGroup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = (objc_msgSend(a1, "_accessibilityIsTouchContainer") & 1) != 0
      || objc_msgSend(a1, "_accessibilityHasOrderedChildren")
      && objc_msgSend(a1, "accessibilityElementCount") > 0
      || objc_msgSend(a1, "accessibilityNavigationStyle") != 0;

  return v4;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("UIAccessibilityStorageKeyScannerGroupTraits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (int)objc_msgSend(v2, "intValue");
  }
  else if (objc_msgSend(a1, "accessibilityNavigationStyle") == 2)
  {
    v4 = 256;
  }
  else
  {
    v4 = (unint64_t)(objc_msgSend(a1, "accessibilityNavigationStyle") == 1) << 7;
  }

  return v4;
}

- (uint64_t)_accessibilitySetIsScannerGroup:()AXScanner
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("UIAccessibilityStorageKeyIsScannerGroup"));
}

- (uint64_t)_accessibilitySetScannerGroupTraits:()AXScanner
{
  return objc_msgSend(a1, "_accessibilitySetIntegerValue:forKey:", a3, CFSTR("UIAccessibilityStorageKeyScannerGroupTraits"));
}

- (uint64_t)_accessibilityScannerActivateBehavior
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_getAssociatedObject(a1, &UIAccessibilityStorageKeyScannerActivateBehavior);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = (int)objc_msgSend(v1, "intValue");
  else
    v3 = 0;

  return v3;
}

- (void)_accessibilitySetScannerActivateBehavior:()AXScanner
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &UIAccessibilityStorageKeyScannerActivateBehavior, v2, (void *)1);

}

@end
