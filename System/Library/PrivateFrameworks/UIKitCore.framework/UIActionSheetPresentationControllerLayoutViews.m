@implementation UIActionSheetPresentationControllerLayoutViews

uint64_t __UIActionSheetPresentationControllerLayoutViews_block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  return objc_msgSend(v1, "setFrame:");
}

@end
