@implementation _UICollectionViewListCellVisualProvider_iOS

- (void)configureFocusedFloatingContentView:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UICollectionViewListCellVisualProvider.m"), 61, CFSTR("Floating Content View is not supported on iOS"));

}

@end
