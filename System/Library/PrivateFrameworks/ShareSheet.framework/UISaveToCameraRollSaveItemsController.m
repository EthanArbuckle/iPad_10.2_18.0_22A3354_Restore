@implementation UISaveToCameraRollSaveItemsController

uint64_t __58___UISaveToCameraRollSaveItemsController_beginSavingItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didCompleteSavingItem:error:contextInfo:", *(_QWORD *)(a1 + 40), a3, 0);
}

uint64_t __83___UISaveToCameraRollSaveItemsController__didCompleteSavingItem_error_contextInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteDidCompleteSavingItem:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
