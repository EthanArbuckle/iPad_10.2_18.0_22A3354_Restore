@implementation UICollectionViewDiffableDataSource(AccessibilityPriv)

- (void)_setAccessibilityDiffableDataSourceAnnotator:()AccessibilityPriv
{
  id v4;

  v4 = _Block_copy(aBlock);
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("_accessibilityDiffableDataSourceAnnotator"));

}

- (uint64_t)_accessibilityDiffableDataSourceAnnotator
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_accessibilityDiffableDataSourceAnnotator"));
}

@end
