@implementation UIDraggingImageSlotOwner

uint64_t __36___UIDraggingImageSlotOwner_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteSlots:", *(_QWORD *)(a1 + 40));
}

@end
