@implementation RCFoldersSelectionCollectionViewHeaderCell

- (BOOL)_shouldUseAccompaniedSidebarStyle
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "folderSelectionCollectionViewHeaderCellUsesAccompaniedSidebarStyle");

  return v3;
}

@end
