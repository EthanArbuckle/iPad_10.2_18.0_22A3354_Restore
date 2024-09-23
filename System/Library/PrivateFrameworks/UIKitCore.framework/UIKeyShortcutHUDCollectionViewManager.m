@implementation UIKeyShortcutHUDCollectionViewManager

uint64_t __98___UIKeyShortcutHUDCollectionViewManager_client_flashCellIfPossibleAtIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFlashing:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_collectionView:updateSeparatorVisibilityForCellAtIndexPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

@end
