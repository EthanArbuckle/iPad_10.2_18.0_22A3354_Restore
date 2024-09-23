@implementation GGEventInstall

void __GGEventInstall_block_invoke(uint64_t a1)
{
  EnableFullSleepForRevCOrLater(1);
  os_release(*(void **)(a1 + 32));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

@end
