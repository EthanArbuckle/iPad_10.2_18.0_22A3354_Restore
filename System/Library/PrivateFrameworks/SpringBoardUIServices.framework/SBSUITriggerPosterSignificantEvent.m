@implementation SBSUITriggerPosterSignificantEvent

uint64_t __SBSUITriggerPosterSignificantEvent_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

@end
