@implementation UILibArchiveStreamingReader

uint64_t __60___UILibArchiveStreamingReader_readAllItemsWithBlock_error___block_invoke()
{
  return 1;
}

uint64_t __64___UILibArchiveStreamingReader_readLogicalItemsWithBlock_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldReportAsLogicalItem:withConfirmedAppleDoubleFiles:", a2, a3);
}

void __89___UILibArchiveStreamingReader__shouldReportAsLogicalItem_withConfirmedAppleDoubleFiles___block_invoke()
{
  void *v0;

  v0 = (void *)_MergedGlobals_1014;
  _MergedGlobals_1014 = (uint64_t)&unk_1E1A93320;

}

@end
