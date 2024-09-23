@implementation WKBackForwardListItem(SafariSharedUIExtras)

- (id)_safari_translationContextSnapshot
{
  return objc_getAssociatedObject(a1, (const void *)translationContextSnapshotKey);
}

- (void)_safari_setTranslationContextSnapshot:()SafariSharedUIExtras
{
  objc_setAssociatedObject(a1, (const void *)translationContextSnapshotKey, a3, (void *)1);
}

- (id)safari_highlight
{
  return objc_getAssociatedObject(a1, (const void *)highlightKey);
}

- (void)safari_setHighlight:()SafariSharedUIExtras
{
  objc_setAssociatedObject(a1, (const void *)highlightKey, a3, (void *)1);
}

@end
