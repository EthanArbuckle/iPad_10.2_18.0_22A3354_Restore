@implementation WQA

uint64_t __35___WQA_HostDeallocNotifier_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "quickActionHostDidInvalidate");
}

@end
