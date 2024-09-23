@implementation WFManagedObjectModelsFromCurrentToLatest

uint64_t __WFManagedObjectModelsFromCurrentToLatest_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

@end
